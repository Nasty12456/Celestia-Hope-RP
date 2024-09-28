if Config.Framework ~= 'esx' then
    return
end

userTable = 'users'                 -- users
identifierColumn = 'identifier'     -- identifier
accountsColumn = 'accounts'
fiveguardresourcename = 'fiveguard' -- Five Ward anticheat name

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(id)
    HandleLoadPlayer(id)
end)

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetPlayerFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

function AddMoneyToAccount(account, amount, isNotRent)
    local source = GetPlayerSourceFromIdentifier(account)
    if source then
        AddAccountMoney(source, 'bank', amount)
        if isNotRent then return end
        TriggerClientEvent('qb-houses:sendTextMessage', source, Lang('HOUSING_NOTIFICATION_RENT_PAYMENT') .. amount, 'error')
    else
        local result = MySQL.Sync.fetchAll('SELECT ' .. accountsColumn .. ' FROM ' .. userTable .. ' WHERE ' .. identifierColumn .. ' = ?', { account })
        if not result[1] then return print('Add Money Account : Not finded this account: ' .. account) end
        local accounts = Config.Framework == 'qbcore' and result[1].money or result[1].accounts
        accounts = json.decode(accounts)
        accounts.bank = accounts.bank + amount
        MySQL.Sync.execute('UPDATE ' .. userTable .. ' SET ' .. accountsColumn .. ' = ? WHERE ' .. identifierColumn .. ' = ?', {
            json.encode(accounts),
            account
        })
    end
end

function RemoveMoneyFromAccount(account, amount, dontCheck)
    local source = GetPlayerSourceFromIdentifier(account)
    if source then
        RemoveAccountMoney(source, 'bank', amount)
        return true
    else
        local player = MySQL.Sync.fetchAll('SELECT ' .. accountsColumn .. ' FROM ' .. userTable .. ' WHERE ' .. identifierColumn .. ' = ?', { account })
        if player[1] then
            local accounts = Config.Framework == 'qbcore' and player[1].money or player[1].accounts
            accounts = json.decode(accounts)
            if accounts.bank >= amount or dontCheck then
                accounts.bank = accounts.bank - amount
                MySQL.Sync.execute('UPDATE ' .. userTable .. ' SET ' .. accountsColumn .. ' = ? WHERE ' .. identifierColumn .. ' = ?', { json.encode(accounts), account })
                return true
            end
        end
    end
    return false
end

function GetJobName(source)
    local player = GetPlayerFromId(source)
    if not player then return '' end
    return player.getJob().name
end

function GetCharacterName(source)
    local xPlayer = GetPlayerFromId(source)
    local firstName, lastName
    if xPlayer.get and xPlayer.get('firstName') and xPlayer.get('lastName') then
        firstName = xPlayer.get('firstName')
        lastName = xPlayer.get('lastName')
    else
        local name = MySQL.Sync.fetchAll('SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier', { ['@identifier'] = ESX.GetIdentifier(source) })
        firstName, lastName = name[1]?.firstname or ESX.GetPlayerName(source), name[1]?.lastname or ''
    end

    return firstName, lastName
end

function GetAccountMoney(source, account)
    local player = GetPlayerFromId(source)
    return player.getAccount(account).money
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    player.addAccountMoney(account, amount)
end

function RemoveAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    player.removeAccountMoney(account, amount)
end

function RemoveItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.removeInventoryItem(item, count)
end

function GetIdentifier(source)
    local player = GetPlayerFromId(source)
    if not player then
        return false
    end
    return player.identifier
end

function GetPlayerSourceFromIdentifier(identifier)
    local player = GetPlayerFromIdentifier(identifier)
    if not player then
        return false
    end
    return player.source
end

function GetPlayerSourceFromSource(source)
    local player = GetPlayerFromId(source)
    if not player then
        return false
    end
    return player.source
end

function GetCharacterFromIdentifier(identifier)
    local result = MySQL.Sync.fetchAll('SELECT * FROM `users` WHERE identifier = ?', { identifier })
    if not result[1] then
        return '', ''
    end
    result = result[1]
    return result?.firstname, result?.lastname
end

RegisterServerCallback('qb-houses:GetInside', function(source, cb)
    local src = source
    local identifier = GetIdentifier(src)
    if Config.Framework == 'qb' then
        local player = GetPlayerFromId(src)
        return cb(player.PlayerData.metadata['inside'])
    end
    local fetch = ([[
		SELECT inside
		FROM %s
		WHERE %s = @id;
	]]):format(userTable, identifierColumn)
    local fetchData = { ['@id'] = identifier }
    local result = MySQL.Sync.fetchAll(fetch, fetchData)
    if result and result[1] then
        cb(result[1].inside)
    else
        cb(false)
    end
end)

function GetPlayerSQLDataFromIdentifier(identifier)
    local result = MySQL.Sync.fetchAll('SELECT * FROM `users` WHERE identifier = ?', { identifier })
    if result[1] then
        return result[1]
    end
    return false
end

function UpdateInside(src, insideId, bool)
    local identifier = GetIdentifier(src)
    local update = ([[
			UPDATE %s SET inside = @inside
			WHERE %s = @id;
	]]):format(userTable, identifierColumn)
    local updateData = {
        ['@inside'] = insideId,
        ['@id'] = identifier
    }
    if bool then
        MySQL.Sync.execute(update, updateData)
    else
        updateData = {
            ['@inside'] = nil,
            ['@id'] = identifier
        }
        MySQL.Sync.execute(update, updateData)
    end
end

RegisterServerCallback('qb-phone:server:MeosGetPlayerHouses', function(source, cb, input)
    if input then
        local search = escape_sqli(input)
        local searchData = {}
        local query = 'SELECT * FROM `' .. userTable .. '` WHERE `' .. identifierColumn .. '` = "' .. search .. '"'
        -- Split on " " and check each var individual
        local searchParameters = SplitStringToArray(search)
        -- Construct query dynamicly for individual parm check
        if #searchParameters > 1 then
            query = query .. ' OR `firstname` LIKE "%' .. searchParameters[1] .. '%" OR `lastname` LIKE "%' .. searchParameters[1] .. '%"'
            for i = 2, #searchParameters do
                query = query .. ' OR `firstname` LIKE "%' .. searchParameters[i] .. '%" OR `lastname` LIKE "%' .. searchParameters[i] .. '%"'
            end
        else
            query = query .. ' OR `firstname` LIKE "%' .. search .. '%" OR `lastname` LIKE "%' .. search .. '%"'
        end
        local result = MySQL.Sync.fetchAll(query)
        if result[1] then
            local houses = MySQL.Sync.fetchAll('SELECT * FROM player_houses WHERE citizenid = ?',
                { result[1][identifierColumn] })
            if houses[1] then
                for k, v in pairs(houses) do
                    local charinfo = {
                        firstname = result[1].firstname,
                        lastname = result[1].lastname,
                    }
                    searchData[#searchData + 1] = {
                        name = v.house,
                        keyholders = v.keyholders,
                        owner = v.citizenid,
                        price = Config.Houses[v.house].price,
                        label = Config.Houses[v.house].address,
                        tier = Config.Houses[v.house].tier,
                        garage = Config.Houses[v.house].garage,
                        charinfo = charinfo,
                        coords = {
                            x = Config.Houses[v.house].coords.enter.x,
                            y = Config.Houses[v.house].coords.enter.y,
                            z = Config.Houses[v.house].coords.enter.z
                        }
                    }
                end
                cb(searchData)
            end
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

userTable = 'players'               -- users
identifierColumn = 'citizenid'      -- identifier
accountsColumn = 'money'
fiveguardresourcename = 'fiveguard' -- Five Ward anticheat name

RegisterNetEvent('QBCore:Server:PlayerLoaded')
AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
    HandleLoadPlayer(player.PlayerData.source)
end)

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function GetPlayerFromIdentifier(identifier)
    return QBCore.Functions.GetPlayerByCitizenId(identifier)
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

function GetJobName(source)
    local player = GetPlayerFromId(source)
    if not player then return '' end
    return player.PlayerData.job.name
end

function GetCharacterName(source)
    local player = GetPlayerFromId(source).PlayerData.charinfo
    return player.firstname, player.lastname
end

function GetAccountMoney(source, account)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    if account == 'black_money' then account = 'crypto' end
    return player.PlayerData.money[account]
end

function AddAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.AddMoney(account, amount)
end

function RemoveAccountMoney(source, account, amount)
    local player = GetPlayerFromId(source)
    if account == 'money' then account = 'cash' end
    player.Functions.RemoveMoney(account, amount)
end

function RemoveItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.Functions.RemoveItem(item, count)
end

function GetIdentifier(source)
    local player = GetPlayerFromId(source)
    if not player then return false end
    return player.PlayerData.citizenid
end

function GetPlayerSourceFromIdentifier(identifier)
    local player = GetPlayerFromIdentifier(identifier)
    if not player then return false end
    return player.PlayerData.source
end

function GetPlayerSourceFromSource(source)
    local player = GetPlayerFromId(source)
    if not player then
        return false
    end
    return player.PlayerData.source
end

function GetCharacterFromIdentifier(identifier)
    local result = MySQL.Sync.fetchAll('SELECT charinfo FROM `players` WHERE citizenid = ?', { identifier })
    if not result[1] then
        return '', ''
    end
    result = result[1]
    result = json.decode(result.charinfo)
    return result?.firstname, result?.lastname
end

function RemoveMoneyFromAccount(account, amount, dontCheck)
    local source = GetPlayerSourceFromIdentifier(account)
    if source then
        RemoveAccountMoney(source, 'bank', amount)
        return true
    else
        local player = MySQL.Sync.fetchAll('SELECT ' .. accountsColumn .. ' FROM ' .. userTable .. ' WHERE ' .. identifierColumn .. ' = ?', { account })
        if player[1] then
            local accounts = player[1].money
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
    local result = MySQL.Sync.fetchAll('SELECT * FROM `players` WHERE citizenid = ? LIMIT 1', { identifier })
    if result[1] then
        return result[1]
    end
    return false
end

function UpdateInside(src, insideId, bool)
    local Player = GetPlayerFromId(src)
    local insideMeta = Player.PlayerData.metadata['inside']
    if bool then
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = insideId
        Player.Functions.SetMetaData('inside', insideMeta)
    else
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = nil
        Player.Functions.SetMetaData('inside', insideMeta)
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

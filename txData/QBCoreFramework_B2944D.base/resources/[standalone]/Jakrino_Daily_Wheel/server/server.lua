-- | |        | |          | |                         
-- | |_ _ __  | | ___  __ _| | _____        __ _  __ _ 
-- | __| '__| | |/ _ \/ _` | |/ / __|      / _` |/ _` |
-- | |_| |    | |  __/ (_| |   <\__ \  _  | (_| | (_| |
--  \__|_|    |_|\___|\__,_|_|\_\___/ (_)  \__, |\__, |
--                                          __/ | __/ |
--                                         |___/ |___/ 





local Core, CoreName, cycleDay = nil, nil, nil

if GetResourceState('qb-core') == 'started' then
    Core = exports['qb-core']:GetCoreObject()
    while Core == nil do
        TriggerEvent('QBCore:GetObject', function(obj) Core = obj end)
        Wait(30)
    end
    CoreName = 'qb-core'
elseif GetResourceState('es_extended') == 'started' then
    Core = exports['es_extended']:getSharedObject()
    while Core == nil do
        TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
        Wait(30)
    end
    CoreName = 'es_extended'
else
    Core = 'not_found'
    CoreName = 'standlone'
end

-- Function's
function RegisterCallback(name, cb)
    RegisterNetEvent(name, function(id, args)
        local src = source
        local eventName = "Jakrino_Daily_Wheel:TC:" .. id
        CreateThread(function()
            local result = cb(src, table.unpack(args))
            TriggerClientEvent(eventName, src, result)
        end)
    end)
end

function ExecuteSql(query, parameters, cb)
    local promise = promise:new()
    local isBusy = true
    if Config.SQLScript == "oxmysql" then
        exports.oxmysql:execute(query, parameters, function(data)
            promise:resolve(data)
            isBusy = false

            if cb then
                cb(data)
            end
        end)
    elseif Config.SQLScript == "ghmattimysql" then
        exports.ghmattimysql:execute(query, parameters, function(data)
            promise:resolve(data)
            isBusy = false

            if cb then
                cb(data)
            end
        end)
    elseif Config.SQLScript == "mysql-async" then
        MySQL.Async.fetchAll(query, parameters, function(data)
            promise:resolve(data)
            isBusy = false
            if cb then
                cb(data)
            end
        end)
    end
    while isBusy do
        Wait(0)
    end
    return Citizen.Await(promise)
end

function generateRandomPlate()
    local plate = ""
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    for i = 1, 8 do
        local randomNumber = math.random(1, #characters)
        plate = plate .. string.sub(characters, randomNumber, randomNumber)
    end
    return plate
end

function GeneratePlate()
    local plate = generateRandomPlate()
    local result = nil
    if CoreName == 'qb-core' then
        ExecuteSql('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    elseif CoreName == 'es_extended' then
        ExecuteSql('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
    end
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

-- Callback's
RegisterCallback('getPlayerDetails', function(source, cb)
    local src = source
    local identifier = nil
    if CoreName == 'qb-core' then
        local Player = Core.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    elseif CoreName == 'es_extended' then
        local Player = Core.GetPlayerFromId(src)
        identifier = Player.identifier
    end
    local osTime = os.time()
    local callbackData = {}
    local result = ExecuteSql("SELECT * FROM jakrino_dailywheel WHERE citizenid = '"..identifier.."'")
    if result[1] == nil then
        callbackData = {
            coinAmount = 1,
            nextRoll = 0,
            ostime = osTime,
            cycleDay = cycleDay
        }
    else
        callbackData = {
            coinAmount = result[1].coinAmount,
            nextRoll = tonumber(tostring(result[1].nextRoll):sub(1, 10)),
            ostime = osTime,
            cycleDay = cycleDay
        }
    end
    
    return callbackData
end)

RegisterCallback('spinWheel', function(source, cb)
    local src = source
    local identifier = nil
    if CoreName == 'qb-core' then
        local Player = Core.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    elseif CoreName == 'es_extended' then
        local Player = Core.GetPlayerFromId(src)
        identifier = Player.identifier
    end
    local callbackData = {}
    local nextTime = os.time() + (Config.SpinPeriod * 3600)
    local osTime = os.time()
    local result = ExecuteSql("SELECT * FROM jakrino_dailywheel WHERE citizenid = '"..identifier.."'")
    if result[1] == nil then
        ExecuteSql("INSERT INTO jakrino_dailywheel SET citizenid = '"..identifier.."', nextRoll = '"..nextTime.."'")
        callbackData = { nextRoll = nextTime, osTime = osTime }
    else
        if result[1].coinAmount >= 1 then
            if tonumber(tostring(result[1].nextRoll):sub(1, 10)) - osTime <= 0 then
                ExecuteSql("UPDATE jakrino_dailywheel SET nextRoll = '"..nextTime.."' WHERE citizenid = '"..identifier.."'")
                callbackData = { nextRoll = nextTime, osTime = osTime, coinAmount = result[1].coinAmount }
            else
                ExecuteSql("UPDATE jakrino_dailywheel SET coinAmount = coinAmount - 1 WHERE citizenid = '"..identifier.."'")
                callbackData = { nextRoll = nextTime, osTime = osTime, coinAmount = result[1].coinAmount - 1 }
            end
        else
            if tonumber(tostring(result[1].nextRoll):sub(1, 10)) - osTime <= 0 then
                ExecuteSql("UPDATE jakrino_dailywheel SET nextRoll = '"..nextTime.."' WHERE citizenid = '"..identifier.."'")
                callbackData = { nextRoll = nextTime, osTime = osTime }
            else
                callbackData = nil
            end
        end
    end

    return callbackData
end)

RegisterCallback("sendInput", function(source, data)
    local src = source
    local identifier = nil
    if CoreName == 'qb-core' then
        local Player = Core.Functions.GetPlayer(src)
        identifier = Player.PlayerData.citizenid
    elseif CoreName == 'es_extended' then
        local Player = Core.GetPlayerFromId(src)
        identifier = Player.identifier
    end
    local inputData = data.input
    local result = ExecuteSql("SELECT * FROM jakrino_dailywheel_codes WHERE code = '"..inputData.."'")
    if result[1] ~= nil then
        ExecuteSql("DELETE FROM jakrino_dailywheel_codes WHERE code = '"..inputData.."'")
        ExecuteSql("UPDATE jakrino_dailywheel SET coinAmount = coinAmount + '"..result[1].coinAmount.."' WHERE citizenid = '"..identifier.."'")
        return result[1].coinAmount
    else
        return false
    end
end)

RegisterCallback("getCurrentDay", function(source)
    return cycleDay
end)

RegisterCallback("Claimed", function(source, data)
    local src = source
    local identifier = nil
    local Player = nil
    if CoreName == 'qb-core' then
        Player = Core.Functions.GetPlayer(source)
        if Player then identifier = Player.PlayerData.citizenid end
    elseif CoreName == 'es_extended' then
        Player = Core.GetPlayerFromId(source)
        if Player then identifier = Player.identifier end
    end
    if identifier then
        local existingData = ExecuteSql("SELECT * FROM jakrino_dailywheel WHERE citizenid = ?", {identifier})
        if existingData and existingData[1] then
            local Reward = Config.Days[tonumber(cycleDay)][tonumber(data)]
            if Reward.itemType == "money" then
                if CoreName == 'qb-core' then
                    Player.Functions.AddMoney(Config.MoneyType, Reward.itemCount)
                elseif CoreName == 'es_extended' then
                    if Config.MoneyType == "bank" then
                        Player.addAccountMoney(Config.MoneyType, Reward.itemCount)
                    elseif Config.MoneyType == "cash" then
                        Player.addMoney(Reward.itemCount)
                    end
                end
                return true
            elseif Reward.itemType == "item" then
                if CoreName == 'qb-core' then
                    Player.Functions.AddItem(Reward.itemName, Reward.itemCount)
                elseif CoreName == 'es_extended' then
                    Player.Functions.addInventoryItem(Reward.itemName, Reward.itemCount)
                end
                return true
            elseif Reward.itemType == "vehicle" then
                if CoreName == 'qb-core' then
                    local plate = GeneratePlate()
                    ExecuteSql("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", {Player.PlayerData.license, identifier, Reward.itemName, GetHashKey(Reward.itemName), '{"model": "'.. GetHashKey(Reward.itemName) .. '","plate": "'.. plate .. '"}', plate, Config.DefaultGarage, 1})
                elseif CoreName == 'es_extended' then
                    local plate = GeneratePlate()
                    ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored, parking) VALUES (?, ?, ?, ?, ?, ?)", {identifier, plate, '{"model": "'.. GetHashKey(Reward.itemName) .. '","plate": "'.. plate .. '"}', 'car', 1, Config.DefaultGarage})
                end
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end)

RegisterCommand('purchase_dailywheel_coin', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local coinAmount = dec.coinAmount
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM jakrino_dailywheel_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil and coinAmount ~= nil and tbxid ~= nil then
            ExecuteSql("INSERT INTO jakrino_dailywheel_codes (code, coinAmount) VALUES ('"..tbxid.."', '"..coinAmount.."')")
        end
        inProgress = false
    end
end)

CreateThread(function()
    while true do
        local currentDate = os.date("*t")
        local startDate = os.time({
            day = Config.StartDay.day,
            month = Config.StartDay.month,
            year = Config.StartDay.year,
            hour = 0,
            min = 0,
            sec = 0
        })
        local daysPassed = os.difftime(os.time(currentDate), startDate) / (24 * 60 * 60)
        cycleDay = ((math.floor(daysPassed) % 5) + 5) % 5 + 1
        Wait(1000 * 60 * 60 * 1)
    end
end)


local Core, CoreName = nil, nil

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
function TriggerCallback(name, ...)
    local id = GetRandomIntInRange(0, 999999)
    local eventName = "Jakrino_Daily_Wheel:TC:" .. id
    local eventHandler
    local promise = promise:new()
    RegisterNetEvent(eventName)
    local eventHandler = AddEventHandler(eventName, function(...)
        promise:resolve(...)
    end)

    SetTimeout(15000, function()
        promise:resolve("timeout")
        RemoveEventHandler(eventHandler)
    end)
    local args = {...}
    TriggerServerEvent(name, id, args)

    local result = Citizen.Await(promise)
    RemoveEventHandler(eventHandler)
    return result
end

-- Callback's
RegisterNUICallback("Close", function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('spinWheel', function(data, cb)
    local result = TriggerCallback("spinWheel")
    if result ~= nil then 
        local coinAmount = result.coinAmount ~= nil and result.coinAmount or 0
        local nextRoll = result.nextRoll ~= nil and result.nextRoll or 0
        local ostime = result.osTime ~= nil and result.osTime or 0
        local remainingTime = disp_time((nextRoll - 1) - ostime)
        local callback = {
            selectedItem = selectedItem,
            serverSide = remainingTime,
            coinAmount = coinAmount,
        }
        cb(callback)
    else
        cb(false)
    end
end)

local sendInputSpamProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		local result = TriggerCallback("sendInput", data)
        if result then
            cb(tonumber(result))
        else
            cb(false)
        end
    else
        cb(false)
	end
end)

RegisterNUICallback("Claimed", function(data, cb)
    TriggerCallback("Claimed", data)
    cb('ok')
end)

CreateThread(function()
    if CoreName == 'qb-core' then
        RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            TriggerEvent('Jakrino_Daily_Wheel:Client:StartUI')
        end)
    elseif CoreName == 'es_extended' then
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function()
            TriggerEvent('Jakrino_Daily_Wheel:Client:StartUI')
        end)
    end
end)

RegisterNetEvent('onResourceStart')
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        while true do
            if GetResourceState(GetCurrentResourceName()) == 'started' then
                TriggerEvent('Jakrino_Daily_Wheel:Client:StartUI')
                break;
            else
                Wait(100)
            end
        end
	end
end)

RegisterNetEvent('Jakrino_Daily_Wheel:Client:StartUI')
AddEventHandler('Jakrino_Daily_Wheel:Client:StartUI', function()
    SendNUIMessage({
        bool = 'update',
        locs = Locales[Config.Locales],
        tebx = Config.TebexPageLink,
        days = Config.Days[TriggerCallback('getCurrentDay')],
    })
end)

RegisterCommand(Config.Command["Name"], function(source, args, rawCommand)
    local result = TriggerCallback('getPlayerDetails')
    local timeX = result.ostime
    local expireTimeX = result.nextRoll
    local remainingTime = disp_time(expireTimeX - timeX)
    if tonumber(expireTimeX) ~= 0 and expireTimeX - timeX <= 0 then
        remainingTime = disp_time(Config.SpinPeriod * 3600)
        result.coinAmount = result.coinAmount + 1
    end
    SendNUIMessage({
        bool = 'open',
        remaining = remainingTime,
        myCoinAmount = result.coinAmount,
        cycleDay = result.cycleDay
    })
    SetNuiFocus(true, true)
end, false)

TriggerEvent('chat:addSuggestion', '/'..Config.Command["Name"], Config.Command["Description"])

function disp_time(time)
    local days = math.floor(time/86400)
    local remaining = time % 86400
    local hours = math.floor(remaining/3600)
    remaining = remaining % 3600
    local minutes = math.floor(remaining/60)
    remaining = remaining % 60
    local seconds = remaining
    if (hours < 10) then
        hours = "0" .. tostring(hours)
    end
    if (minutes < 10) then
        minutes = "0" .. tostring(minutes)
    end
    if (seconds < 10) then
        seconds = "0" .. tostring(seconds)
    end
    if days > 0 then 
        answer = tostring(days)..'d '..hours..'h '..minutes..'m'
    else
        if tonumber(hours) > 0 then 
            answer = hours..'h '..minutes..'m'
        else
            answer = minutes..'m'
        end
    end
    return answer
end
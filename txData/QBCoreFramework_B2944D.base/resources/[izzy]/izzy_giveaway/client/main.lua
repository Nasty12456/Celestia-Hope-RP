local joined = false
local starTimer = false
local timeLeft = 0

RegisterCommand("focus", function()
    SetNuiFocus(1, 1)
end)

--## NUI CALLBACKS ##--
RegisterNUICallback("join", function(_, cb)
    SetNuiFocus(0, 0)
    triggerServerCallback("izzy_giveaway:join", function(canJoin)
        if canJoin then
            joined = true
        end
        cb(canJoin)
    end)
end)

RegisterNUICallback("close", function(_, cb)
    SetNuiFocus(0, 0)
end)

RegisterNUICallback("notify", function(msg)
    Config.Notify(Translations[msg], "error", 5000)
end)

RegisterNUICallback("create", function(data)
    TriggerServerEvent("izzy_giveaway:create", data)
end)

--## PLAYER LOADED ##--
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("izzy_giveaway:joined")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent("izzy_giveaway:joined")
end)

--## EVENTS ##--
RegisterNetEvent("izzy_giveaway:refresh", function(players)
    SendNUIMessage({
        action = "refresh",
        players = players,
    })
end)

RegisterNetEvent("izzy_giveaway:openCreateMenu", function()
    SetNuiFocus(1, 1)
    SendNUIMessage({
        action = "createMenu",
    })
end)

RegisterNetEvent("izzy_giveaway:sendTime", function(time)
    SendNUIMessage({
        action = "sendTime",
        time = time
    })
end)

RegisterNetEvent("izzy_giveaway:start", function(data, laterJoin, laterTime)
    local minutes = laterJoin and laterTime or data.time
    local gift = data.label
    local price = data.joinCoss
    local maxPlayer = data.maxplayers

    if laterJoin then Wait(5000) end
 
    SendNUIMessage({
        action = "start",
        gift = gift,
        minutes = minutes,
        price = price,
        maxPlayer = maxPlayer,
    })
end)

RegisterNetEvent("izzy_giveaway:finish", function(winners, gift)
    SendNUIMessage({
        action = "finish",
        gift = gift,
        winners = winners,
    })
    starTimer = false
end)

RegisterNetEvent("izzy_giveaway:noWinners", function(winners, gift)
    SendNUIMessage({
        action = "noWinners",
        gift = gift,
    })
    starTimer = false
end)

RegisterNetEvent("izzy_giveaway:notify", function(msg)
    Config.Notify(Translations[msg], "error", 5000)
end)

RegisterNetEvent("izzy_giveaway:client:updateProperties", function(plate, model)
    Framework.Game.SpawnVehicle(model, GetEntityCoords(PlayerPedId()), 0.0, function(vehicle) --get vehicle info	
        if DoesEntityExist(vehicle) then
            SetEntityVisible(vehicle, false, false)
            SetEntityCollision(vehicle, false)	
            
            local vehicleProps = Framework.Game.GetVehicleProperties(vehicle)
            vehicleProps.plate = plate
            Framework.Game.DeleteVehicle(vehicle)	
            TriggerServerEvent("izzy_giveaway:server:updateProperties", plate, json.encode(vehicleProps))
        end
    end)
end)
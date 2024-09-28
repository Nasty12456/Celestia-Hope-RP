Framework = nil
PlayerData = {}
madCore = {}

Citizen.CreateThread(function()
    if Config.framework.name == "ESX" then
        while not Framework do 
            pcall(function() Framework = exports[Config.framework.scriptName]:getSharedObject() end)
            if not Framework then
                TriggerEvent(Config.framework.eventName, function(library) 
                    Framework = library 
                end)
            end
            Citizen.Wait(1)
        end
    elseif Config.framework.name == "QB" then
        while not Framework do
            pcall(function() Framework =  exports[Config.framework.scriptName]:GetCoreObject() end)
            if not Framework then
                pcall(function() Framework =  exports[Config.framework.scriptName]:GetSharedObject() end)
            end
            if not Framework then
                TriggerEvent(Config.framework.eventName, function(obj) Framework = obj end)
            end
            Citizen.Wait(1)
        end
    end
end)

madCore.TriggerCallback = function(cbName, cb, data)
    if Config.framework.name == "ESX" then
        Framework.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config.framework.name == "QB" then
        Framework.Functions.TriggerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    end
end

madCore.getPhrase = function(str)
    return Strings[str] or ('locale not found: %s'):format(str)
end

madCore.requestModel = function(model)
    if HasModelLoaded(model) then
        return
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end
end

madCore.requestAnim = function(animDict)
    if HasAnimDictLoaded(animDict) then
        return
    end
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end
end

madCore.loadPtfxAsset = function(ptfx)
    while not HasNamedPtfxAssetLoaded(ptfx) do
        RequestNamedPtfxAsset(ptfx)
        Citizen.Wait(50)
	end
end

madCore.getClosestVehicles = function(coords, maxDistance, ignoreEntities)
    local ped = PlayerPedId()
    ignoreEntities = ignoreEntities and ignoreEntities or {}
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local vehicles = GetGamePool('CVehicle')
    local maxDistance = maxDistance or 10
    local closestVehicles = {}
    for i = 1, #vehicles, 1 do
        local v = vehicles[i]
        if not ignoreEntities[v] then
            local vehicleCoords = GetEntityCoords(v)
            if maxDistance >= #(vehicleCoords - coords) then
                closestVehicles[#closestVehicles + 1] = v
            end
        end
    end
    return closestVehicles
end

madCore.getClosestVehicle = function(coords)
    local ped = PlayerPedId()
    ignoreEntities = ignoreEntities and ignoreEntities or {}
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local vehicles = madCore.getClosestVehicles(coords, 10, ignoreEntities)
    local closestDistance, closestVehicle = false
    for i = 1, #vehicles, 1 do
        local v = vehicles[i]
        if not ignoreEntities[v] then
            local vehicleCoords = GetEntityCoords(v)
            local distance = #(vehicleCoords - coords)
            if not closestDistance or closestDistance > distance then
                closestVehicle = v
                closestDistance = distance
            end
        end
    end
    return closestVehicle, closestDistance
end

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

RegisterNetEvent("boombox:client:showNotification", function(notify)
    ShowNotification(notify)
end)

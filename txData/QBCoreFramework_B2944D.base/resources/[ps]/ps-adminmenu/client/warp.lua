local QBCore = exports['qb-core']:GetCoreObject()

-- Listen for the event to warp the player into the nearest vehicle
RegisterNetEvent('ps-adminmenu:warpToNearestVehicle', function()
    local playerPed = PlayerPedId() -- Get the player's Ped ID
    local pos = GetEntityCoords(playerPed) -- Get player's current position

    local closestVehicle = nil
    local closestDistance = 1000.0 -- Start with a large value to find the nearest vehicle

    -- Search for the closest vehicle
    for vehicle in EnumerateVehicles() do
        local vehPos = GetEntityCoords(vehicle) -- Get the vehicle's position
        local distance = #(vehPos - pos) -- Calculate the distance between the player and the vehicle

        if distance < closestDistance then
            closestVehicle = vehicle
            closestDistance = distance
        end
    end

    -- Check if a vehicle was found
    if closestVehicle ~= nil then
        -- Warp the player into the driver's seat of the nearest vehicle
        TaskWarpPedIntoVehicle(playerPed, closestVehicle, -1) -- -1 is for the driver's seat
        TriggerEvent('QBCore:Notify', 'You have been warped into the nearest vehicle', 'success')
    else
        -- Notify the player if no vehicle was found nearby
        TriggerEvent('QBCore:Notify', 'No vehicle found nearby.', 'error')
    end
end)

-- Helper function to enumerate all vehicles in the world
function EnumerateVehicles()
    return coroutine.wrap(function()
        local handle, vehicle = FindFirstVehicle()
        local success

        if handle ~= -1 then
            success = true
        end

        repeat
            coroutine.yield(vehicle)
            success, vehicle = FindNextVehicle(handle)
        until not success

        EndFindVehicle(handle)
    end)
end

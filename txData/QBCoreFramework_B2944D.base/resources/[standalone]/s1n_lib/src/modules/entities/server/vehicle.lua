Entities = Entities or {}

-- Check if a player owns a vehicle by the plate
-- @param dataObject table The data object
-- @return boolean Whether the player owns the vehicle
function Entities:CheckVehicleOwnership(dataObject)
    local playerIdentifier = Framework:GetPlayerIdentifier(dataObject.playerSource)
    if not playerIdentifier then
        return false
    end

    if Framework:GetCurrentFrameworkName() == "esx" then
        local ownedVehiclesORM = ORM:new("owned_vehicles")
        local ownedVehiclesRow = ownedVehiclesORM:findOne({ "plate" }):where({ plate = dataObject.plate, owner = playerIdentifier }):execute()

        if not ownedVehiclesRow then
            return false
        end

        return true
    elseif Framework:GetCurrentFrameworkName() == "qbcore" then
        local playerVehiclesORM = ORM:new("player_vehicles")
        local playerVehiclesRow = playerVehiclesORM:findOne({ "plate" }):where({ plate = dataObject.plate, citizenid = playerIdentifier }):execute()

        if not playerVehiclesRow then
            return false
        end

        return true
    end

    return false
end
exports("checkVehicleOwnership", function(...)
    return Entities:CheckVehicleOwnership(...)
end)

RegisterServerEvent("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end

    -- Registering events
    EventManager:registerEvent("isVehicleOwned", function(playerSource, callback, dataObject)
        if not dataObject.playerSource then
            dataObject.playerSource = playerSource
        end

        callback(Entities:CheckVehicleOwnership(dataObject))
    end)
end)
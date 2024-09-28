Framework = Framework or {}

-- Get the vehicle model from the plate depending on the framework
-- @param plate string The license plate of the vehicle
-- @return string | boolean The vehicle model or false if nothing is found
function Framework:GetVehicleModelFromPlate(dataObject)
    if self.currentFramework == "esx" then
        local vehiclesTable = ORM:new("owned_vehicles")
        local vehicleDB = vehiclesTable:find({ "vehicle" }):where({ plate = dataObject.plate }):execute()

        if not vehicleDB then
            Logger:error(("GetVehicleModelFomPlate: No vehicle found for plate=%s"):format(dataObject.plate))
            return
        end

        local vehicleData = json.decode(vehicleDB.vehicle)
        if not vehicleData then return end

        return vehicleData.model
    elseif self.currentFramework == "qbcore" then
        local vehiclesTable = ORM:new("player_vehicles")
        local vehicleDB = vehiclesTable:find({ "vehicle" }):where({ plate = dataObject.plate }):execute()

        if not vehicleDB then
            Logger:error(("GetVehicleModelFomPlate: No vehicle found for plate=%s"):format(dataObject.plate))
            return
        end

        return vehicleDB.vehicle
    end

    Logger:error(("No framework found for getting vehicle model from plate=%s"):format(dataObject.plate))

    return false
end
exports("getVehicleModelFromPlate", function(...)
    return Framework:GetVehicleModelFromPlate(...)
end)

-- Get the player's vehicles
-- @param dataObject table The data object
-- @param optionsObject (optional) table The options object
-- @return table|boolean The player's vehicles or false if the player is not found
-- TODO: WIP to replace GetPlayerVehicles in s1n_marketplace
function Framework:GetPlayerVehicles(dataObject, optionsObject)
    if self.currentFramework == "esx" then
        local vehiclesTable = ORM:new("owned_vehicles")
        local vehiclesRows = vehiclesTable:find(dataObject.columns):where({ owner = dataObject.identifier }):execute()

        if not vehiclesRows then
            Logger:error(("GetPlayerVehicles: No vehicles found for playerSource=%s"):format(dataObject.identifier))
            return
        end

        return vehiclesRows
    elseif self.currentFramework == "qbcore" then
        local vehiclesTable = ORM:new("player_vehicles")
        local vehiclesRows = vehiclesTable:find(dataObject.columns):where({ citizenid = dataObject.identifier }):execute()

        if not vehiclesRows then
            Logger:error(("GetPlayerVehicles: No vehicles found for playerSource=%s"):format(dataObject.identifier))
            return
        end

        return vehiclesRows
    end

    Logger:error(("No framework found for getting player vehicles for playerSource=%s"):format(dataObject.playerSource))

    return false
end
exports("getPlayerVehicles", function(...)
    return Framework:GetPlayerVehicles(...)
end)

-- Transfer the vehicle ownership depending on the framework
-- @param dataObject table The data object
-- @return boolean true if the vehicle ownership was transferred, false otherwise
function Framework:TransferVehicleOwnership(dataObject)
    local targetSource = self:GetPlayerSourceFromIdentifier(dataObject.targetIdentifier)
    if not targetSource then
        Logger:error(("TransferVehicleOwnership: No player found for identifier=%s"):format(dataObject.targetIdentifier))
        return false
    end

    if self.currentFramework == "esx" then
        local vehiclesTable = ORM:new("owned_vehicles")
        vehiclesTable:where({ plate = dataObject.plate }):update({ owner = dataObject.targetIdentifier }):execute()

        -- TODO: Give keys to the new owner if vehicle is outside

        return true
    elseif self.currentFramework == "qbcore" then
        local vehiclesTable = ORM:new("player_vehicles")
        vehiclesTable:where({ plate = dataObject.plate }):update({ citizenid = dataObject.targetIdentifier }):execute()

        self:GiveVehicleKeys({ targetSource = targetSource, plate = dataObject.plate })

        return true
    end

    Logger:error(("No framework found for transferring vehicle ownership for plate=%s"):format(dataObject.plate))

    return false
end
exports("transferVehicleOwnership", function(...)
    return Framework:TransferVehicleOwnership(...)
end)

-- Give the vehicle keys to a player depending on the framework
-- @param dataObject table The data object
-- @return boolean true if the vehicle keys were given, false otherwise
function Framework:GiveVehicleKeys(dataObject)
    if self.currentFramework == "esx" then
        -- TODO: Check if this work
        local vehiclesTable = ORM:new("owned_vehicles")
        local vehicleDB = vehiclesTable:find({ "plate" }):where({ plate = dataObject.plate }):execute()

        if not vehicleDB then
            Logger:error(("GiveVehicleKeys: No vehicle found for plate=%s"):format(dataObject.plate))
            return false
        end

        local vehicleData = json.decode(vehicleDB.vehicle)
        if not vehicleData then return end

        local vehicle = ESX.Game.GetVehicleProperties(vehicleData.id)
        if not vehicle then return end

        TriggerClientEvent("esx:giveVehicleKeys", dataObject.targetSource, vehicle)
    elseif self.currentFramework == "qbcore" then
        local vehiclesTable = ORM:new("player_vehicles")
        local vehicleDB = vehiclesTable:find({ "plate" }):where({ plate = dataObject.plate }):execute()

        if not vehicleDB then
            Logger:error(("GiveVehicleKeys: No vehicle found for plate=%s"):format(dataObject.plate))
            return false
        end

        TriggerClientEvent(Config.Framework.qbCore.events.qbVehicleKeys.acquireVehicleKeys, dataObject.targetSource, dataObject.plate)
    end

    return true
end
exports("giveVehicleKeys", function(...)
    return Framework:GiveVehicleKeys(...)
end)
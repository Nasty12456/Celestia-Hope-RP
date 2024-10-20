Utils = Utils or {}

-- Check if the player is near an ATM
-- @param dataObject table The data object
-- @return boolean Whether the player is near an ATM
function Utils:IsNearAnATM(dataObject)
    local playerPosition = GetEntityCoords(GetPlayerPed(dataObject.playerSource))

    local nearestAtm
    local maxDistance = dataObject.maxDistance or 15.0

    -- Use Config.DefaultMapObjects.atmModels
    for _, atmModelPosition in ipairs(Config.DefaultMapObjects.positions.atmModels) do
        local atmPosition = atmModelPosition

        if #(playerPosition - atmPosition) <= maxDistance then
            nearestAtm = atmModelPosition
            maxDistance = #(playerPosition - atmPosition)
        end
    end

    local resultDataObject = {
        found = false
    }

    if nearestAtm ~= nil then
        resultDataObject.found = true
        resultDataObject.position = nearestAtm
    end

    return resultDataObject
end
exports("isNearAnATM", function(...)
    return Utils:IsNearAnATM(...)
end)

Entities = Entities or {}

-- Get the nearest vehicle to a player
-- @param dataObject table The data object
-- @param (optional) options table The options
-- @return (number, number) The vehicle handle and the distance
function Entities:GetNearestVehicle(dataObject, options)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    local coords

    if not dataObject.coords then
        coords = GetEntityCoords(ped)
    else
        if type(dataObject.coords) == 'table' then
            coords = vec3(dataObject.coords.x, dataObject.coords.y, dataObject.coords.z)
        end
    end

    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if dataObject.distance then
            if distance > dataObject.distance then
                goto continue
            end
        end

        if closestDistance == -1 or closestDistance > distance then
            local plate = GetVehicleNumberPlateText(vehicles[i])

            if dataObject.owned then
                -- TODO: ask the server if the vehicle is owned by the player
                if not plate then
                    goto continue
                end

                local owned = EventManager:awaitTriggerServerEvent("isVehicleOwned", { plate = plate })

                if not owned then
                    goto continue
                end
            end

            closestVehicle = {
                vehicleID = vehicles[i],
                modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicles[i])),
                plate = plate
            }

            closestDistance = distance
        end

        ::continue::
    end

    return closestVehicle, closestDistance
end
exports("getNearestVehicle", function(...)
    return Entities:GetNearestVehicle(...)
end)
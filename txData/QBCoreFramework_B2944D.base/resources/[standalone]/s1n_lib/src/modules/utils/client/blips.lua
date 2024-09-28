Utils = Utils or {}

-- Create a blip on the map
-- @param blipData table The blip data (position: vec3, sprite: number, scale: number, color: number, shortRange: boolean, label: string)
-- @return number The blip ID
function Utils:CreateBlip(blipData)
    if not TypeChecker:ValidateSchema(blipData, TypeChecker.BlipDataSchema) then
        return
    end

    local blip = AddBlipForCoord(blipData.position.x, blipData.position.y, blipData.position.z)

    SetBlipSprite(blip, blipData.sprite)
    SetBlipScale(blip, blipData.scale)
    SetBlipColour(blip, blipData.color)
    SetBlipAsShortRange(blip, blipData.shortRange)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(blip)

    Logger:debug(("Created blip with label=%s"):format(blipData.label))

    return blip
end
exports("createBlip", function(blipData)
    return Utils:CreateBlip(blipData)
end)
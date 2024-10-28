local QBCore = exports['qb-core']:GetCoreObject()

local Config = {
    animations = {
        {
            label = "Pole Dance 1", 
            dict = "mini@strip_club@pole_dance@pole_dance1", 
            anim = "pd_dance_01",
            offset = vector3(0.2, -0.2, -1.0),
            rotation = 180.0
        },
        {
            label = "Pole Dance 2", 
            dict = "mini@strip_club@pole_dance@pole_dance2", 
            anim = "pd_dance_02",
            offset = vector3(0.2, -0.2, -1.0),
            rotation = 180.0
        },
        {
            label = "Pole Dance 3", 
            dict = "mini@strip_club@pole_dance@pole_dance3", 
            anim = "pd_dance_03",
            offset = vector3(0.2, -0.2, -1.0),
            rotation = 180.0
        },
    }
}


CreateThread(function()
    exports['qb-target']:AddTargetModel(`5d_vanillapole`, {
        options = {
            {
                type = "client",
                icon = "fas fa-music",
                label = "Dance on Pole",
                action = function(entity)
                    TriggerEvent('stripper:startDance', {poleObject = entity})
                end,
                canInteract = function()
                    return not IsPedInAnyVehicle(PlayerPedId())
                end
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent('stripper:startDance', function(data)
    local dancingOptions = {}
    for i, dance in ipairs(Config.animations) do
        table.insert(dancingOptions, {
            header = dance.label,
            params = {
                event = 'stripper:performDance',
                args = {
                    dict = dance.dict,
                    anim = dance.anim,
                    offset = dance.offset,
                    rotation = dance.rotation,
                    poleObject = data.poleObject
                }
            }
        })
    end
    exports['qb-menu']:openMenu(dancingOptions)
end)

RegisterNetEvent('stripper:performDance', function(data)
    local ped = PlayerPedId()
    local poleCoords = GetEntityCoords(data.poleObject)
    print("Pole Coords: " .. poleCoords.x .. ", " .. poleCoords.y .. ", " .. poleCoords.z)
    
    RequestAnimDict(data.dict)
    while not HasAnimDictLoaded(data.dict) do
        Wait(0)
    end

    local targetPosition = vector3(
        poleCoords.x + data.offset.x,
        poleCoords.y + data.offset.y,
        poleCoords.z + data.offset.z
    )
    
    SetEntityCoords(ped, targetPosition.x, targetPosition.y, targetPosition.z)
    SetEntityHeading(ped, data.rotation)
    TaskPlayAnim(ped, data.dict, data.anim, 8.0, -8.0, -1, 1, 0, true, true, true)
end)

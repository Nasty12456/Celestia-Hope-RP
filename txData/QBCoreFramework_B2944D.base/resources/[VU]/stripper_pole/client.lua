local QBCore = exports['qb-core']:GetCoreObject()

-- Config for pole locations and animations
local Config = {
    animations = {
        {label = "Pole Dance 1", dict = "mini@strip_club@pole_dance@pole_dance1", anim = "pd_dance_01"},
        {label = "Pole Dance 2", dict = "mini@strip_club@pole_dance@pole_dance2", anim = "pd_dance_02"},
        {label = "Pole Dance 3", dict = "mini@strip_club@pole_dance@pole_dance3", anim = "pd_dance_03"},
    }
}

-- Initialize QB-Target
CreateThread(function()
    exports['qb-target']:AddTargetModel(`5d_vanillapole`, {
        options = {
            {
                type = "client",
                event = "stripper:startDance",
                icon = "fas fa-music",
                label = "Dance on Pole",
                canInteract = function()
                    return not IsPedInAnyVehicle(PlayerPedId())
                end
            }
        },
        distance = 2.5,
    })
end)

-- Menu to select dance
RegisterNetEvent('stripper:startDance', function()
    local dancingOptions = {}
    for i, dance in ipairs(Config.animations) do
        table.insert(dancingOptions, {
            header = dance.label,
            params = {
                event = 'stripper:performDance',
                args = {
                    dict = dance.dict,
                    anim = dance.anim
                }
            }
        })
    end
    
    exports['qb-menu']:openMenu(dancingOptions)
end)

-- Perform the selected dance
RegisterNetEvent('stripper:performDance', function(data)
    local ped = PlayerPedId()
    
    RequestAnimDict(data.dict)
    while not HasAnimDictLoaded(data.dict) do
        Wait(0)
    end

    TaskPlayAnim(ped, data.dict, data.anim, 8.0, -8.0, -1, 1, 0, false, false, false)
end)

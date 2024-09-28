if cfg.framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

function getIdentifier()
    local player = ESX.GetPlayerData()
    return player.identifier
end

function notify(text, type)
    if GetResourceState('esx_notify') ~= 'missing' then
        return exports['esx_notify']:Notify(type, 3000, text)
    else
        lib.notify({
            description = text,
            type = type,
        })
    end
end

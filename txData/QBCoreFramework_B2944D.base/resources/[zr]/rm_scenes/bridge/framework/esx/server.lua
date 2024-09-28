if cfg.framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

function getPlayerData(playerId)
    local player = ESX.GetPlayerFromId(playerId)

    return {
        identifier = player.identifier,
        name = player.name,
        job = player.job.name,
        jobGrade = player.job.grade,
    }
end

function notify(playerId, text, type)
    TriggerClientEvent('esx:showNotification', playerId, text, type)
end

if cfg.framework ~= 'standalone' then return end

AddEventHandler('playerJoining', function()
    local playerId = source
    local identifier = GetPlayerIdentifierByType(playerId, 'license2') or GetPlayerIdentifierByType(playerId, 'license')
    TriggerClientEvent('rm_scenes:client:standaloneIdentifier', playerId, identifier)
end)

function getPlayerData(playerId)
    return {
        identifier = GetPlayerIdentifierByType(playerId, 'license2') or GetPlayerIdentifierByType(playerId, 'license'),
        name = GetPlayerName(playerId),
        job = 'none',
        jobGrade = 0,
    }
end

function notify(playerId, text, type)
    TriggerClientEvent('ox_lib:notify', playerId, {
        description = text,
        type = type,
    })
end

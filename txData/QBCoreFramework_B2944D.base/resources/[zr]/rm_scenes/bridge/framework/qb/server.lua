if cfg.framework ~= 'qb' then return end

local QBCore = exports['qb-core']:GetCoreObject()

function getPlayerData(playerId)
    local player = QBCore.Functions.GetPlayer(playerId)

    return {
        identifier = player.PlayerData.citizenid,
        name = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname,
        job = player.PlayerData.job.name,
        jobGrade = player.PlayerData.job.grade.level,
    }
end

function notify(playerId, text, type)
    QBCore.Functions.Notify(playerId, text, type)
end

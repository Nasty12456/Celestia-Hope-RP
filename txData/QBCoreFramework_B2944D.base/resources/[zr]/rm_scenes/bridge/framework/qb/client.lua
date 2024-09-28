if cfg.framework ~= 'qb' then return end

local QBCore = exports['qb-core']:GetCoreObject()

function getIdentifier()
    local player = QBCore.Functions.GetPlayerData()
    return player.citizenid
end

function notify(text, type)
    QBCore.Functions.Notify(text, type, 5000)
end

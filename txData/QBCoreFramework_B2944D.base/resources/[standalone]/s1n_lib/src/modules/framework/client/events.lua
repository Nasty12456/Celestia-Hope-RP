Framework = Framework or {}

RegisterNetEvent(Config.Framework.esx.events.playerLoaded, function(playerData)
    Framework.object.PlayerData = playerData

    EventManager:triggerInternalClientEvent("playerLoaded", nil, nil, playerData)

    Logger:debug("esx:playerLoaded - Player data loaded.")
end)

RegisterNetEvent(Config.Framework.esx.events.setJob, function(newJob)
    Framework.object.PlayerData.job = newJob

    EventManager:triggerInternalClientEvent("jobUpdated", nil, nil, newJob)

    Logger:debug("esx:setJob - Job set.")
end)

RegisterNetEvent(Config.Framework.qbCore.events.onJobUpdate, function()
    Framework.object.PlayerData = Framework.object.Functions.GetPlayerData()

    EventManager:triggerInternalClientEvent("jobUpdated", nil, nil, Framework.object.PlayerData.job)
end)

RegisterNetEvent(Config.Framework.qbCore.events.onPlayerLoaded, function()
    Framework.object.PlayerData = Framework.object.Functions.GetPlayerData()

    EventManager:triggerInternalClientEvent("playerLoaded", nil, nil, Framework.object.PlayerData)
end)
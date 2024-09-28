QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.Item, function(src)
    TriggerClientEvent("qb:openChip", src)    
end)

-- QBCore#4011 -- discord.gg/qbcoreframework -- Only Buy From Here
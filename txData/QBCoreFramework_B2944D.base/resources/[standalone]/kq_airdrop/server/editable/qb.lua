if Config.qbSettings.enabled then

    QBCore = exports['qb-core']:GetCoreObject()

    if Config.item.enabled then
        QBCore.Functions.CreateUseableItem(Config.item.flareItemName, function(source)
            CallFlareDrop(source)
        end)
    end

    function RemovePlayerItem(player, item, amount)
        local xPlayer = QBCore.Functions.GetPlayer(tonumber(player))
        xPlayer.Functions.RemoveItem(item, amount or 1)
    end
end

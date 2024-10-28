if Config.esxSettings.enabled then
    ESX = nil

    if Config.esxSettings.useNewESXExport then
        ESX = exports['es_extended']:getSharedObject()
    else
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    if Config.item.enabled then
        ESX.RegisterUsableItem(Config.item.flareItemName, function(source)
            CallFlareDrop(source)
        end)
    end

    function RemovePlayerItem(player, item, amount)
        local xPlayer = ESX.GetPlayerFromId(tonumber(player))
        xPlayer.removeInventoryItem(item, amount or 1)
    end
end

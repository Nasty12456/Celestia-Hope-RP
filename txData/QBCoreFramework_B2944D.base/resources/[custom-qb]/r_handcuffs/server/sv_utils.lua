/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-handcuffs-system
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Framework Part ]]

if Config.Framework.ESX then
    ESX = exports["es_extended"]:getSharedObject()

    ESX.RegisterUsableItem('handcuffs', function(playerId)
        TriggerClientEvent('r_handcuffs:client:execCuffs', playerId)
    end)

    ESX.RegisterUsableItem('handcuff_keys', function(playerId)
        TriggerClientEvent('r_handcuffs:client:execUncuffs', playerId)
    end)

    ESX.RegisterUsableItem('rope', function(playerId)
        TriggerClientEvent('r_handcuffs:client:execRope', playerId)
    end)

    ESX.RegisterUsableItem('grinder', function(playerId)
        TriggerClientEvent('r_handcuffs:client:execGrinder', playerId)
    end)

    for _,v in pairs(Config.Framework.NeedItemToCutRope) do
        ESX.RegisterUsableItem(v, function(playerId)
            TriggerClientEvent('r_handcuffs:client:execUnrope', playerId)
        end)
    end
elseif Config.Framework.QBCore then
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateUseableItem('handcuffs', function(source)
        TriggerClientEvent('r_handcuffs:client:execCuffs', source)
    end)

    QBCore.Functions.CreateUseableItem('handcuff_keys', function(source)
        TriggerClientEvent('r_handcuffs:client:execUncuffs', source)
    end)

    QBCore.Functions.CreateUseableItem('rope', function(source)
        TriggerClientEvent('r_handcuffs:client:execRope', source)
    end)

    QBCore.Functions.CreateUseableItem('grinder', function(source)
        TriggerClientEvent('r_handcuffs:client:execGrinder', source)
    end)

    for _,v in pairs(Config.Framework.NeedItemToCutRope) do
        QBCore.Functions.CreateUseableItem(v, function(source)
            TriggerClientEvent('r_handcuffs:client:execUnrope', source)
        end)
    end
elseif Config.Framework.OXInventory then
    exports('handcuffs', function(event, item, inventory, slot, data)
        TriggerClientEvent('r_handcuffs:client:execCuffs', inventory.id)
    end)

    exports('handcuffs_keys', function(event, item, inventory, slot, data)
        TriggerClientEvent('r_handcuffs:client:execUncuffs', inventory.id)
    end)

    exports('rope', function(event, item, inventory, slot, data)
        TriggerClientEvent('r_handcuffs:client:execRope', inventory.id)
    end)

    exports('grinder', function(event, item, inventory, slot, data)
        TriggerClientEvent('r_handcuffs:client:execGrinder', inventory.id)
    end)

    exports('knife', function(event, item, inventory, slot, data)
        TriggerClientEvent('r_handcuffs:client:execUnrope', inventory.id)
    end)
end

-- [[ Event ]]

RegisterNetEvent('r_handcuffs:server:cuffs', function(pid)
    if not IsPlayerBehind(pid, source) then return end
    if Player(pid).state['cuffs'] or Player(pid).state['rope'] then return end

    if Config.Framework.UniqueCuffs and Config.Framework.ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem('handcuffs', 1)
    elseif Config.Framework.UniqueCuffs and Config.Framework.QBCore then
        exports['qb-inventory']:RemoveItem(source, 'handcuffs', 1, false)
    elseif Config.Framework.UniqueCuffs and Config.Framework.OXInventory then
        exports.ox_inventory:RemoveItem(source, 'handcuffs', 1)
    end

    CuffPlayer(source, pid, 'cuffs')
end)

RegisterNetEvent('r_handcuffs:server:uncuffs', function(pid)
    if not IsPlayerBehind(pid, source) then return end
    if not Player(pid).state['cuffs'] then return end

    local src = source

    UncuffPlayer(source, pid, 'cuffs')

    if Config.Framework.UniqueCuffs and Config.Framework.ESX then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addInventoryItem('handcuffs', 1)
    elseif Config.Framework.UniqueCuffs and Config.Framework.QBCore then
        exports['qb-inventory']:AddItem(src, 'handcuffs', 1, false, false)
    elseif Config.Framework.UniqueCuffs and Config.Framework.OXInventory then
        exports.ox_inventory:AddItem(source, 'handcuffs', 1)
    end
end)

RegisterNetEvent('r_handcuffs:server:rope', function(pid)
    if not IsPlayerBehind(pid, source) then return end
    if Player(pid).state['cuffs'] or Player(pid).state['rope'] then return end

    if Config.Framework.UniqueCuffs and Config.Framework.ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem('rope', 1)
    elseif Config.Framework.UniqueCuffs and Config.Framework.QBCore then
        exports['qb-inventory']:RemoveItem(source, 'rope', 1, false)
    elseif Config.Framework.UniqueCuffs and Config.Framework.OXInventory then
        exports.ox_inventory:RemoveItem(source, 'rope', 1)
    end

    CuffPlayer(source, pid, 'rope')
end)

RegisterNetEvent('r_handcuffs:server:unrope', function(pid)
    if not IsPlayerBehind(pid, source) then return end

    UncuffPlayer(source, pid, 'rope')
end)

RegisterNetEvent('r_handcuffs:server:grinder', function(pid)
    if not IsPlayerBehind(pid, source) then return end

    GrinderPlayer(source, pid)
end)

-- [[ Functions ]]

function GetPlayerLicense(player)
    for _,v in pairs(GetPlayerIdentifiers(player)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            return string.gsub(v, "license:", "")
        end
    end
end
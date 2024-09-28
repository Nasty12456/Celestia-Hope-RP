if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()
local oxHas = GetResourceState('ox_inventory') == 'started'

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetItem(player, item)
    return player.getInventoryItem(item)
end

function AddItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.addInventoryItem(item, count)
end

function RemoveItem(source, item, count, slot)
    if oxHas then
        return exports.ox_inventory:RemoveItem(source, item, count, nil)
    end
    local player = GetPlayerFromId(source)
    player.removeInventoryItem(item, count, nil, slot)
end

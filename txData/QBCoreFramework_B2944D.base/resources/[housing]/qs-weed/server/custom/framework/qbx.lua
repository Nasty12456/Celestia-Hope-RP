if Config.Framework ~= 'qbx' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()
local oxHas = GetResourceState('ox_inventory') == 'started'

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    exports.qbx_core:CreateUseableItem(name, cb)
end

function GetPlayerFromId(source)
    return exports.qbx_core:GetPlayer(source)
end

function GetItem(player, item)
    local data = exports.ox_inventory:GetItem(player.PlayerData.source, item, nil, false)
    return data
end

function AddItem(source, item, count)
    exports.ox_inventory:AddItem(source, item, count)
end

function RemoveItem(source, item, count, slot)
    exports.ox_inventory:RemoveItem(source, item, count, nil, slot)
end

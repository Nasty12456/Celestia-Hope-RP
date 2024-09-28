if Config.Framework ~= 'standalone' then
    return
end

local oxHas = GetResourceState('ox_inventory') == 'started'

-- ESX Callbacks
local serverCallbacks = {}

local clientRequests = {}
local RequestId = 0

---@param eventName string
---@param callback function
RegisterServerCallback = function(eventName, callback)
    serverCallbacks[eventName] = callback
end

exports('RegisterServerCallback', RegisterServerCallback)

RegisterNetEvent('weed:triggerServerCallback', function(eventName, requestId, invoker, ...)
    if not serverCallbacks[eventName] then
        return print(('[^1ERROR^7] Server Callback not registered, name: ^5%s^7, invoker resource: ^5%s^7'):format(eventName, invoker))
    end

    local source = source

    serverCallbacks[eventName](source, function(...)
        TriggerClientEvent('weed:serverCallback', source, requestId, invoker, ...)
    end, ...)
end)

---@param player number playerId
---@param eventName string
---@param callback function
---@param ... any
TriggerClientCallback = function(player, eventName, callback, ...)
    clientRequests[RequestId] = callback

    TriggerClientEvent('weed:triggerClientCallback', player, eventName, RequestId, GetInvokingResource() or 'unknown', ...)

    RequestId = RequestId + 1
end

RegisterNetEvent('weed:clientCallback', function(requestId, invoker, ...)
    if not clientRequests[requestId] then
        return print(('[^1ERROR^7] Client Callback with requestId ^5%s^7 Was Called by ^5%s^7 but does not exist.'):format(requestId, invoker))
    end

    clientRequests[requestId](...)
    clientRequests[requestId] = nil
end)

function RegisterUsableItem(name, cb)
    ImplementError('RegisterUsableItem is not supported with standalone')
    return false
end

function GetPlayerFromId(source)
    return {
        source = source,
        identifier = GetIdentifier(source)
    }
end

function GetPlayerFromIdentifier(identifier)
    identifier = string.gsub(identifier, ' ', '')
    local players = GetPlayers()
    for k, v in pairs(players) do
        if GetIdentifier(v) == identifier then
            return {
                source = v,
                identifier = identifier
            }
        end
    end
    return nil
end

function GetIdentifier(source)
    ImplementError('Get Identifier : You need to implement this function for your framework.')
    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len('license:')) == 'license:' then
            return v:gsub('license:', '')
        end
    end
    return nil
end

function GetItem(player, item)
    ImplementError('GetItem : You need to implement this function for your framework.')
    return true
end

function AddItem(source, item, count)
    ImplementError('AddItem : You need to implement this function for your framework.')
end

function RemoveItem(source, item, count, slot)
    if oxHas then
        return exports.ox_inventory:RemoveItem(source, item, count, nil)
    end
    ImplementError('RemoveItem : You need to implement this function for your framework.')
end

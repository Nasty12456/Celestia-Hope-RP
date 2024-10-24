local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('goto', 'Teleport to a player (Staff Only)', {{name = 'id', help = 'Player ID'}}, true, function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    
    if not targetId then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid player ID', 'error')
        return
    end
    
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    local player = QBCore.Functions.GetPlayer(src)
    
    if targetPlayer then
        local targetPed = GetPlayerPed(targetId)
        local targetCoords = GetEntityCoords(targetPed)
        
        SetEntityCoords(GetPlayerPed(src), targetCoords)
        TriggerClientEvent('QBCore:Notify', src, 'Teleported to Player ID: ' .. targetId, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Player not found', 'error')
    end
end, 'mod')

QBCore.Commands.Add('bring', 'Bring a player to you (Staff Only)', {{name = 'id', help = 'Player ID'}}, true, function(source, args)
    local src = source
    local targetId = tonumber(args[1])
    
    if not targetId then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid player ID', 'error')
        return
    end
    
    local targetPlayer = QBCore.Functions.GetPlayer(targetId)
    local player = QBCore.Functions.GetPlayer(src)
    
    if targetPlayer then
        local adminPed = GetPlayerPed(src)
        local adminCoords = GetEntityCoords(adminPed)
        
        SetEntityCoords(GetPlayerPed(targetId), adminCoords)
        TriggerClientEvent('QBCore:Notify', targetId, 'You have been teleported to an admin', 'info')
        TriggerClientEvent('QBCore:Notify', src, 'Player brought to you', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Player not found', 'error')
    end
end, 'mod')

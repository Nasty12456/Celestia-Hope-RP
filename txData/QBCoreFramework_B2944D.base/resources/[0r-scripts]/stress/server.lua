local Framework = nil
local FrameworkName = nil

if GetResourceState('qb-core') == 'started' then
    Framework = exports['qb-core']:GetCoreObject()
    FrameworkName = 'qb'
elseif GetResourceState('es_extended') == 'started' then
    Framework = exports['es_extended']:getSharedObject()
    FrameworkName = 'esx'
end

function GetPlayerData(source)
    if Framework and FrameworkName then
        if FrameworkName == 'qb' then
            return Framework.Functions.GetPlayer(source)
        else
            return Framework.GetPlayerFromId(source)
        end
    end
    return nil
end

function SetPlayerStressMeta(source, value)
    if Framework and FrameworkName then
        local xPlayer = GetPlayerData(source)
        if FrameworkName == 'qb' then
            return xPlayer.Functions.SetMetaData('stress', value)
        else
            if xPlayer.setMeta then
                return xPlayer.setMeta('stress', value)
            end
        end
    end
    return false
end

function GetPlayerStressMeta(source)
    if Framework and FrameworkName then
        local xPlayer = GetPlayerData(source)
        if FrameworkName == 'qb' then
            return xPlayer?.PlayerData?.metadata?.stress
        else
            if xPlayer.getMeta then
                return xPlayer.getMeta('stress')
            end
        end
    end
    return false
end

function GetPlayerJob(source)
    if Framework and FrameworkName then
        local xPlayer = GetPlayerData(source)
        if FrameworkName == 'qb' then
            return xPlayer?.PlayerData?.job.name
        else
            return xPlayer.getJob().name
        end
    end
    return false
end

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local newStress
    if Config.DisablePoliceStress and GetPlayerJob(src) == 'police' then return end
    local playerStress = GetPlayerStressMeta(src)
    if not playerStress then
        playerStress = 0
    end
    newStress = playerStress + amount
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end
    SetPlayerStressMeta(src, newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local newStress
    local stress = GetPlayerStressMeta(src)
    if not stress then
        stress = 0
    end
    newStress = stress - amount
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end
    SetPlayerStressMeta(src, newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
end)

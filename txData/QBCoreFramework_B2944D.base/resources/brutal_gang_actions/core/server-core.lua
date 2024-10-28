Core = nil

if Config['Core']:upper() == 'ESX' then
    local _esx_ = 'new' -- 'new' / 'old'
    
    if _esx_ == 'new' then
        Core = exports['es_extended']:getSharedObject()
    else
        Core = nil
        TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
        while Core == nil do
            Citizen.Wait(0)
        end
    end

    RESCB = Core.RegisterServerCallback
    GETPFI = Core.GetPlayerFromId
    RUI = Core.RegisterUsableItem
    UsersDataTable = 'users'
    UserIdentifierValue = 'identifier'

    function GetIdentifier(source)
        local xPlayer = GETPFI(source)
        while xPlayer == nil do
            Citizen.Wait(1000)
            xPlayer = GETPFI(source) 
        end
        return xPlayer.identifier
    end

    function GetPlayerByIdentifier(identifier)
        return Core.GetPlayerFromIdentifier(identifier)
    end

    function RemoveItem(source, item, amount)
        local xPlayer = GETPFI(source)
        if _esx_ == 'new' then
            xPlayer.removeInventoryItem(item, amount)
        else
            if string.sub(item, 0, 6):lower() == 'weapon' then
                xPlayer.removeWeapon(item)
            else
                xPlayer.removeInventoryItem(item, amount)
            end
        end
    end

    function AddItem(source, item, count, info)
        local xPlayer = GETPFI(source)
        if _esx_ == 'new' then
            xPlayer.addInventoryItem(item, count, info)
        else
            if string.sub(item, 0, 6):lower() == 'weapon' then
                xPlayer.addWeapon(item, 90)
            else
                xPlayer.addInventoryItem(item, count)
            end
        end
    end

    function GetItemCount(source, item)
        local xPlayer = GETPFI(source)

        if _esx_ == 'new' then
            return xPlayer.getInventoryItem(item).count
        else
            if string.sub(item, 0, 6):lower() == 'weapon' then
                local loadoutNum, weapon = xPlayer.getWeapon(item:upper())

                if weapon then
                    return true
                else
                    return false
                end
            else
                return xPlayer.getInventoryItem(item).count
            end
        end
    end

elseif Config['Core']:upper() == 'QBCORE' then

    Core = exports['qb-core']:GetCoreObject()
    
    RESCB = Core.Functions.CreateCallback
    GETPFI = Core.Functions.GetPlayer
    RUI = Core.Functions.CreateUseableItem
    UsersDataTable = 'players'
    UserIdentifierValue = 'citizenid'

    function GetIdentifier(source)
        local xPlayer = GETPFI(source)
        while xPlayer == nil do
            Citizen.Wait(1000)
            xPlayer = GETPFI(source) 
        end
        return xPlayer.PlayerData.citizenid
    end

    function GetPlayerByIdentifier(identifier)
        return Core.Functions.GetPlayerByCitizenId(identifier)
    end

    function RemoveItem(source, item, amount)
        local xPlayer = GETPFI(source)
        xPlayer.Functions.RemoveItem(item, amount)
    end

    function AddItem(source, item, count, info)
        local xPlayer = GETPFI(source)
        xPlayer.Functions.AddItem(item, count, nil, info)
    end

    function GetItemCount(source, item)
        local xPlayer = GETPFI(source)
        local items = xPlayer.Functions.GetItemByName(item)
        local item_count = 0
        if items ~= nil then
            item_count = items.amount
        else
            item_count = 0
        end
        return item_count
    end
end
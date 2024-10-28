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
    SetJobEvent = 'esx:setJob'
    onPlayerDeath = 'esx:onPlayerDeath'

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

    function GetAccountMoney(source,account)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            return xPlayer.getAccount(account).money
        elseif account == 'money' then
            return xPlayer.getMoney()
        end
    end

    function AddMoneyFunction(source, account, amount)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            xPlayer.addAccountMoney('bank', amount)
        elseif account == 'money' then
            xPlayer.addMoney(amount)
        end
    end

    function RemoveAccountMoney(source, account, amount)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            xPlayer.removeAccountMoney('bank', amount)
        elseif account == 'money' then
            xPlayer.removeMoney(amount)
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

    function GetPlayerNameFunction(source)
        local name
        if Config.SteamName then
            name = GetPlayerName(source) or 'No Data'
        else
            local xPlayer = GETPFI(source)
            name = xPlayer.getName() or 'No Data'
        end
        return name
    end

    function GetPlayerJob(source)
        local xPlayer = GETPFI(source)
        return xPlayer.job.name
    end

    function CreateCoreJob(name, label, grades)
        Core.CreateJob(name, label, grades)
    end

    function SetCoreJob(source, job, grade)
        local xPlayer = GETPFI(source)
        xPlayer.setJob(job, grade)
    end

    function SetCoreJobOffline(identifier, job, grade)
        MySQL.update('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {job, grade, identifier})
    end

elseif Config['Core']:upper() == 'QBCORE' then

    Core = exports['qb-core']:GetCoreObject()
    
    RESCB = Core.Functions.CreateCallback
    GETPFI = Core.Functions.GetPlayer
    RUI = Core.Functions.CreateUseableItem
    SetJobEvent = 'QBCore:Server:SetGang'
    onPlayerDeath = GetResourceState("brutal_ambulancejob") == "started" and 'onPlayerDeath' or 'hospital:server:SetDeathStatus'

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

    function GetAccountMoney(source, account)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            return xPlayer.PlayerData.money.bank
        elseif account == 'money' then
            return xPlayer.PlayerData.money.cash
        end
    end

    function AddMoneyFunction(source, account, amount)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            xPlayer.Functions.AddMoney('bank', amount)
        elseif account == 'money' then
            xPlayer.Functions.AddMoney('cash', amount)
        end
    end

    function RemoveAccountMoney(source, account, amount)
        local xPlayer = GETPFI(source)
        if account == 'bank' then
            xPlayer.Functions.RemoveMoney('bank', amount)
        elseif account == 'money' then
            xPlayer.Functions.RemoveMoney('cash', amount)
        end
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

    function RemoveItem(source, item, amount)
        local xPlayer = GETPFI(source)
        xPlayer.Functions.RemoveItem(item, amount)
    end

    function AddItem(source, item, count, info)
        local xPlayer = GETPFI(source)
        xPlayer.Functions.AddItem(item, count, nil, info)
    end

    function GetPlayerNameFunction(source)
        local name
        if Config.SteamName then
            name = GetPlayerName(source)
        else
            local xPlayer = GETPFI(source)
            name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        end
        return name
    end

    function GetPlayerJob(source)
        local xPlayer = GETPFI(source)
        return xPlayer.PlayerData.gang.name
    end

    function CreateCoreJob(name, label, grades)
        Core.Functions.AddGang(name, 
        {
            label = label,
            grades = grades,
        })
    end

    function UpdateCoreJob(name, label, grades)
        Core.Functions.UpdateGang(name, {
            label = label,
            grades = grades,
        })
    end

    function RemoveCoreJob(name)
        Core.Functions.RemoveGang(name)
    end

    function SetCoreJob(source, job, grade)
        local xPlayer = GETPFI(source)
        xPlayer.Functions.SetGang(job, grade)
    end

    function SetCoreJobOffline(identifier, job, grade)
        MySQL.update('UPDATE players SET gang = ? WHERE citizenid = ?', {{grade = {level = grade, name = "Member"}, name = job, isboss = false, label = Gangs[job].label}, identifier})
    end
    
end
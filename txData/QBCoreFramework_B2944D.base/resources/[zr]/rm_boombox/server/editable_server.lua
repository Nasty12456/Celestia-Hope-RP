Framework = nil
madCore = {}
useableItems = {}

Citizen.CreateThread(function()
    if Config.framework.name == 'ESX' then
        pcall(function() Framework = exports[Config.framework.scriptName]:getSharedObject() end)
        if not Framework then
            TriggerEvent(Config.framework.eventName, function(library)
                Framework = library
            end)
        end
        madCore.usableItem = Framework.RegisterUsableItem
        madCore.registerCallback = Framework.RegisterServerCallback
    elseif Config.framework.name == 'QB' then
        while not Framework do
            pcall(function() Framework = exports[Config.framework.scriptName]:GetCoreObject() end)
            if not Framework then
                pcall(function() Framework = exports[Config.framework.scriptName]:GetSharedObject() end)
            end
            if not Framework then
                TriggerEvent(Config.framework.eventName, function(obj) Framework = obj end)
            end
            Citizen.Wait(1)
        end
        madCore.registerCallback = Framework.Functions.CreateCallback
        madCore.usableItem = Framework.Functions.CreateUseableItem
    end
end)

madCore.getPhrase = function(str)
    return Strings[str] or ('locale not found: %s'):format(str)
end

madCore.getPlayer = function(playerId)
    if Config.framework.name == 'ESX' then
        local Player = Framework.GetPlayerFromId(playerId)
        if not Player then
            return
        end

        self = {}

        self.getIdentifier = function()
            return GetPlayerIdentifierByType(playerId, 'steam')
        end

        self.getJob = function()
            return Player.getJob()
        end

        self.showNotification = function(msg)
            return TriggerClientEvent('boombox:client:showNotification', playerId, msg)
        end

        self.getItem = function(itemName)
            return Player.getInventoryItem(itemName)
        end

        self.getItemCount = function(itemName) 
            return Player.getInventoryItem(itemName).count or 0
        end

        self.hasItem = function(itemName, count)
            local item = Player.getInventoryItem(itemName) or nil

            if item then
                return item.count >= (count or 1)
            end

            return false
        end

        self.addItem = function(itemName, count)
            return Player.addInventoryItem(itemName, count)
        end

        self.removeItem = function(itemName, count)
            return Player.removeInventoryItem(itemName, count)
        end

        self.getMoney = function(moneyType)
            return Player.getAccount((moneyType or 'money')).money
        end

        self.addMoney = function(amount, moneyType)
            return Player.addAccountMoney((moneyType or 'money'), amount)
        end

        self.addBlackMoney = function(amount)
            return Player.addAccountMoney("black_money", amount)
        end

        self.removeMoney = function(amount, moneyType)
            return Player.removeAccountMoney((moneyType or 'money'), amount)
        end

        return self
    elseif Config.framework.name == 'QB' then
        local Player = Framework.Functions.GetPlayer(tonumber(playerId))
        if not Player then
            return nil
        end

        self = {}

        self.getIdentifier = function()
            return Framework.Functions.GetIdentifier(playerId, 'steam')
        end

        self.getJob = function()
            return Player.PlayerData.job
        end

        self.showNotification = function(msg)
            return TriggerClientEvent('boombox:client:showNotification', playerId, msg)
        end

        self.getItem = function(itemName)
            return Player.Functions.GetItemByName(itemName)
        end

        self.hasItem = function(itemName, count)
            local item = Player.Functions.GetItemByName(itemName) or nil
            if item then
                return item.amount >= (count or 1)
            end

            return false
        end

        self.getItemCount = function(itemName) 
            return Player.Functions.GetItemByName(itemName).amount or 0
        end

        self.addItem = function(itemName, count)
            return Player.Functions.AddItem(itemName, count)
        end

        self.removeItem = function(itemName, count)
            return Player.Functions.RemoveItem(itemName, count)
        end

        self.getMoney = function(moneyType)
            return Player.PlayerData.money[moneyType or 'cash']
        end

        self.addMoney = function(amount, moneyType)
            return Player.Functions.AddMoney((moneyType or 'cash'), amount)
        end

        self.addBlackMoney = function(amount)
            local info = {
                worth = amount
            }
            Player.Functions.AddItem('markedbills', 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items['markedbills'], "add") 
        end

        self.removeMoney = function(amount, moneyType)
            return Player.Functions.RemoveMoney((moneyType or 'cash'), amount)
        end

        return self
    elseif Config.framework.name == "STANDALONE" then
        self = {}

        self.showNotification = function(msg)
            return TriggerClientEvent('boombox:client:showNotification', playerId, msg)
        end

        self.getIdentifier = function()
            return GetPlayerIdentifierByType(playerId, 'steam')
        end

        return self 
    end
end

Citizen.CreateThread(function()
    if Config.framework.name ~= "STANDALONE" then
        return
    end

    RegisterCommand(Config.framework.command, function(source, args, rawCommand)
        if not args[1] then
            return
        end

        local Player = madCore.getPlayer(source)
        if not Player then
            return 
        end

        if boomboxes[source] then
            return Player.showNotification(madCore.getPhrase("already_have_boombox"))
        end

        if boomboxCount >= Config.boomboxLimit then
            return Player.showNotification(madCore.getPhrase("boombox_limit"))
        end

        if not Config.boomboxes[args[1]] then
            return
        end

        TriggerClientEvent("rm_boombox:client:placeBoombox", source, args[1])
    end)
end)
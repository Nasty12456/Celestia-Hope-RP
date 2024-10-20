Inventory = Inventory or {}

-- Verify if the player has the item in the inventory
-- @param playerSource number The player server ID
-- @param itemName string The item name
-- @return boolean
function Inventory:HasItemInInventory(playerSource, itemName, itemCount)
    if Framework:GetCurrentFrameworkName() == "qbcore" then
        local qbPlayer = Framework.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then
            return false
        end

        local item = qbPlayer.Functions.GetItemByName(itemName)
        if not item then
            return false
        end

        if itemCount then
            return item.amount >= itemCount
        end

        return item.amount > 0
    elseif Framework:GetCurrentFrameworkName() == "esx" then
        local xPlayer = Framework.object.GetPlayerFromId(playerSource)
        if not xPlayer then
            return false
        end

        local item = xPlayer.getInventoryItem(itemName)
        if not item then
            return false
        end

        if itemCount then
            return item.count >= itemCount
        end

        return item.count > 0
    end

    Utils:Debug("Inventory:HasItem - Framework not supported")

    return false
end
exports("hasItemInInventory", function(...)
    return Inventory:HasItemInInventory(...)
end)
EventManager:registerEvent("hasItemInInventory", function(source, callback, itemName)
    callback(Inventory:HasItemInInventory(source, itemName))
end)

-- Add an item to the player's inventory
-- @param dataObject table The data object
-- @param optionsObject table The options object
-- @return boolean Whether the item was added or not
function Inventory:AddInventoryItem(dataObject, optionsObject)
    if optionsObject then
        -- Check if the player already has the item
        if optionsObject.onlyIfNotAlreadyHave then
            if Inventory:HasItemInInventory(dataObject.playerSource, dataObject.itemName) then
                return false
            end
        end

        -- Check if the player can carry the item (add a config variable in configuration/ to enable this)
        if not optionsObject.disableCheckCanCarryItem and Config.Inventory.checkCanCarryItem then
            if not self:CanCarryItem(dataObject) then
                return false
            end
        end

        -- TODO: Handle metadata for oxInventory
    end

    if Framework:GetCurrentFrameworkName() == "qbcore" then
        local qbPlayer = Framework.object.Functions.GetPlayer(dataObject.playerSource)
        if not qbPlayer then
            return
        end

        qbPlayer.Functions.AddItem(dataObject.itemName, dataObject.amount)

        return true
    elseif Framework:GetCurrentFrameworkName() == "esx" then
        local xPlayer = Framework.object.GetPlayerFromId(dataObject.playerSource)
        if not xPlayer then
            return
        end

        xPlayer.addInventoryItem(dataObject.itemName, dataObject.amount)

        return true
    end

    Logger:error("Inventory:AddInventoryItem - Framework not supported")

    return false
end
exports("addInventoryItem", function(dataObject, optionsObject)
    return Inventory:AddInventoryItem(dataObject, optionsObject)
end)

-- Remove an item from the player's inventory
-- @param dataObject table The data object
-- @param optionsObject table The options object
-- @return boolean Whether the item was removed or not
function Inventory:RemoveInventoryItem(dataObject, optionsObject)
    if Framework:GetCurrentFrameworkName() == "qbcore" then
        local qbPlayer = Framework.object.Functions.GetPlayer(dataObject.playerSource)
        if not qbPlayer then
            return
        end

        qbPlayer.Functions.RemoveItem(dataObject.itemName, dataObject.amount)

        return true
    elseif Framework:GetCurrentFrameworkName() == "esx" then
        local xPlayer = Framework.object.GetPlayerFromId(dataObject.playerSource)
        if not xPlayer then
            return
        end

        xPlayer.removeInventoryItem(dataObject.itemName, dataObject.amount)

        return true
    end

    Logger:error("Inventory:RemoveInventoryItem - Framework not supported")

    return false
end
exports("removeInventoryItem", function(dataObject, optionsObject)
    return Inventory:RemoveInventoryItem(dataObject, optionsObject)
end)

-- Transfer an item from one player to another
-- @param dataObject table The data object
-- @param optionsObject table The options object
-- @return boolean Whether the item was transferred or not
function Inventory:TransferInventoryItem(dataObject, optionsObject)
    if not self:RemoveInventoryItem({
        playerSource = dataObject.playerSource,
        itemName = dataObject.itemName,
        amount = dataObject.amount
    }, optionsObject) then
        return false
    end

    if not self:AddInventoryItem({
        playerSource = dataObject.targetPlayerSource,
        itemName = dataObject.itemName,
        amount = dataObject.amount
    }, optionsObject) then
        return false
    end

    return true
end
exports("transferInventoryItem", function(...)
    return Inventory:TransferInventoryItem(...)
end)

-- Check if the player can carry the item
-- @param dataObject table The data object
-- @param optionsObject table The options object
-- @return boolean Whether the player can carry the item or not
function Inventory:CanCarryItem(dataObject, optionsObject)
    if Framework:GetCurrentFrameworkName() == "qbcore" then
        local qbPlayer = Framework.object.Functions.GetPlayer(dataObject.playerSource)
        if not qbPlayer then
            return
        end

        if Config.Dependencies.inventoryScripts.qbInventory then
            return exports[Config.ExportNames.qbInventory]:CanAddItem(dataObject.playerSource, dataObject.itemName,
                dataObject.amount)
        end

        return true
    elseif Framework:GetCurrentFrameworkName() == "esx" then
        local xPlayer = Framework.object.GetPlayerFromId(dataObject.playerSource)
        if not xPlayer then
            return
        end

        return xPlayer.canCarryItem(dataObject.itemName, dataObject.amount)
    end

    Logger:error("Inventory:CanCarryItem - Framework not supported")

    return false
end
exports("canCarryItem", function(dataObject, optionsObject)
    return Inventory:CanCarryItem(dataObject, optionsObject)
end)

-- Get the player's items
-- @param dataObject table The data object
-- @param optionsObject (optional) table The options object
-- @return table|boolean The player's items or false if the player is not found
function Inventory:GetPlayerItems(dataObject, optionsObject)
    local frameworkName = Framework:GetCurrentFrameworkName()
    local items

    if frameworkName == "qbcore" then
        local player = Framework.object.Functions.GetPlayer(dataObject.playerSource)
        if not player then
            return
        end

        items = player.PlayerData.items
    elseif frameworkName == "esx" then
        local xPlayer = Framework.object.GetPlayerFromId(dataObject.playerSource)
        if not xPlayer then
            return
        end

        items = xPlayer.getInventory()
    else
        Logger:error("Functions:GetPlayerItems - Framework not supported")

        return false
    end

    if not items then
        return false
    end

    -- Return the items as they are if no options are provided
    if not optionsObject then
        return items
    end

    -- Filter the items
    if optionsObject.filter then
        local filteredItems = {}

        for _, item in pairs(items) do
            local shouldInclude = true

            if optionsObject.filter.metadata then
                for metaKey, metaValue in pairs(optionsObject.filter.metadata) do
                    if type(metaValue) == "table" and metaValue.superior then
                        -- Verify if the metadata key exists and if it's superior to the value
                        if not (item.metadata and item.metadata[metaKey] and item.metadata[metaKey] > metaValue.superior) then
                            shouldInclude = false
                            Logger:debug(
                                ("Functions:GetPlayerItems - Metadata key %s not found or not superior to the value in the item %s"):format(
                                    metaKey, json.encode(item)))

                            break
                        end
                    end
                end
            end

            if shouldInclude then
                table.insert(filteredItems, item)
            end
        end

        items = filteredItems
    end

    -- Filter the items table based on the mapData
    if optionsObject.mapData then
        local filteredItems = {}
        local mapData = optionsObject.mapData

        for _, item in pairs(items) do
            local filteredItem = {}

            for key, _ in pairs(mapData) do
                local mappedItemKey = key

                -- Handle the amount key
                local possibleAmountKeys = {"amount", "count", "quantity"}

                if mappedItemKey == "amount" or mappedItemKey == "count" then
                    local foundAmountKey = false

                    for _, amountKey in ipairs(possibleAmountKeys) do
                        if item[amountKey] ~= nil then
                            foundAmountKey = true

                            -- Check if the amount is > 0 (because the old ESX framework would add all items to the inventory, even if the amount is 0)
                            if item[amountKey] == 0 then
                                goto continue
                            end

                            filteredItem[mappedItemKey] = item[amountKey]

                            break
                        end
                    end

                    if not foundAmountKey then
                        Logger:warn(("Functions:GetPlayerItems - No amount key found in the item %s"):format(
                            json.encode(item)))
                    end
                else
                    -- Handle the other keys
                    if type(item) == "table" and item[mappedItemKey] ~= nil then
                        filteredItem[key] = item[mappedItemKey]
                    else
                        Logger:warn(
                            ("Functions:GetPlayerItems - Key %s not found or isn't a table in the item %s"):format(
                                mappedItemKey, json.encode(item)))
                    end
                end
            end

            table.insert(filteredItems, filteredItem)

            ::continue::
        end

        return filteredItems
    end

    return items
end
exports("getPlayerItems", function(dataObject, optionsObject)
    return Inventory:GetPlayerItems(dataObject, optionsObject)
end)
EventManager:registerEvent("getPlayerItems", function(source, callback, dataObject, options)
    -- When sending from the client-side, the client shouldn't have to send its PlayerId, the server should handle that
    if not dataObject then
        dataObject = {}
    end

    if not dataObject.playerSource then
        dataObject.playerSource = source
    end

    callback(Inventory:GetPlayerItems(dataObject, options))
end)

-- Force open the player's inventory
-- @param dataObject table The data object
-- @return void
function Inventory:ForceOpenInventory(dataObject)
    if Framework:GetCurrentFrameworkName() == "qbcore" then
        if Utils:IsUsingDependency("qbInventory") then
            exports[Config.ExportNames.qbInventory]:OpenInventory(dataObject.playerSource,
                dataObject.inventoryIdentifier, {
                    maxweight = dataObject.capacity,
                    slots = dataObject.slots
                })

            return true
        end
    end

    if Utils:IsUsingDependency("oxInventory") then
        -- TODO: move register stash. It should be done once and not every time the inventory is opened
        exports[Config.ExportNames.oxInventory]:RegisterStash(dataObject.inventoryIdentifier, "", dataObject.slots,
            dataObject.capacity)

        exports[Config.ExportNames.oxInventory]:forceOpenInventory(dataObject.playerSource, 'stash',
            dataObject.inventoryIdentifier)

        return true
    elseif Utils:IsUsingDependency("qsInventory") then
        exports['qs-inventory']:RegisterStash(dataObject.playerSource, dataObject.inventoryIdentifier, dataObject.slots,
            dataObject.capacity)

        return true
    end

    Logger:error("Inventory:ForceOpenInventory - No inventory module found")

    return false
end
exports("forceOpenInventory", function(dataObject)
    return Inventory:ForceOpenInventory(dataObject)
end)

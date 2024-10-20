Inventory = Inventory or {}

-- Get the player's items
-- @param dataObject table The data object
-- @param options table The options object
-- @return table The items
function Inventory:GetPlayerItems(dataObject, options)
    local items = EventManager:awaitTriggerServerEvent("getPlayerItems", dataObject, options)

    return items
end
exports("getPlayerItems", function(...)
    return Inventory:GetPlayerItems(...)
end)

-- Check if the player has an item in their inventory
-- @param itemName string The item name
-- @param itemCount number The item count
-- @return boolean Whether the player has the item or not
function Inventory:HasItemInInventory(itemName, itemCount)
    local hasItem = EventManager:awaitTriggerServerEvent("hasItemInInventory", itemName, itemCount)

    return hasItem
end
exports("hasItemInInventory", function(...)
    return Inventory:HasItemInInventory(...)
end)

Inventory = Inventory or {}

function Inventory:GetPlayerItems(dataObject, options)
    local items = EventManager:awaitTriggerServerEvent("getPlayerItems", dataObject, options)

    return items
end
exports("getPlayerItems", function(...)
    return Inventory:GetPlayerItems(...)
end)
Inventory = Inventory or {}

-- Get the inventory image path based on the inventory dependency
-- @return string|boolean The inventory image path or false if no inventory dependency is found
function Inventory:GetInventoryImagePath()
    -- Custom image path
    if Config.Inventory.imagePath ~= "" then
        if not Config.Inventory.imagePath:find("{itemName}") then
            Logger:error("Inventory:GetInventoryImagePath - The image path must contain the {itemName} placeholder in the inventory.config.lua file.")
            return false
        end

        return Config.Inventory.imagePath
    -- Automatic detection
    elseif Config.Dependencies.inventoryScripts.oxInventory then
        return ("nui://%s/web/images/{itemName}.png"):format(Config.ExportNames.oxInventory)
    elseif Config.Dependencies.inventoryScripts.qbInventory then
        return ("nui://%s/html/images/{itemName}.png"):format(Config.ExportNames.qbInventory)
    elseif Config.Dependencies.inventoryScripts.qsInventory then
        return ("nui://%s/html/images/{itemName}.png"):format(Config.ExportNames.qsInventory)
    else
        Logger:error("Inventory:GetInventoryImagePath - No inventory dependency found. Please set the image path manually in the inventory.config.lua file.")
    end

    return false
end
exports("getInventoryImagePath", function(...)
    return Inventory:GetInventoryImagePath(...)
end)
Config = Config or {}

Config.Inventory = {
    -- If you want the scripts to check if the player can carry the item before adding it to the player's inventory, set this to true
    checkCanCarryItem = false,

    -- If not set, the script will try to detect the inventory script automatically and use the image path from there
    -- If you want to set the image path manually, set this to the path of the image (e.g. "nui://ox_inventory/web/images/{itemName}.png" or "nui://qb-inventory/web/images/{itemName}.png" ...)
    imagePath = ""
}
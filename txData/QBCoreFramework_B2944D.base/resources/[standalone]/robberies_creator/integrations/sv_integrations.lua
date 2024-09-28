-- You can edit the events on the right side if you for any reason don't use the default event name

EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Skips or not if an item exists (useful with inventories that doesn't save items in database or in ESX.Items table, example ox_inventory)
SKIP_ITEM_EXISTS_CHECK = false

-- In case entities doesn't spawn when joining the server or "press E to interact" doesn't work, set this to true
FORCE_HEIST_ENTITIES_RESPAWN = true

-- Interval (in seconds) for check about randomly disappeared entities
ENTITIES_RESPAWN_INTERVAL = 30

-- Enables or disables debug output, useful if asked by the script developer
DEBUG_OUTPUT = false
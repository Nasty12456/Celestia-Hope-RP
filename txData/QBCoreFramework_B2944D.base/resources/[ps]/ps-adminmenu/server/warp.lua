local QBCore = exports['qb-core']:GetCoreObject()

-- Define the identifiers that have permissions
local allowedIdentifiers = {
    ["license:c9109e161d294aa63f3e5d28ec27cab3d7e08466"] = "qbcore.god",
    ["license:0893d749544710555c8a1be335415d7ac72130be"] = "qbcore.god",
    ["license:3389f2301a77bad3a26633096992265908b40148"] = "qbcore.god",
    ["license:591d2af6b6e9178d53cec2177d685543f0e53a8d"] = "qbcore.god",
    ["license:9262ded8b3d9db98492c6a25708db169f59871df"] = "qbcore.god",
    ["license:bd7a89ac503ce8b2c69ea9fa567e6c73516b584a"] = "qbcore.god",
}

-- Register the /warp command
RegisterCommand("warp", function(source, args, rawCommand)
    local playerIdentifier = GetPlayerIdentifier(source, 0) -- Get the player's license identifier
    local hasPermission = allowedIdentifiers[playerIdentifier] ~= nil -- Check if the identifier is in the allowedIdentifiers table

    if hasPermission then
        -- If the player has permission, trigger the client event to warp
        TriggerClientEvent('ps-adminmenu:warpToNearestVehicle', source)
    else
        -- Notify the player that they don't have permission to use this command
        TriggerClientEvent('QBCore:Notify', source, 'You do not have permission to use this command.', 'error')
    end
end, false)

API = {}

-- Notify the player using the framework's notification system
-- @param playerSource number The player's server ID
-- @param message string The message to be shown to the player
function API:NotifyPlayer(playerSource, message)
    TriggerClientEvent("s1n_bank:notify", playerSource, message)
end

-- Send a log to the discord webhook
-- @param message string The message to be sent to the discord webhook
function API:SendDiscordLog(message)
    if not Config.DiscordWebhook.enable then return end

    exports[Config.ExportNames.s1nLib]:sendDiscordLog("s1n_banking", message)
end
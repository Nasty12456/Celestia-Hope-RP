Framework = Framework or {}

--
-- PLAYER NOTIFICATIONS
--

-- Notify a player with a message
-- @param playerSource number The player's server ID
-- @param message string The message to notify the player with
-- @return boolean Whether the player was notified successfully
function Framework:NotifyPlayer(playerSource, message)
    local success = EventManager:awaitTriggerClientEvent("Framework:NotifyPlayer", playerSource, message)

    if not success then
        Logger:warn("Failed to notify the player with the server ID %s", playerSource)

        return false
    end

    return true
end
exports("notifyPlayer", function(playerSource, message)
    return Framework:NotifyPlayer(playerSource, message)
end)
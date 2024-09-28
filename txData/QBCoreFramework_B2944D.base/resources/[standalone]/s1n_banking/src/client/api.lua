API = {}

-- Notify the player using the framework's notification system
-- @param message string The message to be shown to the player
function API:NotifyPlayer(message)
    exports[Config.ExportNames.s1nLib]:showNotification({
        message = message
    })
end
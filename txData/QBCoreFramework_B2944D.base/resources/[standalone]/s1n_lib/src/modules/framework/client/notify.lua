Framework = Framework or {}

--
-- PLAYER NOTIFICATIONS
--

-- Show a notification to the player using the framework's notification system
-- @param dataObject table The data object containing the message
-- @return boolean Whether the notification was shown or not
function Framework:ShowNotification(dataObject)
    if self.currentFramework == "esx" then
        self.object.ShowNotification(dataObject.message)

        return true
    elseif self.currentFramework == "qbcore" then
        self.object.Functions.Notify(dataObject.message)

        return true
    end

    Logger:error("No framework found for showing notification")

    return false
end
EventManager:registerEvent("Framework:NotifyPlayer", function(callback, message)
    callback(Framework:ShowNotification({ message = message }))
end)
exports("showNotification", function(message)
    -- FIXME: Temporary fix, needs to use a dataObject (in s1n_billing and s1n_marketplace)
    if type(message) == "table" then
        message = message.message
    end

    return Framework:ShowNotification({ message = message })
end)
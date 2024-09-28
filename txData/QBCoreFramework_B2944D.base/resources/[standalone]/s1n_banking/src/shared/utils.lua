Utils = Utils or {}

-- Send a debug message to the console if the debug mode is enabled.
-- @param ... The message to send to the console.
function Utils:Debug(...)
    if not Config.debugMode then return end

    exports[Config.ExportNames.s1nLib]:debug(("%s: %s"):format(GetCurrentResourceName(), ...))
end

-- Check if the given value is of the expected type.
-- @param value any The value to check.
-- @param expectedType string The expected type of the value.
-- @param canBeNil boolean Whether the value can be nil.
-- @return boolean Whether the value is of the expected type.
function Utils:CheckType(value, expectedType, canBeNil)
    return exports[Config.ExportNames.s1nLib]:checkType(GetCurrentResourceName(), value, expectedType, canBeNil)
end
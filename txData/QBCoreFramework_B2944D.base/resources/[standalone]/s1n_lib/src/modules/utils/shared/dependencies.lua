Utils = Utils or {}

-- Check if the specified dependency is being used in the configuration
-- @param dependency string The dependency to check
-- @return boolean Whether the dependency is being used
function Utils:IsUsingDependency(dependency)
    Logger:debug(("Utils:IsUsingDependency - Checking if dependency is being used: %s"):format(dependency))

    -- Check if the dependency is an inventory script
    if Config.Dependencies.inventoryScripts[dependency] then
        return Config.Dependencies.inventoryScripts[dependency]
    end

    local dependencyValue = Config.Dependencies[dependency]

    if dependencyValue == nil then
        Logger:warn(("Utils:IsUsingDependency - Dependency %s not found in configuration"):format(dependency))
    end

    return dependencyValue
end
exports("isUsingDependency", function(...)
    return Utils:IsUsingDependency(...)
end)

-- Check if the specified export from the specified script exists
-- @param exportFramework table The exports table
-- @param methodName string The name of the method to call
-- @return boolean|table
function Utils:ExportFromScriptExists(scriptName, methodName)
    if type(exports[scriptName]) ~= "table" then
        return false
    end

    local success, result = pcall(function()
        local exportFunction = exports[scriptName][methodName]
        return type(exportFunction) == "function"
    end)

    return success and result
end

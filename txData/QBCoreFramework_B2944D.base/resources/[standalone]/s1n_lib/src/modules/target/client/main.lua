Target = Target or {}

-- Used to keep track of all registered targets (box zones, models...)
Target.registeredTargets = {}

Target.Enums = {
    TargetTypes = {
        BOX_ZONE = true,
        SPHERE_ZONE = true,
        MODEL = true,
    },
}

-- Remove all targets used by a script when it stops
AddEventHandler("onResourceStop", function(resourceName)
    if not Target:IsUsingTargetDependency() then return end

    Logger:info("Checking for targets to remove...")

    for targetID, targetRegistered in pairs(Target.registeredTargets) do
        for _, targetDetails in ipairs(targetRegistered) do
            if targetDetails.invoker == resourceName then
                Target:RemoveAllTargetsByInvoker(targetID, targetDetails.invoker)
            end
        end
    end

    Logger:info("Check for targets to remove finished.")
end)

-- Add a registered target to the list of registered targets
function Target:AddRegisteredTarget(targetID, targetDetails)
    if not Target.registeredTargets[targetID] then
        Target.registeredTargets[targetID] = {}
    end

    table.insert(Target.registeredTargets[targetID], targetDetails)
end

-- Remove a specific target from the registered targets
function Target:RemoveTarget(targetID, targetDetails)
    if targetDetails.type == self.Enums.TargetTypes.BOX_ZONE or targetDetails.type == self.Enums.TargetTypes.SPHERE_ZONE then
        if Config.Dependencies.qbTarget then
            exports[Config.ExportNames.qbTarget]:RemoveZone(targetID)
        elseif Config.Dependencies.oxTarget then
            exports[Config.ExportNames.oxTarget]:removeZone(targetID)
        end
    elseif targetDetails.type == self.Enums.TargetTypes.MODEL then
        if Config.Dependencies.qbTarget then
            exports[Config.ExportNames.qbTarget]:RemoveTargetModel(targetID)
        elseif Config.Dependencies.oxTarget then
            exports[Config.ExportNames.oxTarget]:removeModel(targetID)
        end
    end
end

-- Remove all targets used by a script
function Target:RemoveAllTargetsByInvoker(targetID, invoker)
    local targetsRegistered = Target.registeredTargets[targetID]

    if not targetsRegistered then return end

    for targetRegisteredID, targetDetails in ipairs(targetsRegistered) do
        if targetDetails.invoker == invoker then
            Target:RemoveTarget(targetID, targetDetails)

            -- Remove the target from the registered targets
            table.remove(Target.registeredTargets[targetID], targetRegisteredID)

            Logger:info(("Target: Removed targetRegisteredID=%s with targetID=%s"):format(targetRegisteredID, targetID))
        end
    end

    if #Target.registeredTargets[targetID] == 0 then
        Target.registeredTargets[targetID] = nil
    end
end

-- Check if a target dependency is being used
-- @return boolean Whether a target dependency is being used or not
function Target:IsUsingTargetDependency()
    return Config.Dependencies.qbTarget or Config.Dependencies.oxTarget
end
exports("isUsingTargetDependency", function(...)
    return Target:IsUsingTargetDependency(...)
end)

-- Add a zone which is a box to a target coords in order to be able to interact with it
-- @param dataObject table The data object containing the coords and debug mode
-- @return boolean Whether the box zone was added or not
function Target:AddBoxZone(dataObject)
    local scriptInvokerName = GetInvokingResource()

    if Config.Dependencies.qbTarget then
        exports[Config.ExportNames.qbTarget]:AddBoxZone(dataObject.name, dataObject.coords, dataObject.length, dataObject.width, {
            name = dataObject.name,
            debugPoly = dataObject.debugMode
        }, {
            options = dataObject.options,
            distance = dataObject.distance or 1.5
        })
    elseif Config.Dependencies.oxTarget then
        exports[Config.ExportNames.oxTarget]:addBoxZone({
            coords = dataObject.coords,
            size = dataObject.size,
            debug = dataObject.debugMode,
            options = dataObject.options,
        })
    else
        Logger:error("Target:AddBoxZone - No target depencency found.")

        return false
    end

    -- Register the box zone
    self:AddRegisteredTarget(dataObject.name, {
        invoker = scriptInvokerName,
        type = Target.Enums.TargetTypes.BOX_ZONE,
    })

    Logger:info(("Target:AddBoxZone - Added box zone with name: %s"):format(dataObject.name))

    return true
end
exports("addBoxZone", function(...)
    return Target:AddBoxZone(...)
end)

-- Add a set of models to be able to interact with them
-- @param dataObject table The data object containing the models and debug mode
-- @return boolean Whether the target model was added or not
function Target:AddTargetModels(dataObject)
    local scriptInvokerName = GetInvokingResource()

    -- Call the target dependency function to add the target model
    if Config.Dependencies.qbTarget then
        exports[Config.ExportNames.qbTarget]:AddTargetModel(dataObject.models, {
            options = dataObject.options,
            distance = dataObject.interactionDistance or 1.5
        })
    elseif Config.Dependencies.oxTarget then
        exports[Config.ExportNames.oxTarget]:addModel(dataObject.models, dataObject.options)
    else
        Logger:error("Target:AddTargetModel - No target depencency found.")

        return false
    end

    -- Register the target models
    for _, model in ipairs(dataObject.models) do
        self:AddRegisteredTarget(model, {
            invoker = scriptInvokerName,
            type = Target.Enums.TargetTypes.MODEL,
        })
    end

    Logger:info(("Target:AddTargetModel - Added target models: %s"):format(json.encode(dataObject.models)))

    return true
end
exports("addTargetModels", function(...)
    return Target:AddTargetModels(...)
end)

-- Add a zone which is a sphere to a target coords in order to be able to interact with it
-- @param dataObject table The data object containing the coords and debug mode
-- @return boolean Whether the box zone was added or not
function Target:AddSphereZone(dataObject)
    local scriptInvokerName = GetInvokingResource()

    if Config.Dependencies.qbTarget then
        exports[Config.ExportNames.qbTarget]:AddCircleZone(dataObject.name, dataObject.coords, dataObject.radius, {
            name = dataObject.name,
            debugPoly = dataObject.debugMode
        }, {
            options = dataObject.options,
            distance = dataObject.distance or 1.5
        })
    elseif Config.Dependencies.oxTarget then
        exports[Config.ExportNames.oxTarget]:addSphereZone({
            coords = dataObject.coords,
            radius = dataObject.radius,
            debug = dataObject.debugMode,
            options = dataObject.options,
        })
    else
        Logger:error("Target:AddSphereZone - No target depencency found.")

        return false
    end

    -- Register the box zone
    self:AddRegisteredTarget(dataObject.name, {
        invoker = scriptInvokerName,
        type = Target.Enums.TargetTypes.SPHERE_ZONE,
    })

    Logger:info(("Target:AddBoxZone - Added box zone with name: %s"):format(dataObject.name))

    return true
end
exports("addSphereZone", function(...)
    return Target:AddSphereZone(...)
end)
Utils = Utils or {}

-- Add a key mapping
-- @param options table The key mapping options (key: string, description: string, mapperID: string, onPressed: function, canPress: function)
-- @return boolean true if the key mapping was added, false otherwise
function Utils:AddKeyMapping(options)
    local invokingResource = GetInvokingResource()

    if not TypeChecker:ValidateSchema(options, TypeChecker.KeyMappingDataSchema) then
        return
    end

    -- List: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
    if not options.mapperID then
        options.mapperID = "keyboard"
    end

    -- Associate the key with the invoking resource to avoid conflicts
    local keyIdentifier = ("cmd_%s_%s"):format(invokingResource, options.key)

    RegisterCommand(("+%s"):format(keyIdentifier), function()
        if options.canPress and not options.canPress() then
            return
        end

        if options.onPressed then
            options.onPressed()
        end
    end, false)

    RegisterCommand(("-%s"):format(keyIdentifier), function()
        -- TODO: add canRelease and canRelease function in the same style as canPress
    end, false)

    RegisterKeyMapping(("+%s"):format(keyIdentifier), options.description, options.mapperID, options.key)

    Logger:debug(("Added key mapping with key=%s and description=%s"):format(options.key, options.description))

    return true
end
exports("addKeyMapping", function(options)
    return Utils:AddKeyMapping(options)
end)
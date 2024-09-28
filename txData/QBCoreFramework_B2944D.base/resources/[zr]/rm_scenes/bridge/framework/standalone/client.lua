if cfg.framework ~= 'standalone' then return end

local identifier
RegisterNetEvent('rm_scenes:client:standaloneIdentifier', function(_identifier)
    identifier = _identifier
end)

function getIdentifier()
    while not identifier do Wait(100) end

    return identifier
end

function notify(text, type)
    lib.notify({
        description = text,
        type = type,
    })
end

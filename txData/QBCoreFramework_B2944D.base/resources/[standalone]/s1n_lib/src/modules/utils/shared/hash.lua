Utils = Utils or {}

function Utils:HashVector3(position)
    -- Floor to avoid floating point errors
    local x = math.floor(position.x * 100)
    local y = math.floor(position.y * 100)
    local z = math.floor(position.z * 100)

    local combined = string.format("%d|%d|%d", x, y, z)

    return string.format("%x", math.abs(string.len(combined) + string.byte(combined, 1, string.len(combined))))
end
exports("hashVector3", function(...)
    return Utils:HashVector3(...)
end)
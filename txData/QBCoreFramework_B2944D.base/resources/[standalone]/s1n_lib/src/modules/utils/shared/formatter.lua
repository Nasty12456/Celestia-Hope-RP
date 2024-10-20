Utils = Utils or {}

-- Format the specified time in milliseconds to a human-readable format
-- @param milliseconds number The time in milliseconds
-- @return string The formatted time
function Utils:FormatTime(milliseconds)
    local seconds = math.floor(milliseconds / 1000)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)
    local days = math.floor(hours / 24)

    if days > 0 then
        return string.format("%dd", days)
    elseif hours > 0 then
        return string.format("%dh", hours)
    elseif minutes > 0 then
        return string.format("%dmin", minutes)
    else
        return string.format("%ds", seconds)
    end
end
exports("formatTime", function(...)
    return Utils:FormatTime(...)
end)
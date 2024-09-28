Utils = Utils or {}

-- Format the specified time in milliseconds to a human-readable format
-- @param milliseconds number The time in milliseconds
-- @return string The formatted time
function Utils:FormatTime(milliseconds)
    local seconds = math.floor(milliseconds / 1000)
    local minutes = math.floor(seconds / 60)
    local hours = math.floor(minutes / 60)

    if hours > 0 then
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
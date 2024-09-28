Utils = Utils or {}

-- Get the current date in the specified format
-- @param format string The format to use (default: DD-MM-YYYY, other options: MM-DD-YYYY, YYYY-MM-DD)
-- @return string The formatted date
function Utils:GetCurrentDate(format)
    local dateTable = os.date('*t')

    -- Default format if not provided
    format = format or "DD-MM-YYYY"

    local formattedDate = format:gsub('YYYY', dateTable.year)
                                :gsub('MM', string.format('%02d', dateTable.month))
                                :gsub('DD', string.format('%02d', dateTable.day))

    return formattedDate
end
exports("getCurrentDate", function(format)
    return Utils:GetCurrentDate(format)
end)

-- Get the time difference between the specified time and now
-- @param time number The time to compare with now
-- @return number The time difference
function Utils:GetTimeDifferenceWithNow(time)
    local nowTime = os.time()

    return os.difftime(nowTime, time)
end
exports("getTimeDifferenceWithNow", function(time)
    return Utils:GetTimeDifferenceWithNow(time)
end)
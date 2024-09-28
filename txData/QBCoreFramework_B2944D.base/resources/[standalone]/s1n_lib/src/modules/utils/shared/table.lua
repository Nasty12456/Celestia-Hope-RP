Utils = Utils or {}

-- Get the real length of a table (if the keys are not numbers).
-- NOTE: Check https://stackoverflow.com/questions/2705793/how-to-get-number-of-entries-in-a-lua-table
-- @param table table The table
-- @return number The length of the table
function Utils:GetRealTableLength(table)
    local count = 0

    for _ in pairs(table) do
        count = count + 1
    end

    return count
end
exports("getRealTableLength", function(table)
    return Utils:GetRealTableLength(table)
end)
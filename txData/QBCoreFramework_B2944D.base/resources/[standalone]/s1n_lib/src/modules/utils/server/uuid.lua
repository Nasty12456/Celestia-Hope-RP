Utils = Utils or {}

local TEMPLATE = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"

-- Generate a UUID
-- Uses UUID version 4 (see https://en.wikipedia.org/wiki/Universally_unique_identifier)
-- @return string The UUID generated
function Utils:GenerateUUID()
    return TEMPLATE:gsub("[xy]", function(c)
        local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", v)
    end)
end
exports("generateUUID", function()
    return Utils:GenerateUUID()
end)
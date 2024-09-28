Utils = Utils or {}

-- Draw a text on the screen (top left corner)
-- @param text string The text to be drawn
function Utils:DrawHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
exports("drawHelpText", function(text)
    return Utils:DrawHelpText(text)
end)
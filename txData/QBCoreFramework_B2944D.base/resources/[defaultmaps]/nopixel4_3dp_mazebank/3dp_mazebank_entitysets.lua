local interiors = {
    {
        ipl = '3dp_heist_mb_milo',
        coords = { x=-1306.92456, y=-822.703247, z=20.5089359 },
        entitySets = {
            { name = 'room14_seccode_01', enable = false },
            { name = 'room14_seccode_02', enable = false },
            { name = 'room14_seccode_03', enable = false },
            { name = 'room14_seccode_04', enable = false },
            { name = 'room14_seccode_05', enable = false },
            { name = 'room14_seccode_06', enable = false },
            { name = 'room14_seccode_07', enable = false },
            { name = 'room14_seccode_08', enable = false },
            { name = 'room14_seccode_09', enable = false },
            { name = 'vault_props', enable = true },
        }
    },
   
}

CreateThread(function()
    for _, interior in ipairs(interiors) do
        if not interior.ipl or not interior.coords or not interior.entitySets then
            return
        end
        RequestIpl(interior.ipl)
        local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
        if IsValidInterior(interiorID) then
            for __, entitySet in ipairs(interior.entitySets) do
                if entitySet.enable then
                    EnableInteriorProp(interiorID, entitySet.name)
                else
                    DisableInteriorProp(interiorID, entitySet.name)
                end
            end
            RefreshInterior(interiorID)
        end
    end
end)
local xmas1 = false
local normal1 = false
local xmas2 = false
local normal2 = false

local interior_coords1 = vector3(-1232.25, -1180.17, 7.66)
local interior_coords2 = vector3(1886.32, 3911.78, 36.844)

Citizen.CreateThread(function()
	local interior1 = GetInteriorAtCoords(interior_coords1.x, interior_coords1.y, interior_coords1.z)
	while interior1 == 0 do
		interior1 = GetInteriorAtCoords(interior_coords1.x, interior_coords1.y, interior_coords1.z)
		Citizen.Wait(0)
	end
    
	local interior2 = GetInteriorAtCoords(interior_coords2.x, interior_coords2.y, interior_coords2.z)
	while interior2 == 0 do
		interior2 = GetInteriorAtCoords(interior_coords2.x, interior_coords2.y, interior_coords2.z)
		Citizen.Wait(0)
	end
	
	DisableInteriorProp(interior1, "xmas")
	EnableInteriorProp(interior1, "normal")
	RefreshInterior(interior1)
	
	DisableInteriorProp(interior2, "xmas")
	EnableInteriorProp(interior2, "normal")
	RefreshInterior(interior2)
end)

RegisterNetEvent("rdzk:xmas1", function()
  	xmas1 = not xmas1
	local interior1 = GetInteriorAtCoords(interior_coords1.x, interior_coords1.y, interior_coords1.z) 
    
	if xmas1 then
        EnableInteriorProp(interior1, "xmas")
        DisableInteriorProp(interior1, "normal")
		RefreshInterior(interior1)
    else
        DisableInteriorProp(interior1, "xmas")
        DisableInteriorProp(interior1, "normal")
		RefreshInterior(interior1)
    end
end)

RegisterNetEvent("rdzk:normal1", function()
  	normal1 = not normal1
	local interior1 = GetInteriorAtCoords(interior_coords1.x, interior_coords1.y, interior_coords1.z) 

    if normal1 then
        DisableInteriorProp(interior1, "xmas")
        EnableInteriorProp(interior1, "normal")
		RefreshInterior(interior1)
    else
        DisableInteriorProp(interior1, "xmas")
        DisableInteriorProp(interior1, "normal")
		RefreshInterior(interior1)
    end
end)

RegisterNetEvent("rdzk:xmas2", function()
  	xmas2 = not xmas2
	local interior2 = GetInteriorAtCoords(interior_coords2.x, interior_coords2.y, interior_coords2.z) 
    
	if xmas2 then
        EnableInteriorProp(interior2, "xmas")
        DisableInteriorProp(interior2, "normal")
		RefreshInterior(interior2)
    else
        DisableInteriorProp(interior2, "xmas")
        DisableInteriorProp(interior2, "normal")
		RefreshInterior(interior2)
    end
end)

RegisterNetEvent("rdzk:normal2", function()
  	normal2 = not normal2
	local interior2 = GetInteriorAtCoords(interior_coords2.x, interior_coords2.y, interior_coords2.z) 

    if normal2 then
        DisableInteriorProp(interior2, "xmas")
        EnableInteriorProp(interior2, "normal")
		RefreshInterior(interior2)
    else
        DisableInteriorProp(interior2, "xmas")
        DisableInteriorProp(interior2, "normal")
		RefreshInterior(interior2)
    end
end)

RegisterCommand("rdzk_ipl_xmas1", function(source, args, raw)
    TriggerServerEvent("rdzk:xmas1")
end, false)

RegisterCommand("rdzk_ipl_normal1", function(source, args, raw)
    TriggerServerEvent("rdzk:normal1")
end, false)

RegisterCommand("rdzk_ipl_xmas2", function(source, args, raw)
    TriggerServerEvent("rdzk:xmas2")
end, false)

RegisterCommand("rdzk_ipl_normal2", function(source, args, raw)
    TriggerServerEvent("rdzk:normal2")
end, false)

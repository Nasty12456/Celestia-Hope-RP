--[[
---------------------------------------------------
LUXART VEHICLE CONTROL V3 (FOR FIVEM)
---------------------------------------------------
Coded by Lt.Caine
ELS Clicks by Faction
Additional Modification by TrevorBarns
---------------------------------------------------
FILE: server.lua
PURPOSE: Handle version checking, syncing vehicle 
states.
---------------------------------------------------
]]

local curr_version = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
local experimental = GetResourceMetadata(GetCurrentResourceName(), 'experimental', 0) == 'true' 

local plugin_count = 0
local plugins_cv = { }		-- table of active plugins current versions plugins_cv = { ['<pluginname>'] = <version> }
local plugins_rv = { }		-- table of active plugins repository versions

---------------VEHICLE STATE EVENTS----------------
RegisterServerEvent('lvc:GetRepoVersion_s') 
AddEventHandler('lvc:GetRepoVersion_s', function()
	TriggerClientEvent('lvc:SendRepoVersion_c', source, repo_version)
end)

RegisterServerEvent('lvc:TogDfltSrnMuted_s')
AddEventHandler('lvc:TogDfltSrnMuted_s', function(toggle)
	TriggerClientEvent('lvc:TogDfltSrnMuted_c', -1, source, toggle)
end)

RegisterServerEvent('lvc:SetLxSirenState_s')
AddEventHandler('lvc:SetLxSirenState_s', function(newstate)
	TriggerClientEvent('lvc:SetLxSirenState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:SetPwrcallState_s')
AddEventHandler('lvc:SetPwrcallState_s', function(newstate)
	TriggerClientEvent('lvc:SetPwrcallState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:SetAirManuState_s')
AddEventHandler('lvc:SetAirManuState_s', function(newstate)
	TriggerClientEvent('lvc:SetAirManuState_c', -1, source, newstate)
end)

RegisterServerEvent('lvc:TogIndicState_s')
AddEventHandler('lvc:TogIndicState_s', function(newstate)
	TriggerClientEvent('lvc:TogIndicState_c', -1, source, newstate)
end)

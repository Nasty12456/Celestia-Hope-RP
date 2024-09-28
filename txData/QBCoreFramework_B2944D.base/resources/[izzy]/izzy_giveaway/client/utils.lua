Framework = nil

if Config.Framework == "qb" then
	Framework = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "oldqb" then
	Framework = nil 
	CreateThread(function()
		while Framework == nil do
			TriggerEvent('QBCore:GetObject', function(obj) Framework = obj end)
			Wait(10)
		end
	end)
elseif Config.Framework == "esx" then
	Framework = exports['es_extended']:getSharedObject()
elseif Config.Framework == "oldesx" then
	Framework = nil
	CreateThread(function()
		while Framework == nil do
			TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
			Wait(10)
		end
	end)
end

function triggerServerCallback(...)
	if Config.Framework == "qb" then
		Framework.Functions.TriggerCallback(...)
	else
		Framework.TriggerServerCallback(...)
	end
end
RegisterNetEvent('brutal_notify:SendAlert')
AddEventHandler('brutal_notify:SendAlert', function(title, message, time, type)
	SendAlert(title, message, time, type)
end)

function SendAlert(title, message, time, type)
	if title == nil then title = 'Notify' end
	if message == nil then message = 'The message value is nil.' end
	if time == nil then time = 5000 end
	
	if type == nil then
		type = 'info'
	end

	if type == 'success' or type == 'warning' or type == 'info' or type == 'error' then
	else
		type = 'info'
	end

	SendNUIMessage({action = 'open', title = title, type = type, message = message, time = time})
end

function Esc(esc, title, message, action)
	SendNUIMessage({action = action, esc = esc, title = title, message = message})
end

RegisterCommand(Config.NotifyEdit.Command, function()
	SetNuiFocus(true,true)

	exports['brutal_notify']:Esc(false, Config.NotifyEdit.Title, Config.NotifyEdit.Text, 'open2')

	RegisterNUICallback("close", function()
		exports['brutal_notify']:Esc(true, Config.NotifyEdit.Title, Config.NotifyEdit.Text, 0)
		SetNuiFocus(false,false)
	end) 
end)

RegisterCommand(Config.NotifyReset, function()
	SendNUIMessage({action = 'reset'})
end)

---------------------------------------------------
-------------- NOT RENAME THE SCRIPT --------------
---------------------------------------------------

Citizen.CreateThread(function()
	Citizen.Wait(1000*30)
	if GetCurrentResourceName() ~= 'brutal_notify' then
		while true do
			Citizen.Wait(1)
			print("Please don't rename the script! Please rename it back to 'brutal_notify'")
		end
	end
end)
--This function shows a notification to the player
--@message	message to send to the player

function ShowNotification(message)
	ESX.ShowNotification(message)
end

--Civilian Timer
function CivilianTimer()
	Citizen.CreateThread(function()
		Wait(Config.CivilianTimer*1000)
		
		ESX.TriggerServerCallback('battlepass:updateTimeCivilian', function(xp)
			battlepass.xp = xp
			
			if battlepass.xp == Config.MaxCivilianXpPerLevel and Config.ShowNotificationMaxXp then
				ShowNotification('Battlepass max civilian xp reached! ['..battlepass.xp..'/'..Config.MaxCivilianXpPerLevel..']')
			end
			
			CivilianTimer()
		end)
	end)
end

--Criminal Timer
function CriminalTimer()
	Citizen.CreateThread(function()
		Wait(Config.CriminalTimer*1000)
		
		ESX.TriggerServerCallback('battlepass:updateTimeCriminal', function(cr_xp)
			battlepass.cr_xp = cr_xp
			
			if battlepass.cr_xp == Config.MaxCriminalXpPerLevel and Config.ShowNotificationMaxXp then
				ShowNotification('Battlepass max criminal xp reached! ['..battlepass.cr_xp..'/'..Config.MaxCriminalXpPerLevel..']')
			end
			
			CriminalTimer()
		end)
	end)
end

--This function can be used to add code regarding what you need in order to buy a battlepass level

function OnBattlepassBuyLevel(type)
	local elements = {
		{label = 'YES',	value = true},
		{label = 'NO',	value = false}
	}
	
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_level', {
		title    = 'Buy '..type..' battlepass level? $'..Config.Prices[type].LevelPrice,
		align    = 'center',
		elements = elements,
	},
	function(data, menu)
		local answer = data.current.value
		
		menu.close()
		
		if answer then
			TriggerServerEvent('battlepass:buyLevelBattlepass', type)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

--This function can be used to add code regarding what you need in order to reset the battlepass

function OnBattlepassBuyReset(type)
	local elements = {
		{label = 'YES',	value = true},
		{label = 'NO',	value = false}
	}
	
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_reset', {
		title    = 'Buy '..type..' battlepass reset? $'..Config.Prices[type].resetPrice,
		align    = 'center',
		elements = elements,
	},
	function(data, menu)
		local answer = data.current.value
		
		menu.close()
		
		if answer then
			TriggerServerEvent('battlepass:buyResetBattlepass', type)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end
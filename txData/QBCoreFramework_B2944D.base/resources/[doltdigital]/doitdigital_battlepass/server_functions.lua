local discordWebhook = ''	--Enter discord webhook here

function SendToDiscord(msg)
	if Config.EnableLog then
		PerformHttpRequest(discordWebhook, function(Error, Content, Head) end, 'POST', json.encode({username = 'Batttlepass', content = msg}), {['Content-Type'] = 'application/json'})
	end
end

--This function checks if a player can buy a battlepass level
--@player 	the player who wants to buy a level
--@type		the battlepass type [civilian or criminal]
--@return	true on success, false on fail

function CanBuyBattlepassLevel(player, type)
	local xPlayer = ESX.GetPlayerFromId(player)
	
	if xPlayer then
		if xPlayer.getAccount('bank').money >= Config.Prices[type].LevelPrice then
			xPlayer.removeAccountMoney('bank', Config.Prices[type].LevelPrice)
			return true
		else
			TriggerClientEvent('battlepass:showNotification', player, 'You don\'t have enough money')
		end
	end
	
	return false
end

--This function checks if a player can reset his battlepass
--@player 	the player who wants to buy a level
--@type		the battlepass type [civilian or criminal]
--@return	true on success, false on fail

function CanResetBattlepassLevel(player, type)
	local xPlayer = ESX.GetPlayerFromId(player)
	
	if xPlayer then
		if xPlayer.getAccount('bank').money >= Config.Prices[type].resetPrice then
			xPlayer.removeAccountMoney('bank', Config.Prices[type].resetPrice)
			return true
		else
			TriggerClientEvent('battlepass:showNotification', player, 'You don\'t have enough money')
		end
	end
	
	return false
end

--This function checks if a player is criminal
--@player 	the player who wants to buy a level
--@return	true if is criminal, false if not

function IsPlayerCriminal(player)
	if Config.IsEveryoneCriminal then
		return true
	end
	
	return false
end

--This function add an item to the player
--@player 	the player to give the item
--@item 	the item to give
--@amount 	the amount to give
--@return	true on success, false on fail

function AddInventoryItem(player, item, amount)
	local xPlayer = ESX.GetPlayerFromId(player)
	
	if xPlayer.canCarryItem(item, amount) then
		xPlayer.addInventoryItem(item, amount)
		return true
	end
	
	TriggerClientEvent('battlepass:showNotification', player, 'You don\'t have enough space in your inventory')
	
	return false
end
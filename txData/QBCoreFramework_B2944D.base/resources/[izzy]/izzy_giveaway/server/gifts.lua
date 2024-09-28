function giveGift(type, src)
	local xPlayer = getXPlayer(src)

	if type == "1" then
		if Config.Framework == "qb" or Config.Framework == "oldqb" then
			xPlayer.Functions.AddItem(gift.item, tonumber(gift.amount))
		else
			xPlayer.addInventoryItem(gift.item, tonumber(gift.amount))
		end
	elseif type == "3" then
		if Config.Framework == "qb" or Config.Framework == "oldqb" then
			xPlayer.Functions.AddMoney('bank', tonumber(gift.amount), "Giveaway!")
		else
			xPlayer.addAccountMoney('bank', tonumber(gift.amount))
		end
	else
		local plate = GeneratePlate()
		
		if Config.Framework == "qb" or Config.Framework == "oldqb" then
			mysqlQuery(
				'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
				{
					xPlayer.PlayerData.license,
					xPlayer.PlayerData.citizenid,
					gift.item,
					GetHashKey(gift.item),
					'{}',
					plate,
					'pillboxgarage',
					1
				})
				TriggerClientEvent("izzy_giveaway:client:updateProperties", src, plate, gift.item)
		else
			mysqlQuery('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)', {
				xPlayer.identifier,
				plate,
				'{"plate":"' .. plate .. '","model":"' .. GetHashKey(gift.item) .. '"' .. '}'
			})
			TriggerClientEvent("izzy_giveaway:client:updateProperties", src, plate, gift.item)
		end
	end
end
QBCore = exports[Config.qbPrefix.."-core"]:GetCoreObject()

Webhook = ''

function getMoney(type, xPlayer)
	local moneyCount = 0
	if type == "cash" then
		moneyCount = xPlayer.PlayerData.money.cash
	else
		moneyCount = xPlayer.PlayerData.money.bank
	end
	
	return moneyCount
end

function addMoney(type, value, xPlayer)
	xPlayer.Functions.AddMoney(type, value)
end

function removeMoney(type, value, xPlayer)
	xPlayer.Functions.RemoveMoney(type, value)
end

function addItem(xPlayer, item, amount, data)
	xPlayer.Functions.AddItem(item, tonumber(amount))
end

function removeItem(xPlayer, item, amount)
	xPlayer.Functions.RemoveItem(item, tonumber(amount))
end

function canCarryIt(item, amount, xPlayer)
	if Config.UseOx_inventory then
		return exports.ox_inventory:CanCarryItem(xPlayer.PlayerData.source, item, amount)
	end
	
	local totalWeight = QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items)
	local itemInfo = QBCore.Shared.Items[item:lower()]
	if not itemInfo then
		TriggerClientEvent('QBCore:Notify', xPlayer.PlayerData.source, 'This item doesn\'t exits', 'error')
		return
	end
	amount = tonumber(amount)
	if (totalWeight + (itemInfo['weight'] * amount)) <= 120000 then
		return true
	else
		return false
	end
end

function hasPermission(source)
	local staff = false
	for k,v in ipairs(Config.AdminGroups) do
		if QBCore.Functions.HasPermission(source, v) then
			staff = true
			break
		end
	end

	return staff
end

function MySQLexecute(query, values, func)
	return MySQL.query(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.query(query, values, func)
end

function giveXP(xPlayer, xp, workbench)
	if Config.SameLevelForAllTables then
		MySQLexecute('UPDATE players SET '..Config.xpColumnsName..' = xp+@xp WHERE citizenid = @identifier', {
			['@identifier'] = xPlayer.PlayerData.citizenid,
			['@xp'] = Config.DoubleXP and xp*2 or xp,
		}, function (result)
			TriggerClientEvent(Config.EventPrefix..':updateXP', xPlayer.PlayerData.source)
		end)
	else
		MySQLexecute('UPDATE players SET '..Config.xpColumnsName..' = JSON_SET(xp, @table, JSON_EXTRACT(xp, @table) + @xp) WHERE citizenid = @identifier', {
			['@identifier'] = xPlayer.PlayerData.citizenid,
			['@xp'] = Config.DoubleXP and xp*2 or xp,
			['@table'] = "$."..workbench,
		}, function (result)
			TriggerClientEvent(Config.EventPrefix..':updateXP', xPlayer.PlayerData.source)
		end)
	end
end

QBCore.Functions.CreateCallback(Config.EventPrefix..":inv2", function(source, cb, item, isMoney)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local itemS = {}
	if isMoney == "false" then
		isMoney = false
	elseif isMoney == "true" then
		isMoney = true
	end

	if isMoney then
		local playerMoney = getMoney(item, xPlayer)
		itemS.name = item
		itemS.amount = playerMoney
	else
		itemS = xPlayer.Functions.GetItemByName(item)
		if itemS == nil then
			itemS = {
				name = item,
				amount = 0
			}
		end
		if itemS.count ~= nil then
			itemS.amount = itemS.count
		end
	end

	cb(itemS)
end)

QBCore.Functions.CreateCallback(Config.EventPrefix..":maxCraft", function(source, cb, recipe, maxCraftAmount, isDisassemble, itemC, itmNeeded)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local maxCraft = maxCraftAmount
	local itemAmt = 0 

	if not isDisassemble then
		for k,v in ipairs(recipe) do
			local item = {}
			local itemCount = 0

			if v[4] then
				itemCount = getMoney(v[1], xPlayer)
			else
				item = xPlayer.Functions.GetItemByName(v[1])
				if item == nil then
					item = {
						name = v[1],
						amount = 0
					}
				end
				if item.count ~= nil then
					item.amount = item.count
				end
				itemCount = item.amount
			end

			if itemCount > 0 then
				local possibleToCraft = itemCount/tonumber(v[2])
				if possibleToCraft > 0 then
					if maxCraft > possibleToCraft then
						maxCraft = possibleToCraft
					end
				else
					maxCraft = 0
					break
				end
			else
				maxCraft = 0
				break
			end
		end
	else
		local item = xPlayer.Functions.GetItemByName(itemC)
		if item == nil then
			item = {
				name = itemC,
				amount = 0
			}
		end
		if item.count ~= nil then
			item.amount = item.count
		end
		itemAmt = item.amount

		if itemAmt > 0 then
			local possibleToCraft = itemAmt/tonumber(itmNeeded)
			if possibleToCraft > 0 then
				if maxCraft > possibleToCraft then
					maxCraft = possibleToCraft
				end
			else
				maxCraft = 0
			end
		else
			maxCraft = 0
		end
	end
	
	cb(math.floor(maxCraft), itemAmt)
end)

QBCore.Functions.CreateCallback(Config.EventPrefix..":CanCraftItem", function(source, cb, itemID, recipe, itemName, amount, isItem, workbench, timeCraft, CraftQueues, xp, pc, isDis, itemData)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local canCraft = true

	if not isDis then
		for k,v in pairs(recipe) do
			if v[4] == "false" then
				local item = xPlayer.Functions.GetItemByName(v[1])
				if item == nil then
					item = {
						name = v[1],
						amount = 0
					}
				end
				if item.count ~= nil then
					item.amount = item.count
				end
				if item.amount < v[2] then
					canCraft = false
				end
			else
				local playerMoney = getMoney(v[1], xPlayer)
				if playerMoney < v[2] then
					canCraft = false
				end
			end
		end
	else
		local item = xPlayer.Functions.GetItemByName(itemID)
		if item == nil then
			item = {
				name = itemID,
				amount = 0
			}
		end
		if item.count ~= nil then
			item.amount = item.count
		end
		if tonumber(item.amount) < tonumber(amount) then
			canCraft = false
		end
	end

	if canCraft then
		if not isDis then
			for k,v in pairs(recipe) do
				if v[3] == "true" then
					if v[4] == "true" then
						removeMoney(v[1], v[2], xPlayer)
					else
						removeItem(xPlayer, v[1], v[2])
					end
				end
			end
		else
			removeItem(xPlayer, itemID, tonumber(amount))
		end

		local queue = CraftQueues
		if queue ~= nil and queue[workbench] ~= nil then
			queue[workbench][#queue[workbench]+1] = {
				item = itemID,
				recipe = recipe,
				amount = amount,
				isItem = isItem,
				time = timeCraft,
				itemName = itemName[itemID],
				isDone = false,
				isPending = true,
				randomID = math.random(100000000, 999999999),
				xp = xp,
				sucPC = pc,
				suc = true,
				isDis = isDis,
				data = itemData
			}
			
			MySQLexecute('UPDATE players SET '..Config.craftQueryColumnName..' = @okokcrafts WHERE citizenid = @identifier', {
				['@identifier'] = xPlayer.PlayerData.citizenid,
				['@okokcrafts'] = json.encode(queue),
			}, function (result)
				TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('added_to_queue').title, interp(_L('added_to_queue').text, {s1 = itemName[itemID]}), _L('added_to_queue').time, _L('added_to_queue').type)

				if Webhook ~= "" then
					data = {
						playerid = xPlayer.PlayerData.source,
						type = "start-craft",
						item = itemName[itemID],
						amount = amount,
					}

					discordWebhook(data)
				end

				cb(queue)
			end)
		else
			if queue == nil then
				queue = {}
			end
			queue[workbench] = {}
			queue[workbench] = {
				[1] = {
					item = itemID,
					recipe = recipe,
					amount = amount,
					isItem = isItem,
					time = timeCraft,
					itemName = itemName[itemID],
					isDone = false,
					isPending = true,
					randomID = math.random(100000000, 999999999),
					xp = xp,
					sucPC = pc,
					suc = true,
					isDis = isDis,
					data = itemData
				}
			}
			
			MySQLexecute('UPDATE players SET '..Config.craftQueryColumnName..' = @okokcrafts WHERE citizenid = @identifier', {
				['@identifier'] = xPlayer.PlayerData.citizenid,
				['@okokcrafts'] = json.encode(queue),
			}, function (result)
				TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('added_to_queue').title, interp(_L('added_to_queue').text, {s1 = itemName[itemID]}), _L('added_to_queue').time, _L('added_to_queue').type)
				
				if Webhook ~= "" then
					data = {
						playerid = xPlayer.PlayerData.source,
						type = "start-craft",
						item = itemName[itemID],
						amount = amount,
					}
					discordWebhook(data)
				end

				cb(queue)
			end)
		end
	else
		TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('cant_craft').title, interp(_L('cant_craft').text, {s1 = itemName[itemID]}), _L('cant_craft').time, _L('cant_craft').type)
		cb(false)
	end
end)

RegisterServerEvent(Config.EventPrefix..':claimAll')
AddEventHandler(Config.EventPrefix..':claimAll', function(workbench, AllQueues)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local CraftsQueue = AllQueues
	local queue = CraftsQueue[workbench]
	local v = queue[1]
	
	if v ~= nil then
		if v.isDone then
			if v.suc then
				if not v.isDis then
					local canCarry = false
					if v.isItem then
						if canCarryIt(v.item, v.amount, xPlayer) then
							addItem(xPlayer, v.item, v.amount, v.data)
							canCarry = true
						end
					else
						if canCarryIt(v.item, v.amount, xPlayer) then
							addItem(xPlayer, v.item, v.amount)
							canCarry = true
						end
					end

					if canCarry then
						if Webhook ~= "" then
							data = {
								playerid = xPlayer.PlayerData.source,
								type = "claim-craft",
								item = v.itemName,
								amount = v.amount,
							}

							discordWebhook(data)
						end

						if Config.UseXP then
							giveXP(xPlayer, v.xp, workbench)
						end
						TriggerClientEvent(Config.EventPrefix..':removeItemsFromQueue', xPlayer.PlayerData.source, 1, workbench)
					else
						TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('cant_carry').title, _L('cant_carry').text, _L('cant_carry').time, _L('cant_carry').type)
						TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('claimed_all_items').title, _L('claimed_all_items').text, _L('claimed_all_items').time, _L('claimed_all_items').type)
						TriggerClientEvent(Config.EventPrefix..':resetClaimAllButton', xPlayer.PlayerData.source)
					end
				else
					local canCarry = true
					for k2,v2 in ipairs(v.recipe) do
						if v2[4] == "false" or v2[4] == false then
							if not canCarryIt(v2[1], v2[2], xPlayer) then
								canCarry = false
							end
						end
					end

					if canCarry then
						for k2,v2 in ipairs(v.recipe) do
							if v2[4] == "true" or v2[4] == true then
								addMoney(v2[1], v2[2], xPlayer)
							else
								addItem(xPlayer, v2[1], v2[2])
							end
						end

						if Webhook ~= "" then
							data = {
								playerid = xPlayer.PlayerData.source,
								type = "claim-craft",
								item = v.itemName,
								amount = v.amount,
							}

							discordWebhook(data)
						end
						

						if Config.UseXP then
							giveXP(xPlayer, v.xp, workbench)
						end
						TriggerClientEvent(Config.EventPrefix..':removeItemsFromQueue', xPlayer.PlayerData.source, 1, workbench)
					else
						TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('cant_carry').title, _L('cant_carry').text, _L('cant_carry').time, _L('cant_carry').type)
						TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.PlayerData.source, _L('claimed_all_items').title, _L('claimed_all_items').text, _L('claimed_all_items').time, _L('claimed_all_items').type)
						TriggerClientEvent(Config.EventPrefix..':resetClaimAllButton', xPlayer.PlayerData.source)
					end
				end
			else
				if Webhook ~= "" then
					data = {
						playerid = xPlayer.PlayerData.source,
						type = "failed-craft",
						item = v.itemName,
						amount = v.amount,
					}

					discordWebhook(data)
				end
				if Config.GiveXPOnCraftFailed and Config.UseXP then
					if Config.UseXP then
						giveXP(xPlayer, v.xp, workbench)
					end
				end
				TriggerClientEvent(Config.EventPrefix..':removeItemsFromQueue', xPlayer.PlayerData.source, 1, workbench)
			end
		end
	end
end)

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
	local identifiers = {
		steam = "",
		ip = "",
		discord = "",
		license = "",
		xbl = "",
		live = ""
	}

	for i = 0, GetNumPlayerIdentifiers(id) - 1 do
		local playerID = GetPlayerIdentifier(id, i)

		if string.find(playerID, "steam") then
			identifiers.steam = playerID
		elseif string.find(playerID, "ip") then
			identifiers.ip = playerID
		elseif string.find(playerID, "discord") then
			identifiers.discord = playerID
		elseif string.find(playerID, "license") then
			identifiers.license = playerID
		elseif string.find(playerID, "xbl") then
			identifiers.xbl = playerID
		elseif string.find(playerID, "live") then
			identifiers.live = playerID
		end
	end

	return identifiers
end

-------------------------- WEBHOOK

function discordWebhook(data)
	local color = '65352'
	local category = 'default'
	local item = ''
	local amount = ''
	local identifierlist = ExtractIdentifiers(data.playerid)
	local identifier = identifierlist.license:gsub("license2:", "")
	local discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"

	if data.type == 'start-craft' then
		color = Config.StartCraftWebhookColor
		category = 'Started a craft'
		item = data.item
		amount = data.amount
	elseif data.type == 'cancel-craft' then
		color = Config.CancelWebhookColor
		category = 'Canceled a craft'
		item = data.item
		amount = data.amount
	elseif data.type == 'claim-craft' then
		color = Config.ClaimCraftWebhookColor
		category = 'Claimed'
		item = data.item
		amount = data.amount
	elseif data.type == 'failed-craft' then
		color = Config.FailedCraftWebhookColor
		category = 'Failed a craft'
		item = data.item
		amount = data.amount
	end

	local information = {
		{
			["color"] = color,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'CRAFTING',
			["description"] = '**Action:** '..category..'\n**Item:** '..item..'\n**Amount:** '..amount..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..identifier..'\n**Discord:** '..discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}

	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end
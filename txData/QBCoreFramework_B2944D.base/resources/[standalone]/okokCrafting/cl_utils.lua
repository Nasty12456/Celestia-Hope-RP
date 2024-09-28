QBCore = exports[Config.qbPrefix.."-core"]:GetCoreObject()

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, time, type)
	exports['okokNotify']:Alert(title, text, time, type)
end)

RegisterNetEvent(Config.EventPrefix..":openTextUI")
AddEventHandler(Config.EventPrefix..":openTextUI", function(text)
	exports['qb-core']:DrawText(text, 'left')
end)

RegisterNetEvent(Config.EventPrefix..":closeTextUI")
AddEventHandler(Config.EventPrefix..":closeTextUI", function()
	exports['qb-core']:HideText()
end)

function onOpenMenu()
	-- Executed when the menu is opened
end

function onCloseMenu()
	-- Executed when the menu is closed
end

function claimAll(workbench, CraftQueues)
    TriggerServerEvent(Config.EventPrefix..':claimAll', workbench, CraftQueues)
end

Citizen.CreateThread(function()
	if Config.UseXP then
		if Config.SameLevelForAllTables then
			TriggerEvent('chat:addSuggestion', '/'..Config.SetXPCommand, _L('suggestion_xp').maintext, {
				{ name=_L('suggestion_xp').id, help=_L('suggestion_xp').idtext },
				{ name=_L('suggestion_xp').xp, help=_L('suggestion_xp').xptext },
			})

			TriggerEvent('chat:addSuggestion', '/'..Config.SetLevelCommand, _L('suggestion_level').maintext, {
				{ name=_L('suggestion_level').id, help=_L('suggestion_level').idtext },
				{ name=_L('suggestion_level').level, help=_L('suggestion_level').leveltext },
			})
		else
			TriggerEvent('chat:addSuggestion', '/'..Config.SetXPCommand, _L('suggestion_xp').maintext, {
				{ name=_L('suggestion_xp').id, help=_L('suggestion_xp').idtext },
				{ name=_L('suggestion_xp').xp, help=_L('suggestion_xp').xptext },
				{ name=_L('suggestion_xp').workbench, help=_L('suggestion_xp').workbenchtext },
			})

			TriggerEvent('chat:addSuggestion', '/'..Config.SetLevelCommand, _L('suggestion_level').maintext, {
				{ name=_L('suggestion_level').id, help=_L('suggestion_level').idtext },
				{ name=_L('suggestion_level').level, help=_L('suggestion_level').leveltext },
				{ name=_L('suggestion_level').workbench, help=_L('suggestion_level').workbenchtext },
			})
		end
	end
end)

Citizen.CreateThread(function()
	while PlayerData == nil do
		PlayerData = QBCore.Functions.GetPlayerData()
		Citizen.Wait(10)
	end
	while PlayerData.job == nil do
		PlayerData.job = QBCore.Functions.GetPlayerData().job
		Citizen.Wait(10)
	end
	while PlayerData.gang == nil do
		PlayerData.gang = QBCore.Functions.GetPlayerData().gang
		Citizen.Wait(10)
	end
	local inZone = false
	local num = 0
	local nearZone = false
	local enteredRange = false
	local inWideRange = false
	local ped = PlayerPedId()

	while true do
		Citizen.Wait(0)
		local playerExists = false

		if not playerExists then
			if DoesEntityExist(ped) then
				playerExists = true
			else
				ped = PlayerPedId()
			end
		end
		local playerCoords = GetEntityCoords(ped)
		
		nearZone = false
		inZone = false

		for k,v in pairs(Config.Crafting) do
			if v.jobs['all'] ~= nil or checkJob(v.jobs) or checkGang(v.jobs) then
				local distance = #(vector3(v.coordinates[1], v.coordinates[2], v.coordinates[3]) - playerCoords)

				if distance < Config.CraftRadius then
					if closeWorkbench ~= v.tableID then
						closeWorkbench = v.tableID
						workbenchCoords = v.coordinates
					end

					if not gotQueue then
						gotQueue = true
						QBCore.Functions.TriggerCallback(Config.EventPrefix..":getQueue", function(queue, queues)
							CraftQueues = queues
							WorkbenchCraft = queue
						end, v.tableID)
					end
				end
			
				if distance < v.radius + 2 then
					local zDistance = playerCoords.z - v.coordinates[3]
					nearZone = true
					if waitMore and not isCraftOpen then
						waitMore = false
					end
					if not Config.NotInterectableTables then
						if distance < v.radius and zDistance < 3 and zDistance > -3 then
							inZone = true
							
							if IsControlJustReleased(0, Config.Key) and not IsEntityDead(ped) then
								if GetVehiclePedIsUsing(ped) == 0 then
									waitMore = true
									if not isCraftOpen then
										TriggerEvent(Config.EventPrefix..':openWorkbench', k)
									end
								else
									TriggerEvent(Config.EventPrefix..':notification', _L('inside_vehicle').title, _L('inside_vehicle').text, _L('inside_vehicle').time, _L('inside_vehicle').type)
								end
							end
						end
					end
				elseif not waitMore and not inWideRange then
					waitMore = true
				end
			end
		end

		if nearZone and not enteredRange then
			enteredRange = true
			inWideRange = true
		elseif not nearZone and enteredRange then
			enteredRange = false
			inWideRange = false
		end

		if inZone and not hasEntered then
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Open(_L('textUI').text, _L('textUI').color, _L('textUI').side)
			else
				TriggerEvent(Config.EventPrefix..':openTextUI', _L('textUI').text)
			end
			hasEntered = true
		elseif not inZone and hasEntered then
			if Config.UseOkokTextUI then
				exports['okokTextUI']:Close()
			else
				TriggerEvent(Config.EventPrefix..':closeTextUI')
			end
			hasEntered = false
		end 

		if waitMore then
			Citizen.Wait(1000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local canCraft = false
		local queue = CraftQueues[closeWorkbench]
		if CraftQueues[closeWorkbench] ~= nil and closeWorkbench ~= "" and workbenchCoords ~= nil then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(vector3(workbenchCoords[1], workbenchCoords[2], workbenchCoords[3]) - playerCoords)
			local zDistance = playerCoords.z - workbenchCoords[3]

			if distance < Config.CraftRadius then
				local craftingItemID = 1
				for k,v in ipairs(CraftQueues[closeWorkbench]) do
					if v.time >= 0 and not v.isDone then
						craftingItemID = k
						canCraft = true
						break
					end
				end
				if canCraft then
					if not updateTable then
						updateTable = true
					end
					local craftTime = CraftQueues[closeWorkbench][craftingItemID].time
					CraftQueues[closeWorkbench][craftingItemID].isPending = false
					SendNUIMessage({
						action = "ShowCraftCount",
						time = CraftQueues[closeWorkbench][craftingItemID].time,
						name = CraftQueues[closeWorkbench][craftingItemID].itemName,
					})
					
					if CraftQueues[closeWorkbench][craftingItemID].time <= 0 then
						CraftQueues[closeWorkbench][craftingItemID].time = 0
						CraftQueues[closeWorkbench][craftingItemID].isDone = true
						local randomNum = math.random(1, 100)
						if randomNum <= tonumber(CraftQueues[closeWorkbench][craftingItemID].sucPC) then
							SendNUIMessage({
								action = "CompleteCraftCount",
								name = CraftQueues[closeWorkbench][craftingItemID].itemName,
							})
						else
							CraftQueues[closeWorkbench][craftingItemID].suc = false
							SendNUIMessage({
								action = "FailedCraftCount",
								name = CraftQueues[closeWorkbench][craftingItemID].itemName,
							})
						end
						SendNUIMessage({
							action = "updateCraftingItems",
							queue = CraftQueues[closeWorkbench],
						})
						SendNUIMessage({
							action = "HideCraftCount",
						})
						Citizen.Wait(500)
					else
						SendNUIMessage({
							action = "updateCraftingItems",
							queue = CraftQueues[closeWorkbench],
						})
						CraftQueues[closeWorkbench][craftingItemID].time = craftTime - 1 
						Citizen.Wait(1000)
					end
				else
					if updateTable then
						updateTable = false
						QBCore.Functions.TriggerCallback(Config.EventPrefix..":updateQueue", function(cb)

						end, CraftQueues)
					end
					Citizen.Wait(2000)
				end
			else
				Citizen.Wait(3000)
			end
		else
			Citizen.Wait(5000)
		end
	end
end)
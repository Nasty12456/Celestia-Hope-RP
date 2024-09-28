local QBCore = exports['qb-core']:GetCoreObject()
local StartSmoke = false
local give = false
local liquid = false
local hand = false
local mouth = false
local propsmoke_net = nil
local mouthsmoke_net = nil
local success = false
local WeedEffect = false
local ReductionEffect = false
local timer = false
local propearcig_net = nil

local particleDict = "core"
local particleName = "exp_grd_bzgas_smoke"

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end


ShowHelpNotification = function(msg, thisFrame, beep, duration)
	AddTextEntry('HelpNotification', msg)

	if thisFrame then
		DisplayHelpTextThisFrame('HelpNotification', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('HelpNotification')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end


RegisterNetEvent('devcore_smokev2:client:Smoke')
AddEventHandler('devcore_smokev2:client:Smoke', function(item, size, armor, stress, prop, type, time)
	if StartSmoke == true then
		QBCore.Functions.Notify(Languages[Config.Language]['already_smoke'], "error")
	else
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	if type == 'cigarette' then
		playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 9000)
		Citizen.Wait(1000)
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)

		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1500)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
		Citizen.Wait(1300)
		lighter = CreateObject(GetHashKey('ex_prop_exec_lighter_01'), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(lighter, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, -62.0, 0.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		Citizen.Wait(1000)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)

		timer = true
		StartSmoke = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		mouth = true
	end
	if type == 'cigar' then
		playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 9000)
		Citizen.Wait(1000)
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)

		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1500)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, -80.0, true, true, false, true, 1, true)
		Citizen.Wait(1300)
		lighter = CreateObject(GetHashKey('ex_prop_exec_lighter_01'), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(lighter, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, -62.0, 0.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		Citizen.Wait(1000)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		timer = true
		StartSmoke = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		mouth = true
	end
	if type == 'joint' then
		playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 9000)
		Citizen.Wait(1000)
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)

		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1500)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, 80.0, true, true, false, true, 1, true)
		Citizen.Wait(1300)
		lighter = CreateObject(GetHashKey('ex_prop_exec_lighter_01'), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(lighter, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.0, 0.0, -62.0, 0.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		Citizen.Wait(1000)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		timer = true
		StartSmoke = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		mouth = true
	end
	if type == 'vape' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  18905), 0.13, 0.04, 0.0, 0.0, -140.0, -140.0, true, true, false, true, 1, true)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		StartSmoke = true
		hand = true
	end
	if type == 'bong' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  18905), 0.10, -0.25, 0.0, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		StartSmoke = true
		hand = true
	end
			while true do
				Citizen.Wait(1)
				local pos = GetEntityCoords(playerPed)
				if StartSmoke then
					if Config.DisableCombatButtons then
					DisableControlAction(0,229, true)
					DisableControlAction(0,223, true)
					DisableControlAction(0,142, true)
					DisableControlAction(0,25, true)
					DisableControlAction(0,347, true)
					end
					if hand then
						local pos = GetEntityCoords(playerPed)
						if give == false and type == 'vape' then
							if Config.NotifyMenu == 'helpnotify' then
								NotifyChoose(Languages[Config.Language]['vapehelp'] ..size.. ' ml')
							end
							if Config.NotifyMenu == 'textstring' then
								NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
							end
							if Config.NotifyMenu == '3d' then
								NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
							end
						end
					if  give == false and type == 'bong' then
						if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['bonghelp'] ..size.. ' g')
						else
						NotifyChoose(Languages[Config.Language]['bong'] ..size.. ' g')
						end
					end
					if  give == false and type == 'cigarette' or  type == 'cigar' then
					if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['handhelp'])
							
					else
						NotifyChoose(Languages[Config.Language]['hand'])
						end
					end
				if give then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['givehelp'])
					else
					NotifyChoose(Languages[Config.Language]['give'])
					end
					local player, distance = QBCore.Functions.GetClosestPlayer()
    					if player ~= -1 and distance < 2.5 then
       					 local playerId = GetPlayerServerId(player)
						local playerPedRec = GetPlayerPed(player)
					playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPedRec))
					DrawMarker(0, playerX, playerY, playerZ+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 10, 255, 0, 100, true, true, 2, true, false, false, false)
					if IsControlJustPressed(0, Config.ConfirmGiveButton) then
						DetachEntity(NetToObj(propsmoke_net), 1, 1)
						if type == 'joint' or type == 'cigarette' or type == 'cigar' then
						TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
						end
						Citizen.Wait(100)
						DeleteEntity(NetToObj(propsmoke_net))
						propsmoke_net = nil
						TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
						TriggerServerEvent('devcore_smokev2:server:Receiver', playerId, item, size, armor, stress, prop, type, time)
						ClearPedTasks(playerPed)
						StartSmoke = false
						mouth = false
						timer = false
						hand = false
						give = false
						playAnim("mp_common","givetake1_a", 1800)
						break
					end
				end
				if IsControlJustPressed(0, Config.CancelGiveButton) then
						give = false
						ClearPedTasks(playerPed)
						Citizen.Wait(200)
				end
					else
				if  give == false and type == 'vape' then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['vapehelp'] ..size.. ' ml')
					end
					if Config.NotifyMenu == 'textstring' then
						NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
					end
				end
			end
				if  give == false and type == 'bong' then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['bonghelp'] ..size.. ' g')
					else
					NotifyChoose(Languages[Config.Language]['bong'] ..size.. ' g')
					end
				end
					if  give == false and type == 'cigarette' or  type == 'cigar' then
						if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['handhelp'])
						end
						NotifyChoose(Languages[Config.Language]['hand'])
					end
	end
				if mouth then
					local pos = GetEntityCoords(playerPed)
					if  Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['mouthhelp'])
					else
						NotifyChoose(Languages[Config.Language]['mouth'])
					end

				end

	if type == 'cigarette' or type == 'cigar' or  type == 'joint' then
			if size <= 0 then
				size = 0
				Citizen.Wait(200)
				StartSmoke = false
				if mouth then
					playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
					end
				if type == 'cigar' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end
				if type == 'joint' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
			end
		end
					TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
					TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
					if Config.afterSmoking == true then
						GiveArmor(type, armor, stress)
						end
					mouth = false
					hand = false
					timer = false
					give = false
					DetachEntity(NetToObj(propsmoke_net), 1, 1)
					Citizen.Wait(2000)
					DeleteEntity(NetToObj(propsmoke_net))
					propsmoke_net = nil
				break
			end
		end
		if IsPedInAnyVehicle(playerPed, true) then
			local playerVeh = GetVehiclePedIsIn(playerPed, false)
			RollDownWindow(playerVeh, 0)
		end
		if IsEntityInWater(playerPed) then
			StartSmoke = false
			TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
			if type == 'cigarette' or type == 'cigar' or  type == 'joint' then
			TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
			end
			mouth = false
			hand = false
			timer = false
			give = false
			DetachEntity(NetToObj(propsmoke_net), 1, 1)
			Citizen.Wait(2000)
			DeleteEntity(NetToObj(propsmoke_net))
			propsmoke_net = nil
		end
			if not give and IsControlJustPressed(0, Config.SmokeButton) then
				if multiplier >= 0.9009426647617 then
					if type == 'joint' or type == 'bong' then
					QBCore.Functions.Notify(Languages[Config.Language]['enough'], "error")
					end
				else
				if hand then
				mouthsmokeprop = CreateObject(GetHashKey('prop_cigar_01'), x, y, z+0.9,  true,  true, true)
				AttachEntityToEntity(mouthsmokeprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.005, 0.05, 0.003, 30.0, 0.0, 110.0, true, true, false, true, 1, true)
				local netidsmoke = ObjToNet(mouthsmokeprop)
				SetNetworkIdExistsOnAllMachines(netidsmoke, true)
				NetworkSetNetworkIdDynamic(netidsmoke, true)
				SetNetworkIdCanMigrate(netidsmoke, false)
				mouthsmoke_net = netidsmoke
				SetEntityVisible(mouthsmoke_net, false, 0)
				hand = false
				if Config.afterSmoking == false then
					GiveArmor(type, armor, stress)
					end
				if type == 'bong' or type == 'vape' then
					if size < 0.5 then
						size = 0
						QBCore.Functions.Notify(Languages[Config.Language]['empty'], "error")
						hand = true
						DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
						DeleteEntity(NetToObj(mouthsmoke_net))
						mouthsmoke_net = nil
					else
				if type == 'bong' then
					playAnim('anim@safehouse@bong', 'bong_stage1', 7000)
					Citizen.Wait(7500)
					TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
					size = size - Config.BongSizeRemove
					Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
					hand = true

					TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
					DoScreenFadeOut(250)
					Citizen.Wait(1000)
					DoScreenFadeIn(250)
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + bong
					Citizen.Wait(300)
					DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
					DeleteEntity(NetToObj(mouthsmoke_net))
					else
				playAnim('mp_player_inteat@burger', 'mp_player_int_eat_burger', 1000)
				Citizen.Wait(900)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - Config.VapeSizeRemove
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				hand = true
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
				DeleteEntity(NetToObj(mouthsmoke_net))
				mouthsmoke_net = nil
					end
				end
				else
				ExhaleAnim(type)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - math.random(Config.SizeRemove.min, Config.SizeRemove.max)
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				local random = math.random(1, 3)
				if type == 'joint' and random == 3 then
				playAnim('timetable@gardener@smoking_joint', 'idle_cough', 2500)
				Citizen.Wait(2000)
				end
				hand = true
				if type == 'joint' then
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + joint
				end
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
				DeleteEntity(NetToObj(mouthsmoke_net))
				mouthsmoke_net = nil
				end
			end
				if mouth then
					mouth = false
					Citizen.Wait(1000)
					mouthsmokeprop = CreateObject(GetHashKey('prop_cigar_01'), x, y, z+0.9,  true,  true, true)
					AttachEntityToEntity(mouthsmokeprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.030, 0.05, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
				local netidsmoke = ObjToNet(mouthsmokeprop)
				SetNetworkIdExistsOnAllMachines(netidsmoke, true)
				NetworkSetNetworkIdDynamic(netidsmoke, true)
				SetNetworkIdCanMigrate(netidsmoke, false)
				mouthsmoke_net = netidsmoke
				SetEntityVisible(mouthsmoke_net, false, 0)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - math.random(Config.SizeRemove.min, Config.SizeRemove.max)
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				if Config.afterSmoking == false then
					GiveArmor(type, armor, stress)
					end
				if type == 'joint' then
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + joint
				end
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				mouth = true
					DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
					DeleteEntity(NetToObj(mouthsmoke_net))
					mouthsmoke_net = nil
			end
		end
			elseif not give and IsControlJustPressed(0, Config.ThrowButton) then
				if mouth then
					ClearPedTasks(playerPed)
					playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				Citizen.Wait(800)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
					end
				if type == 'cigar' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end
				if type == 'joint' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
				end
			end
			if type == 'bong' or type == 'vape' then
				StartSmoke = false
				ClearPedTasks(playerPed)
				mouth = false
				hand = false
				timer = false
				give = false
				Citizen.Wait(1500)
				DetachEntity(NetToObj(propsmoke_net), 1, 1)
				DeleteEntity(NetToObj(propsmoke_net))
				propsmoke_net = nil
				break
			else
				ClearPedTasks(playerPed)
				StartSmoke = false
				Citizen.Wait(800)
				DetachEntity(NetToObj(propsmoke_net), 1, 1)
				TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
				TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
				mouth = false
				hand = false
				timer = false
				give = false
				Citizen.Wait(2000)
				DeleteEntity(NetToObj(propsmoke_net))
				propsmoke_net = nil
				break
			end
		elseif not mouth and IsControlJustPressed(0, Config.GiveButton) then
			give = true
			elseif not give and hand and IsControlJustPressed(0, Config.MouthButton) then
				if type == 'vape' then
					if size >= Config.MaxLiquid then
						QBCore.Functions.Notify(Languages[Config.Language]['nospace'], "error")
					else
					TriggerServerEvent('devcore_smokev2:server:CheckItem', type)
					Citizen.Wait(1000)
					if liquid then
					playAnim('mp_arresting', 'a_uncuff', 2000)
					Citizen.Wait(1500)
					size = size+ Config.AddLiquidInVape
					liquid = false
					end
				end
				else
					if type == 'bong' then
						if size >= Config.MaxWeed then
							QBCore.Functions.Notify(Languages[Config.Language]['nospace'], "error")
						else
									TriggerServerEvent('devcore_smokev2:server:checkbong')
									Citizen.Wait(500)
									if weed then
										playAnim('mp_arresting', 'a_uncuff', 2000)
										Citizen.Wait(1500)
										size = size+ Config.AddWeedInBong
										weed = false
										hand = true
									end
								end
				else
				mouth = true
				hand = false
				playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				Citizen.Wait(800)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end
					if type == 'cigar' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, -80.0, true, true, false, true, 1, true)
					end
					if type == 'joint' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, 80.0, true, true, false, true, 1, true)
				end
			end
			end
			elseif not give and mouth and IsControlJustPressed(0, Config.HandButton) then
				mouth = false
				hand = true
				playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
					Citizen.Wait(1100)
					if type == 'cigarette' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
						end
						if type == 'cigar' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
						end
						if type == 'joint' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
				end
			end
			else
				break
			end
		end
	end
end)



--Receiver
RegisterNetEvent('devcore_smokev2:client:Receiver')
AddEventHandler('devcore_smokev2:client:Receiver', function(item, size, armor, stress, prop, type, time)
	if StartSmoke == true then
		QBCore.Functions.Notify(Languages[Config.Language]['already_smoke'], "error")
	else
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	playAnim("mp_common","givetake1_a", 1800)
	TriggerServerEvent('devcore_smokev2:server:AddItem', item, size, armor, stress, prop, type, time)
	if type == 'cigarette' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
		Citizen.Wait(800)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1300)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		StartSmoke = true
		timer = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		hand = true
	end
	if type == 'cigar' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
		Citizen.Wait(800)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1300)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		StartSmoke = true
		timer = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		hand = true
	end
	if type == 'joint' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
		Citizen.Wait(800)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		Citizen.Wait(1300)
		DetachEntity(lighter, 1, 1)
		DeleteObject(lighter)
		Citizen.Wait(1000)
		TriggerServerEvent("devcore_smokev2:server:StartPropSmoke", propsmoke_net, type)
		StartSmoke = true
		timer = true
		TriggerEvent('devcore_smokev2:client:RemoveSize', item, size, armor, stress, prop, type, time)
		hand = true
	end
	if type == 'vape' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  18905), 0.13, 0.04, 0.0, 0.0, -140.0, -140.0, true, true, false, true, 1, true)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		StartSmoke = true
		hand = true
	end
	if type == 'bong' then
		mainprop = CreateObject(GetHashKey(prop), x, y, z+0.9,  true,  true, true)
		AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  18905), 0.10, -0.25, 0.0, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
		local netid = ObjToNet(mainprop)
		SetNetworkIdExistsOnAllMachines(netid, true)
		NetworkSetNetworkIdDynamic(netid, true)
		SetNetworkIdCanMigrate(netid, false)
		propsmoke_net = netid
		StartSmoke = true
		hand = true
	end
			while true do
				Citizen.Wait(1)
				if StartSmoke then
					if Config.DisableCombatButtons then
					DisableControlAction(0,229, true)
					DisableControlAction(0,223, true)
					DisableControlAction(0,142, true)
					DisableControlAction(0,25, true)
					DisableControlAction(0,347, true)
					end
					if hand then
						local pos = GetEntityCoords(playerPed)
						if give == false and type == 'vape' then
							if Config.NotifyMenu == 'helpnotify' then
								NotifyChoose(Languages[Config.Language]['vapehelp'] ..size.. ' ml')
							end
							if Config.NotifyMenu == 'textstring' then
								NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
							end
							if Config.NotifyMenu == '3d' then
								NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
							end
						end
					if  give == false and type == 'bong' then
						if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['bonghelp'] ..size.. ' g')
						else
						NotifyChoose(Languages[Config.Language]['bong'] ..size.. ' g')
						end
					end
					if  give == false and type == 'cigarette' or  type == 'cigar' then
					if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['handhelp'])
							
					else
						NotifyChoose(Languages[Config.Language]['hand'])
						end
					end
				if give then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['givehelp'])
					end
					NotifyChoose(Languages[Config.Language]['give'])
					local player, distance = QBCore.Functions.GetClosestPlayer()
    					if player ~= -1 and distance < 2.5 then
       					 local playerId = GetPlayerServerId(player)
						local playerPedRec = GetPlayerPed(player)
					playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPedRec))
					DrawMarker(0, playerX, playerY, playerZ+1.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 10, 255, 0, 100, true, true, 2, true, false, false, false)
				if IsControlJustPressed(0, Config.ConfirmGiveButton) then
					DetachEntity(NetToObj(propsmoke_net), 1, 1)
					if type == 'joint' or type == 'cigarette' or type == 'cigar' then
					TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
					end
					Citizen.Wait(100)
					DeleteEntity(NetToObj(propsmoke_net))
					propsmoke_net = nil
					TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
					TriggerServerEvent('devcore_smokev2:server:Receiver', playerId, item, size, armor, stress, prop, type, time)
					ClearPedTasks(playerPed)
					StartSmoke = false
					mouth = false
					timer = false
					hand = false
					give = false
					playAnim("mp_common","givetake1_a", 1800)
					break
				end
			elseif IsControlJustPressed(0, Config.CancelGiveButton) then
					give = false
					ClearPedTasks(playerPed)
					Citizen.Wait(200)
			end
					if  give == false and type == 'vape' then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['vapehelp'] ..size.. ' ml')
					end
					if Config.NotifyMenu == 'textstring' then
						NotifyChoose(Languages[Config.Language]['vape'] ..size.. ' ml')
					end
				end
			end
				if  give == false and type == 'bong' then
					if Config.NotifyMenu == 'helpnotify' then
						NotifyChoose(Languages[Config.Language]['bonghelp'] ..size.. ' g')
					else
					NotifyChoose(Languages[Config.Language]['bong'] ..size.. ' g')
					end
				end
					if  give == false and type == 'cigarette' or  type == 'cigar' then
						if Config.NotifyMenu == 'helpnotify' then
							NotifyChoose(Languages[Config.Language]['handhelp'])
						end
						NotifyChoose(Languages[Config.Language]['hand'])
					end
	end
		if type == 'cigarette' or type == 'cigar' or  type == 'joint' then
			if size <= 0 then
				size = 0
				if mouth then
					playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
					end
				if type == 'cigar' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end
				if type == 'joint' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
			end
		end
					StartSmoke = false
					mouth = false
					hand = false
					timer = false
					give = false
					TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
					TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
					DetachEntity(NetToObj(propsmoke_net), 1, 1)
					Citizen.Wait(2000)
					DeleteEntity(NetToObj(propsmoke_net))
					propsmoke_net = nil
					if Config.afterSmoking == true then
						GiveArmor(type, armor, stress)
						end
				break
			end
		end
		if IsPedInAnyVehicle(playerPed, true) then
			local playerVeh = GetVehiclePedIsIn(playerPed, false)
			RollDownWindow(playerVeh, 0)
		end
		if IsEntityInWater(playerPed) then
			StartSmoke = false
			TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
			if type == 'cigarette' or type == 'cigar' or  type == 'joint' then
			TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
			end
			mouth = false
			hand = false
			timer = false
			give = false
			DetachEntity(NetToObj(propsmoke_net), 1, 1)
			Citizen.Wait(2000)
			DeleteEntity(NetToObj(propsmoke_net))
			propsmoke_net = nil
		end
			if not give and IsControlJustPressed(0, Config.SmokeButton) then
				if multiplier > 0.9009426647617 then 
					QBCore.Functions.Notify(Languages[Config.Language]['enough'], "error")
				else
				if hand then
				mouthsmokeprop = CreateObject(GetHashKey('prop_cigar_01'), x, y, z+0.9,  true,  true, true)
				AttachEntityToEntity(mouthsmokeprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.030, 0.05, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
				local netidsmoke = ObjToNet(mouthsmokeprop)
				SetNetworkIdExistsOnAllMachines(netidsmoke, true)
				NetworkSetNetworkIdDynamic(netidsmoke, true)
				SetNetworkIdCanMigrate(netidsmoke, false)
				mouthsmoke_net = netidsmoke
				SetEntityVisible(mouthsmoke_net, false, 0)
				hand = false
				if Config.afterSmoking == false then
					GiveArmor(type, armor, stress)
					end
				if type == 'bong' or type == 'vape' then
					if size < 0.5 then
						size = 0
						QBCore.Functions.Notify(Languages[Config.Language]['empty'], "error")
						hand = true
						DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
						DeleteEntity(NetToObj(mouthsmoke_net))
						mouthsmoke_net = nil
					else
				if type == 'bong' then
					playAnim('anim@safehouse@bong', 'bong_stage1', 7000)
					Citizen.Wait(7500)
					TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
					size = size - Config.BongSizeRemove
					Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
					hand = true

					TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
					DoScreenFadeOut(250)
					Citizen.Wait(1000)
					DoScreenFadeIn(250)
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + bong
					Citizen.Wait(300)
					DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
					DeleteEntity(NetToObj(mouthsmoke_net))
					else
				playAnim('mp_player_inteat@burger', 'mp_player_int_eat_burger', 1000)
				Citizen.Wait(900)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - Config.VapeSizeRemove
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				hand = true
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
				DeleteEntity(NetToObj(mouthsmoke_net))
				mouthsmoke_net = nil
					end
				end
				else
				ExhaleAnim(type)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - math.random(Config.SizeRemove.min, Config.SizeRemove.max)
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				local random = math.random(1, 3)
				if type == 'joint' and random == 3 then
				playAnim('timetable@gardener@smoking_joint', 'idle_cough', 2500)
				Citizen.Wait(2000)
				end
				hand = true
				if type == 'joint' then
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + joint
				end
				if Config.afterSmoking == false then
					GiveArmor(type, armor, stress)
				end
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
				DeleteEntity(NetToObj(mouthsmoke_net))
				mouthsmoke_net = nil
				end
			end
				if mouth then
					mouth = false
					Citizen.Wait(1000)
					mouthsmokeprop = CreateObject(GetHashKey('prop_cigar_01'), x, y, z+0.9,  true,  true, true)
					AttachEntityToEntity(mouthsmokeprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.030, 0.05, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
				local netidsmoke = ObjToNet(mouthsmokeprop)
				SetNetworkIdExistsOnAllMachines(netidsmoke, true)
				NetworkSetNetworkIdDynamic(netidsmoke, true)
				SetNetworkIdCanMigrate(netidsmoke, false)
				mouthsmoke_net = netidsmoke
				SetEntityVisible(mouthsmoke_net, false, 0)
				TriggerServerEvent("devcore_smokev2:server:StartMouthSmoke", mouthsmoke_net, type)
				size = size - math.random(Config.SizeRemove.min, Config.SizeRemove.max)
				Citizen.Wait(math.random(Config.ExhaleTime.min, Config.ExhaleTime.max))
				if type == 'joint' then
					WeedEffect = true
					ReductionEffect = true
					multiplier = multiplier + joint
				end
				TriggerServerEvent("devcore_smokev2:server:StopMouthSmoke", mouthsmoke_net)
				Citizen.Wait(300)
				mouth = true
					DetachEntity(NetToObj(mouthsmoke_net), 1, 1)
					DeleteEntity(NetToObj(mouthsmoke_net))
					mouthsmoke_net = nil
			end
		end
			elseif not give and IsControlJustPressed(0, Config.ThrowButton) then
				if mouth then
					ClearPedTasks(playerPed)
					playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				Citizen.Wait(800)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
					end
				if type == 'cigar' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
					end
				if type == 'joint' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
				end
			end
			if type == 'bong' or type == 'vape' then
				StartSmoke = false
				ClearPedTasks(playerPed)
				mouth = false
				hand = false
				give = false
				timer = false
				Citizen.Wait(1500)
				DetachEntity(NetToObj(propsmoke_net), 1, 1)
				DeleteEntity(NetToObj(propsmoke_net))
				propsmoke_net = nil
				break
			else
				ClearPedTasks(playerPed)
				StartSmoke = false
				Citizen.Wait(800)
				DetachEntity(NetToObj(propsmoke_net), 1, 1)
				TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
				TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
				mouth = false
				hand = false
				give = false
				timer = false
				Citizen.Wait(2000)
				DeleteEntity(NetToObj(propsmoke_net))
				propsmoke_net = nil
				break
			end
		elseif not mouth and IsControlJustPressed(0, Config.GiveButton) then
			give = true
			elseif not give and hand and IsControlJustPressed(0, Config.MouthButton) then
				if type == 'vape' then
					if size > Config.MaxLiquid then
						QBCore.Functions.Notify(Languages[Config.Language]['nospace'], "error")
					else
					TriggerServerEvent('devcore_smokev2:server:CheckItem', type)
					Citizen.Wait(1000)
					if liquid then
					playAnim('mp_arresting', 'a_uncuff', 2000)
					Citizen.Wait(1500)
					size = size+ Config.AddLiquidInVape
					liquid = false
					end
				end
				else
					if type == 'bong' then
						if size >= Config.MaxWeed then
							QBCore.Functions.Notify(Languages[Config.Language]['nospace'], "error")
						else
									TriggerServerEvent('devcore_smokev2:server:checkbong')
									Citizen.Wait(500)
									if weed then
										playAnim('mp_arresting', 'a_uncuff', 2000)
										Citizen.Wait(1500)
										size = size+ Config.AddWeedInBong
										weed = false
										hand = true
									end
								end
				else
				mouth = true
				hand = false
				playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
				Citizen.Wait(800)
				if type == 'cigarette' then
					AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.015, -0.009, 0.003, 55.0, 0.0, 110.0, true, true, false, true, 1, true)
					end
					if type == 'cigar' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, -80.0, true, true, false, true, 1, true)
					end
					if type == 'joint' then
						AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 47419), 0.010, 0.0, 0.0, 50.0, 0.0, 80.0, true, true, false, true, 1, true)
				end
			end
			end
			elseif not give and mouth and IsControlJustPressed(0, Config.HandButton) then
				mouth = false
				hand = true
				playAnim('move_p_m_two_idles@generic', 'fidget_sniff_fingers', 1000)
					Citizen.Wait(1100)
					if type == 'cigarette' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed, 64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
						end
						if type == 'cigar' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, -100.0, true, true, false, true, 1, true)
						end
						if type == 'joint' then
							AttachEntityToEntity(mainprop, playerPed, GetPedBoneIndex(playerPed,  64097), 0.020, 0.02, -0.008, 100.0, 0.0, 100.0, true, true, false, true, 1, true)
				end
			end
			else
				break
			end
		end
	end
end)


function GiveArmor(type, armor, stress)
	if Config.EnableGiveArmor then
		AddArmourToPed(GetPlayerPed(-1), armor)
	end
	if Config.EnableRemoveStress then
		TriggerEvent('devcore_smokev2:client:triggerstressqb', stress)
	end
end

RegisterNetEvent('devcore_smokev2:client:triggerstressqb')
AddEventHandler('devcore_smokev2:client:triggerstressqb', function(stress)
	StressTrigger(stress)
end)

RegisterNetEvent('devcore_smokev2:client:CigarettesUnPack')
AddEventHandler('devcore_smokev2:client:CigarettesUnPack', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))

	playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 1000)
	Citizen.Wait(800)
	pack = CreateObject(GetHashKey('prop_cigar_pack_01'), x, y, z+0.9,  true,  true, true)
	AttachEntityToEntity(pack, playerPed, GetPedBoneIndex(playerPed, 64016), 0.020, -0.05, -0.010, 100.0, 0.0, 0.0, true, true, false, true, 1, true)

		playAnim('mp_arresting', 'a_uncuff', 3000)
		Citizen.Wait(3000)
		DetachEntity(pack, 1, 1)
	Citizen.Wait(2000)
	DeleteObject(pack)
end)

RegisterNetEvent('devcore_smokev2:client:RollingJoints')
AddEventHandler('devcore_smokev2:client:RollingJoints', function(source)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))

	playAnim('amb@world_human_smoking@male@male_a@enter', 'enter', 1000)
	Citizen.Wait(800)
	weed = CreateObject(GetHashKey('p_cs_joint_02'), x, y, z+0.9,  true,  true, true)
	AttachEntityToEntity(weed, playerPed, GetPedBoneIndex(playerPed, 64016), 0.020, -0.05, -0.010, 100.0, 0.0, 0.0, true, true, false, true, 1, true)

		playAnim('mp_arresting', 'a_uncuff', 3000)
		Citizen.Wait(3000)
		DetachEntity(weed, 1, 1)
	Citizen.Wait(100)
	DeleteObject(weed)
end)

RegisterNetEvent('devcore_smokev2:client:AddLiquid')
AddEventHandler('devcore_smokev2:client:AddLiquid', function(type)
	liquid = true
end)

RegisterNetEvent('devcore_smokev2:client:AddBong')
AddEventHandler('devcore_smokev2:client:AddBong', function(type)
	weed = true
end)


RegisterNetEvent('devcore_smokev2:client:RemoveSize')
AddEventHandler('devcore_smokev2:client:RemoveSize', function(item, size, armor, stress, prop, type, time)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if timer then
			
		elseif not timer then
			time = 0
			break
		else
			time = 0
			break
		end
	end
end)
repeat
	Citizen.Wait(1000)
	time = time - 1
until time == 0
if timer then
ClearPedTasks(playerPed)
		timer = false
		StartSmoke = false
		TriggerServerEvent('devcore_smokev2:server:RemoveItem', item, size, armor, stress, prop, type, time)
		Citizen.Wait(800)
		DetachEntity(NetToObj(propsmoke_net), 1, 1)
		mouth = false
		hand = false
		Citizen.Wait(2000)
		TriggerServerEvent("devcore_smokev2:server:StopPropSmoke", propsmoke_net)
		Citizen.Wait(500)
		DeleteEntity(NetToObj(propsmoke_net))
		propsmoke_net = nil
end
end)



local RandomAnim = {
	[1] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_a', AnimTime = 2800, Time = 2800},
	[2] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_b', AnimTime = 2800, Time = 2800},
	[3] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_c', AnimTime = 2800, Time = 2800},
	[4] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_a', AnimTime = 2800, Time = 2800},
	[5] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_a', AnimTime = 2800, Time = 2800}
}

local RandomAnimJoint = {
	[1] = {anim = 'amb@world_human_smoking@male@male_a@idle_a', dict = 'idle_b', AnimTime = 2800, Time = 2800},
	[2] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_a', AnimTime = 2800, Time = 2800},
	[3] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_c', AnimTime = 2800, Time = 2800},
	[4] = {anim = 'amb@world_human_aa_smoke@male@idle_a', dict = 'idle_b', AnimTime = 2800, Time = 2800}

}

function ExhaleAnim(type)
	if type == 'joint' then
	local AnimSelectJoint = math.random(1, 4)
		playAnim( RandomAnimJoint[AnimSelectJoint].anim, RandomAnimJoint[AnimSelectJoint].dict, RandomAnimJoint[AnimSelectJoint].AnimTime)
		Citizen.Wait(RandomAnimJoint[AnimSelectJoint].Time)
	else
		local AnimSelect = math.random(1, 5)
		playAnim( RandomAnim[AnimSelect].anim, RandomAnim[AnimSelect].dict, RandomAnim[AnimSelect].AnimTime)
		Citizen.Wait(RandomAnim[AnimSelect].Time)
	end
end


-- Prop Smoke
RegisterNetEvent("devcore_smokev2:client:StartPropSmoke")
AddEventHandler("devcore_smokev2:client:StartPropSmoke", function(propsmokeid, type)
    local entity = NetToObj(propsmokeid)
	if type == 'cigarette' then
		
		RequestNamedPtfxAsset(particleDict)
		while not HasNamedPtfxAssetLoaded(particleDict) do
			Citizen.Wait(100)
		end
	
		UseParticleFxAssetNextCall(particleDict)
		local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.CigaretteSmoke, false, false, false)
		end
		if type == 'cigar' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, 0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.CigarSmoke, false, false, false)
		end
		if type == 'joint' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.090, 0.0, 0.0, 0.0, 0.0, 0.0, Config.JointSmoke, false, false, false)
		end
end)

RegisterNetEvent("devcore_smokev2:client:StopPropSmoke")
AddEventHandler("devcore_smokev2:client:StopPropSmoke", function(propsmokeid)
    local entity = NetToObj(propsmokeid)
    RemoveParticleFxFromEntity(entity)
end)

-- Exhaling smoke
RegisterNetEvent("devcore_smokev2:client:StartMouthSmoke")
AddEventHandler("devcore_smokev2:client:StartMouthSmoke", function(mouthsmokeid, type)
    local entity = NetToObj(mouthsmokeid)

	if type == 'cigarette' then
		
		RequestNamedPtfxAsset(particleDict)
		while not HasNamedPtfxAssetLoaded(particleDict) do
			Citizen.Wait(100)
		end
	
		UseParticleFxAssetNextCall(particleDict)
		local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.CigaretteExhale, false, false, false)
		end
		if type == 'cigar' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, 0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.CigarExhale, false, false, false)
		end
		if type == 'joint' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.JointExhale, false, false, false)
		end
		if type == 'vape' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.VapeExhale, false, false, false)
		end
		if type == 'bong' then
			
			RequestNamedPtfxAsset(particleDict)
			while not HasNamedPtfxAssetLoaded(particleDict) do
				Citizen.Wait(100)
			end
		
			UseParticleFxAssetNextCall(particleDict)
			local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.050, 0.0, 0.0, 0.0, 0.0, 0.0, Config.BongExhale, false, false, false)
		end
end)

RegisterNetEvent("devcore_smokev2:client:StopMouthSmoke")
AddEventHandler("devcore_smokev2:client:StopMouthSmoke", function(mouthsmokeid)
    local entity = NetToObj(mouthsmokeid)
	Citizen.Wait(2000)
    RemoveParticleFxFromEntity(entity)
end)

function NotifyChoose(text)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)
	if Config.NotifyMenu == '3d' then
	DrawText3Ds(pos.x, pos.y, pos.z+1, text)
	end
	if Config.NotifyMenu == 'textstring'then
	ShowTextString(text)
	end
	if Config.NotifyMenu == 'helpnotify' then
		ShowHelpNotification(text)
	end
end


RegisterCommand(Config.EarCigCommand, function()
	if not earcig then
		earcig = true
	local hash = GetHashKey("ng_proc_cigarette01a")
	RequestModel(hash)
		while not HasModelLoaded(hash) do
	   Citizen.Wait(100)
	RequestModel(hash)
		end
	propearcig = CreateObject(hash, GetEntityCoords(PlayerPedId()), true, true, true)
	AttachEntityToEntity(propearcig, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.05, -0.03, -0.08, 80.0, 7.0, -118.0, true, true, false, false, 1, true)
	local netid = ObjToNet(propearcig)
	SetNetworkIdExistsOnAllMachines(netid, true)
	NetworkSetNetworkIdDynamic(netid, true)
	SetNetworkIdCanMigrate(netid, false)
	propearcig_net = netid
	else
		earcig = false
		DetachEntity(NetToObj(propearcig_net), 1, 1)
		DeleteEntity(NetToObj(propearcig_net))
		propearcig_net = nil
	end
end, false)

------------EFFECT----------------------
multiplier = 0.0
joint = 0.1159949
bong = 0.5359949
minusphase4 = 0.014048
maxhighdone = 0.8309426647617
maxhigh = 0.9309426647617
minhigh = 0.1249949


Citizen.CreateThread(function(source)
while true do
	Wait(100)

if WeedEffect then
	local playerPed = PlayerPedId()
	if multiplier > maxhigh then
		multiplier = 0.9309426647617
		RequestAnimSet("move_m@business@a")
		SetPedMovementClipset(GetPlayerPed(-1), "move_m@business@a", true)
		SetFacialIdleAnimOverride(playerPed, 'mood_sulk_1')
	if multiplier < 0.4309426647617 then
		ResetPedMovementClipset(GetPlayerPed(-1), 0)
	end
		else
			SetTimecycleModifier("spectator9")
			SetPedIsDrunk(GetPlayerPed(-1), true)
			SetPedMotionBlur(GetPlayerPed(-1), true)
			SetTimecycleModifierStrength(multiplier)
		end
		end
	end
end)

Citizen.CreateThread(function(source)
	while true do
		Citizen.Wait(15000)
		local player = PlayerId()
	
		if ReductionEffect then
	
			  if multiplier > minhigh then
					SetTimecycleModifier("spectator9")
					SetTimecycleModifierStrength(multiplier)
					multiplier = multiplier - minusphase4
				if multiplier < minhigh	then
					WeedEffect = false
					ReductionEffect = false
					ClearFacialIdleAnimOverride(player)
					ResetPedMovementClipset(GetPlayerPed(-1), 0)
					ClearTimecycleModifier()
					ResetScenarioTypesEnabled()
					SetPedIsDrunk(GetPlayerPed(-1), false)
					SetPedMotionBlur(GetPlayerPed(-1), false)
						end
					end
				end
			end
	end)

	function DrawText3Ds(x, y, z, text)
		local onScreen,_x,_y=World3dToScreen2d(x,y,z)
		local factor = #text / 370
		local px,py,pz=table.unpack(GetGameplayCamCoords())
		SetTextScale(Config.Scale, Config.Scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		DrawRect(_x,_y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 120)
end

	
function ShowTextString(text)
	SetTextFont(0) 
	SetTextProportional(0) 
	SetTextScale(Config.ScaleText, Config.ScaleText) 
	SetTextDropShadow(0, 0, 0, 0,255) 
	SetTextEdge(1, 0, 0, 0, 255) 
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING") 
	AddTextComponentString(text) 
	DrawText(0.01, 0.01) 
end
local QBCore = exports['qb-core']:GetCoreObject()

local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false
local hold = 2

local function putHandsUp(ped)
    if not exports['qb-policejob']:IsHandcuffed() then
        handsup = true
        TaskPlayAnim(ped, animDict, anim, 2.0, 2.0, -1, 50, 0, false, false, false)
    end
end

local function putHandsDown(ped)
    handsup = false
    hold = 2
    ClearPedTasks(ped)
end

CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(1000)
    end

	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(1000)
	end
    
    local ped = PlayerPedId()
    handsup = false
    
    while true do
        Wait(0)

        if IsControlReleased(0, 323) and handsup then
            putHandsDown(ped)
        end

        if IsControlPressed(0, 323) and hold <= 0 and not handsup then
            putHandsUp(ped)
        end

        if IsControlPressed(0, 323) then
            if hold - 1 >= 0 then
                hold = hold - 1
            else
                hold = 0
            end
        end

        if handsup then
            DisableControlAction(0, 59, false) -- Disable steering in vehicle
            DisableControlAction(0, 21, false) -- disable sprint
            DisableControlAction(0, 24, true) -- disable attack
            DisableControlAction(0, 25, true) -- disable aim
            DisableControlAction(0, 47, true) -- disable weapon
            DisableControlAction(0, 58, true) -- disable weapon
            DisableControlAction(0, 71, false) -- veh forward
            DisableControlAction(0, 72, false) -- veh backwards
            DisableControlAction(0, 63, true) -- veh turn left
            DisableControlAction(0, 64, false) -- veh turn right
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 142, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 75, false) -- disable exit vehicle
            DisableControlAction(27, 75, false) -- disable exit vehicle
        end
    end
end)

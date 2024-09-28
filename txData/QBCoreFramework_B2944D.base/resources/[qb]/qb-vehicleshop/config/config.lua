Config = {}

-- Client Trigger to open is TriggerEvent("qb-vehicleshop:open", ID_OF_VEHICLESHOP)

Config.DistanceViewMarker = 20.0
Config.DistanceView3DText = 5.0
Config.DistanceAccess = 2.0 -- The distance in which it will be possible to take a seat by pressing the E key
Config.KeyOpen = 38 -- 38 = E

-- █▀ █▀▄ ▄▀▄ █▄ ▄█ ██▀ █   █ ▄▀▄ █▀▄ █▄▀
-- █▀ █▀▄ █▀█ █ ▀ █ █▄▄ ▀▄▀▄▀ ▀▄▀ █▀▄ █ █

Config.Core = "QB-Core" -- "ESX" or "QB-Core"
Config.CoreDefine = nil
	-- ESX: "esx:getSharedObject" 
	-- QBCore: ""
	-- Or your custom trigger event also you can set nil to core define by exports["es_extended"]:getSharedObject

Config.CoreExport = function()
	--return exports['es_extended']:getSharedObject()
	 return exports['qb-core']:GetCoreObject()
end

-- @PlayerLoaded for ESX: "esx:playerLoaded"
-- @PlayerLoaded for QB-Core: "QBCore:Client:OnPlayerLoaded"
Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded' -- its a trigger to load players tattoos

-- @JobUpdated for ESX: "esx:setJob"
-- @JobUpdated for QB-Core: "QBCore:Client:OnJobUpdate"
Config.JobUpdated = 'QBCore:Client:OnJobUpdate' -- its a trigger to check players job

Config.UseVehicleColorsRGB = true

Config.UseFadeWithSpawn = true
Config.SoundsEffects = true -- if you want to sound effects by clicks set true

Config.Hud = {
	Enable = function()
		DisplayRadar(true)
		-- exports['vms_hud']:Display(true) -- here insert your export / trigger to enable hud after exit from showroom
	end,
	Disable = function()
		DisplayRadar(false)
		-- exports['vms_hud']:Display(false) -- here insert your export / trigger to disable hud after enter to showroom
	end
}

Config.Notification = function(message, time, type)
    if type == "success" then
        --exports["vms_notify"]:Notification("VEHICLE SHOP", message, time, "#27FF09", "fa-solid fa-car")
		-- TriggerEvent('esx:showNotification', message)
        TriggerEvent('QBCore:Notify', message, 'success', time)
    elseif type == "error" then
        --exports["vms_notify"]:Notification("VEHICLE SHOP", message, time, "#FF0909", "fa-solid fa-car")
	-- TriggerEvent('esx:showNotification', message)
        TriggerEvent('QBCore:Notify', message, 'error', time)
    end
end


Config.AccessOnMarker = false -- if you want to use this with marker acces, set true, if you want to use this script with for e.g vms_npctalk set false.

Config.UseTarget = true
Config.TargetResource = 'qb-target'
Config.Target = function(id, data)
    if Config.TargetResource == 'ox_target' then
        exports[Config.TargetResource]:addBoxZone({
            coords = data.coords,
            size = vec(2.0, 2.0, 4.3),
            debug = false,
            useZ = true,
            rotation = data.targetSystemRotation,
            distance = 1.0,
            options = {
                {
                    name = 'vehicleshop-'..id,
                    icon = data.icon,
                    label = data.name,
                    onSelect = function()
						TriggerEvent("qb-vehicleshop:open", id)
					end
                }
            }
        })
    elseif Config.TargetResource == 'qb-target' then
        exports['qb-target']:AddBoxZone('vehicleshop-'..id, data.coords, 2.0, 2.0, {
            name = 'vehicleshop-'..id,
            heading = data.targetSystemRotation,
            debugPoly = false,
            minZ = data.coords.z,
            maxZ = data.coords.z+3.5,
        }, {
            options = {
                {
                    num = 1,
                    icon = 'fas fa-example',
                    label = data.name,
                    targeticon = data.icon,
                    action = function()
						TriggerEvent("qb-vehicleshop:open", id)
					end,
                    drawDistance = 10.0,
                    drawColor = {255, 255, 255, 255},
                    successDrawColor = {30, 144, 255, 255},
                }
            },
            distance = 0.7,
        })
    else
        -- If you are using a target system other than ox_target and qb-target, add your target usability logging function here
    end
end

Config.UseRoutingBucketsInShowRoom = true
Config.UseRoutingBucketsOnTestDrive = true

Config.PlateCustomPrefix = nil -- "PREFIX" or nil
Config.PlateLetters = 3
Config.PlateNumbers = 4

Config.GiveKeysBuy = function(veh, plate, model)
	TriggerEvent('vehiclekeys:client:SetOwner', plate)
	exports['cdn-fuel']:SetFuel(veh, 100)
	-- Here insert your export / trigger to give keys to player and set fuel
end

Config.GiveKeysTestDrive = function(veh, plate, model)
	TriggerEvent('vehiclekeys:client:SetOwner', plate)
	exports['cdn-fuel']:SetFuel(veh, 100)
	-- Here insert your export / trigger to give keys to player and set fuel
end

Config.TestDrive = {
	displayTimer = true, -- this option runs DrawText3D over the vehicle with a countdown timer to the end of the test drive.
	time = 35, -- in seconds
	coords = vector4(-1267.47, -3374.01, 12.94, 327.4), -- coords of spawn the vehicle
	maxDistance = 500, -- maximum distance from coords
}

Config.VehicleShops = {
    [1] = {
		-- blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'motorcycle', 'quad', 'compact', 'classic', 'muscle', 'coupe', 'sedan', 'sport', 'supercar', 'offroad', 'suv', 'pickup', 'van', 'custom'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "CAR DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-38.54, -1100.10, 27.27),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-13.64, -1081.31, 27.05, 65.86),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
	[2] = {
		blip = {sprite = 90, scale = 0.65, color = 30, display = 4},
		categories = {'helicopter', 'airplane'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = false,
		testDrivePrice = 0,
		type = 'fly',
		icon = 'fa-solid fa-plane',
		name = "PLANE DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = 60.0,
		coords = vector3(-941.26, -2954.54, 12.8),
		carCoords = vector4(-974.58, -3000.76, 12.95, 58.63),
		camCoord = vector3(-988.33, -3001.73, 14.95),
		buyCoords = vector4(-974.89, -3082.39, 12.94, 58.0),
		drawable = {
			['marker'] = true,
			['3dtext'] = true
		},
		vehicles = Vehicles[2]
	},

	[3] = {
		-- blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'motorcycle', 'quad', 'compact', 'classic', 'muscle', 'coupe', 'sedan', 'sport', 'supercar', 'offroad', 'suv', 'pickup', 'van', 'custom'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "CAR DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-46.82, -1095.80, 27.27),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-13.64, -1081.31, 27.05, 65.86),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
	[4] = {
		-- blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'motorcycle', 'quad', 'compact', 'classic', 'muscle', 'coupe', 'sedan', 'sport', 'supercar', 'offroad', 'suv', 'pickup', 'van', 'custom'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "CAR DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-51.44, -1094.81, 27.27),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-13.64, -1081.31, 27.05, 65.86),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
	[5] = {
		blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'motorcycle', 'quad', 'compact', 'classic', 'muscle', 'coupe', 'sedan', 'sport', 'supercar', 'offroad', 'suv', 'pickup', 'van', 'custom'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "CAR DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-51.22, -1087.33, 27.27),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-13.64, -1081.31, 27.05, 65.86),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
	[6] = {
		-- blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'motorcycle', 'quad', 'compact', 'classic', 'muscle', 'coupe', 'sedan', 'sport', 'supercar', 'offroad', 'suv', 'pickup', 'van', 'custom'}, -- if you adding new categories, you need add also .svg file at the same name for @qb-vehicleshop/html/icons/
		testDrive = true,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "CAR DEALER",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-40.65, -1094.66, 27.27),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-13.64, -1081.31, 27.05, 65.86),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
}

Config.Translate = {
	['notify.you_bought'] = "You bought %s %s for %s$.",
	['notify.enought_money'] = "You dont have money for %s %s.",
	['notify.you_bought_test'] = "You bought test drive for %s$.",
	['notify.enought_money_for_test'] = "You dont have money for test drive.",
	['3dtext.time_remaining'] = "%s seconds remaining",
	['3dtext.open'] = "Press [E] to open",
}
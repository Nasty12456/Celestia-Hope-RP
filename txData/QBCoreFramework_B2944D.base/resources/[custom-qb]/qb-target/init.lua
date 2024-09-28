function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {
	["flag"] = {
		models = {-1939813147},
		options = {
			{
                type = "client",
                event = "qb-paintball:game:pickupFlag",
                icon = "fas fa-pencil-ruler",
                label = "Get Flag",
            },
		},
		distance = 2.1
	},

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {
	------paitball
	{
		model = "mp_m_bogdangoon",                            
		coords = vector4(5518.5649, 5993.9272, 590.00097, 97.158309),               
		gender = "male",
        scenario = "WORLD_HUMAN_CLIPBOARD"
	},
    {
		model = "u_m_y_rsranger_01",
		coords = vector4(5510.0024, 5996.2939, 590.00109, 3.6256833),         
		gender = "male",
        scenario = "WORLD_HUMAN_GUARD_STAND"
	},
	----------
	{
		model = `csb_chef`,
		coords = vector4(-1178.16, -891.61, 12.76, 304.99),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	-------- shop ped ----------
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(24.43, -1346.67, 28.50, 264.85),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3039.49, 584.39, 6.91, 13.83),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-3242.92, 1000.05, 11.83, 354.82),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1728.07, 6415.59, 34.04, 247.93),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1959.84, 3740.50, 31.34, 305.95),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(549.13, 2670.92, 41.16, 97.72),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2677.46, 3279.77, 54.24, 330.84),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(2556.69, 380.86, 107.62, 3.66),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(372.73, 326.98, 102.57, 258.85),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-46.98, -1758.17, 28.42, 54.27),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-706.14, -913.94, 18.22, 90.97),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1819.98, 794.02, 137.09, 132.21),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1164.70, -322.95, 68.21, 102.39),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1697.96, 4923.03, 41.06, 328.29),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1221.63, -908.05, 11.33, 35.32),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1486.63, -377.68, 39.16, 132.40),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-2966.42, 391.41, 14.04, 93.26),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1165.15, 2710.82, 37.16, 180.18),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(1134.29, -982.93, 45.42, 279.85),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `mp_m_shopkeep_01`,
		coords = vector4(-1030.15, -2759.75, 20.34, 151.19),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	

	-----motel---------
	{
		model = `a_f_y_business_04`,
		coords = vector4(325.08, -229.51, 53.22, 157.11),
		gender = 'female',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_f_y_business_04`,
		coords = vector4(961.50, -193.87, 72.21, 241.32),
		gender = 'female',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	---------------banking
	{
		model = `a_m_y_business_02`,
		coords = vector4(314.50, -280.65, 53.16, 342.03),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(-350.70, -51.52, 48.04, 341.71),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(-1211.31, -331.66, 36.78, 28.75),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(-2961.16, 483.62, 14.70, 87.08),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(1174.31, 2708.22, 37.09, 179.57),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(242.38, 226.71, 105.29, 161.12),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
	{
		model = `a_m_y_business_02`,
		coords = vector4(-112.26, 6471.02, 30.63, 137.56),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	------vehicle sales
	{
		model = `a_m_m_paparazzi_01`,
		coords = vector4(1233.27, 2732.94, 38.01, 271.67),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	----------------insurance--------
	{
		model = `a_m_y_business_02`,
		coords = vector4(-31.64, -1098.86, 26.27, 75.39),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function JobTypeCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = QBCore.Functions.HasItem

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		JobTypeCheck = function(jobType)
			if type(jobType) == 'table' then
				jobType = jobType[PlayerData.job.type]
				if jobType then
					return true
				end
			elseif jobType == 'all' or jobType == PlayerData.job.type then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.excludejob and JobCheck(data.excludejob) then return false end
	if data.jobType and not JobTypeCheck(data.jobType) then return false end
	if data.excludejobType and JobTypeCheck(data.excludejobType) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.excludegang and GangCheck(data.excludegang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end

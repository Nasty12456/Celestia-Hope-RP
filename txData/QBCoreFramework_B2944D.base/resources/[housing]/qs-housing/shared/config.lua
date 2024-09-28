--[[
    Welcome to the qb-houses configuration!
    To start configuring your new asset, please read carefully
    each step in the documentation that we will attach at the end of this message.

    Each important part of the configuration will be highlighted with a box.
    like this one you are reading now, where I will explain step by step each
    configuration available within this file.

    This is not all, most of the settings, you are free to modify it
    as you wish and adapt it to your framework in the most comfortable way possible.
    The configurable files you will find all inside client/custom/*
    or inside server/custom/*.

    Direct link to the resource documentation, read it before you start:
    https://docs.quasar-store.com/information/welcome
]]

Config = {}
Locales = {}

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!

	Languages available by default:
    	'de'
    	'en'
    	'es'
    	'fr'
    	'lt'
    	'pt'
		'ru'
		'zh-CN'
]]

Config.Language = 'en'

--[[
    The current system will detect if you use qb-core or es_extended,
    but if you rename it, you can remove the value from Config.Framework
    and add it yourself after you have modified the framework files inside
    this script.

    Please keep in mind that this code is automatic, do not edit if
    you do not know how to do it.
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
local qbxHas = GetResourceState('qbx_core') == 'started'

Config.Framework = esxHas and 'esx' or qbxHas and 'qbx' or qbHas and 'qb' or 'standalone'

--[[
	The inventory system will help us add a personalized stash to each housing of this asset.
	With this function we can automatically detect what inventory do you use.

	If not on this list, you can configure it directly in the client/custom/inventory/*.lua,
	if you have questions, contact the seller of your asset.
]]

local function getInventory()
	local qsInvHas = GetResourceState('qs-inventory') == 'started'
	local qbInvHas = GetResourceState('qb-inventory') == 'started'
	local l2sInvHas = GetResourceState('l2s-inventory') == 'started'
	local psInvHas = GetResourceState('ps-inventory') == 'started'
	local oxInvHas = GetResourceState('ox_inventory') == 'started'
	local coreInvHas = GetResourceState('core_inventory') == 'started'
	local codemInvHas = GetResourceState('codem-inventory') == 'started'
	local chezzaInvHas = GetResourceState('inventory') == 'started'
	if qsInvHas or qbInvHas or l2sInvHas or psInvHas then
		return 'qs-inventory'
	elseif oxInvHas then
		return 'ox_inventory'
	elseif coreInvHas then
		return 'core_inventory'
	elseif codemInvHas then
		return 'codem-inventory'
	elseif chezzaInvHas then
		return 'inventory'
	else
		return 'default'
	end
end

Config.Inventory = getInventory()

--[[
	The phone system is not the most important thing, but it is a system that will allow
	Put the phone number on the sales board of the home, this way
	We will be able to communicate with the seller of the property before making a certain purchase.

	If you don't use qb-phone or qs-smartphone, you can configure it directly in the
	server/custom/phone/*.lua, if you have questions, contact the seller of your asset.
]]

Config.UseTarget = false -- Set true/false (only qb-target or ox_target)
Config.TargetLength = 5.0
Config.TargetWidth = 5.0

local function getPhone()
	local proHas = GetResourceState('qs-smartphone-pro') == 'started'
	local qsHas = GetResourceState('qs-smartphone') == 'started'
	local lbHas = GetResourceState('lb-phone') == 'started'
	local gksHas = GetResourceState('gksphone') == 'started'
	local okokHas = GetResourceState('okokPhone') == 'started'
	if proHas then
		return 'qs-smartphone-pro'
	elseif qsHas then
		return 'qs-smartphone'
	elseif lbHas then
		return 'lb-phone'
	elseif gksHas then
		return 'gksphone'
	elseif okokHas then
		return 'okokPhone'
	else
		return 'default'
	end
end

Config.Phone = getPhone()

--[[
	Automated configuration of the wardrobe system, here we will detect the wardrobe system
	and it will set yours automatically.

	If not on this list, you can configure it directly in the client/custom/wardrobe/*.lua,
	if you have questions, contact the seller of your asset.
]]

local function getWardrobe()
	local qbcHas = GetResourceState('qb-clothing') == 'started'
	local codemcHas = GetResourceState('mAppearance') == 'started'
	local ak47cHas = GetResourceState('ak47_clothing') == 'started'
	local appearanceHas = GetResourceState('fivem-appearance') == 'started'
	local illeniumHas = GetResourceState('illenium-appearance') == 'started'
	local raidHas = GetResourceState('raid_clothes') == 'started'
	local rcorecHas = GetResourceState('rcore_clothes') == 'started'
	if qbcHas then
		return 'qb-clothing'
	elseif codemcHas then
		return 'mAppearance'
	elseif ak47cHas then
		return 'ak47_clothing'
	elseif appearanceHas then
		return 'fivem-appearance'
	elseif illeniumHas then
		return 'illenium-appearance'
	elseif raidHas then
		return 'raid_clothes'
	elseif rcorecHas then
		return 'rcore_clothes'
	else
		return 'default'
	end
end

Config.Wardrobe = getWardrobe()

--[[
	Automatic garage configuration, if you do not use any compatible garage
	or have not created a compatible garage in the custom files, there will
	automatically be no option to use garages.
]]

local function getGarages()
	local qbgHas = GetResourceState('qb-garages') == 'started'
	local qsHas = GetResourceState('qs-advancedgarages') == 'started'
	local jgHas = GetResourceState('jg-advancedgarages') == 'started'
	local cdHas = GetResourceState('cd_garage') == 'started'
	local okokHas = GetResourceState('okokGarage') == 'started'
	local loafHas = GetResourceState('loaf_garage') == 'started'
	local rcoreHas = GetResourceState('rcore_garage') == 'started'
	local zerioHas = GetResourceState('zerio-garage') == 'started'
	local codemHas = GetResourceState('codem_garage') == 'started'
	local ak47has = GetResourceState('ak47_garage') == 'started'
	if qbgHas then
		return 'qb-garages'
	elseif qsHas then
		return 'qs-advancedgarages'
	elseif jgHas then
		return 'jg-advancedgarages'
	elseif cdHas then
		return 'cd_garage'
	elseif okokHas then
		return 'okokGarage'
	elseif loafHas then
		return 'loaf_garage'
	elseif rcoreHas then
		return 'rcore_garage'
	elseif zerioHas then
		return 'zerio-garage'
	elseif codemHas then
		return 'codem_garage'
	elseif ak47has then
		return 'ak47_garage'
	else
		return 'standalone'
	end
end

Config.Garage = getGarages()

--[[
	General configurations of the asset, read each section to understand each configuration.
	Here we can choose the basic and advanced configuration of the asset.
]]

Config.Society = 'none'       -- 'none', 'esx_society', 'ap-government', 'esx_society' or 'qb-management'
Config.SocietyCommision = 0.3 -- Percentage of the commission for the company (%30 of house price)

Config.CreatorJobs = {        -- Choose the jobs suitable for creating houses
	'realestate',
	'police',
	'realestatejob'
}

Config.TestRemTime = 1           -- Visiting time inside the house (1 = 1 minute)
Config.MinZOffset = 30           -- Minimum shell spawn offset
Config.CreatorAlpha = 200        -- Ignore this if you don't want to edit the Alpha
Config.SignTextScale = 0.6       -- Sale poster text size
Config.TimeInterior = 23         -- This is the time it will be when entering the shells (to avoid alternating shadows)
Config.HideOwnedHouses = true    -- Hide owned houses from the map
Config.GroupBlips = false        -- Hide address on the blips (Short blips)
Config.MaxOwnedHouses = 5        -- Limit of houses per player (5 default)
Config.SellObjectCommision = 0.3 -- Commission that will be charged when selling a piece of furniture
Config.EnableBoard = false       -- Enable or disable the sales board

Config.OpenHouseMenu = 'f11'      -- Key to open the internal menu of the home
Config.OpenJobMenu = 'f12'        -- Key to open the house creation menu

--[[
	Illegal system configuration of the asset, make sure you have this controlled so as not to break the economy or the system of each player.
	Please make use of the mini-game scripts that you will see in the documentation > dependencies.
]]

Config.RequiredCop = 5 -- Number of police required (only for lockpicking)
Config.PoliceJobs = {  -- Jobs that will be considered police
	'realestate',
	'police',
	'realestatejob'
}

Config.EnableRobbery = true            -- Enable or disable the usable item to initiate robberies
Config.EnableRaid = true               -- Enable or disable the usable item to initiate raids
Config.RobberyItem = 'lockpick'        -- Item to start the robbery of houses
Config.StomRamItem = 'police_stormram' -- Item to begin the search of a house

--[[
	Here we will configure the entire rental system for homes and
	even the credit times when purchasing through mortgages.
]]

Config.CreditEq = 0.3        -- Collection percentage for bank loans (default 0.3)
Config.CreditTime = 5        -- Time interval to collect bank credit (5 = 5 minutes)

Config.RentTime = 5          -- Time interval to collect rent (5 = 5 minutes)
Config.EnableRentable = true -- Enable or disable the rental system

--[[
	General configuration of decorations and stash of the house, configure
	if you can decorate anyone with keys or only the owner. Also the basic stash of each home.
]]

Config.MaximumDistanceForDecorate = 350.0
Config.DecorateOnlyAccessForOwner = true -- Can anyone with a key decorate or only the owner?
Config.HideRadarInDecorate = true        -- Disable radar in decorations?

Config.DefaultStashData = {
	maxweight = 2000,
	slots = 30,
}

Config.Music = 'building' -- You can set false if you don't want music
Config.MusicVolume = 0.01 -- Choose a volume for the songs

Config.HandleHud = {
	enable = function()
		Debug('Enable hud triggered')
		-- Enable your hud
	end,
	disable = function()
		Debug('Disable hud triggered')
		-- Disable your hud
	end
}

--[[
	Shell configuration and 3D models for house creations, configure the props
	you want below or shell them in the first configuration, you can add infinity to this list.

	If you don't know how to get more shells, we recommend visiting the store of our trusted
	supplier and partner https://www.k4mb1maps.com, the best FiveM shells.
]]

Config.Shells = {
	[1] = {
		model = 'standardmotel_shell',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://ibb.co/TWHP5jt',
				label = 'Room',
			},
			{
				url = 'https://ibb.co/HKs88cb',
				label = 'Bathroom',
			},
		}

	},
	[2] = {
		model = 'modernhotel_shell',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712598019354684/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712598409420850/Bedroom.webp',
				label = 'Bedroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712598807887942/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712599185371146/Kitchen_and_Dining.webp',
				label = 'Kitchen and Dining',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712599629963366/living_room_1.webp',
				label = 'Living Room Angle 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712599982293022/living_room_2.webp',
				label = 'Living Room Angle 2',
			},
		},

	},
	[3] = {
		model = 'furnitured_midapart',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712919412088955/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712919735054417/bedroom.webp',
				label = 'Bedroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712920083189770/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712920464859257/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101712920846544907/livingroom.webp',
				label = 'Living Room',
			},
		},

	},
	[4] = {
		model = 'shell_garagem',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104288612384/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104926154853/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713105333006357/livingroom.webp',
				label = 'Living Room',
			},
		},

	},
	[5] = {
		model = 'shell_office1',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104288612384/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104926154853/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713105333006357/livingroom.webp',
				label = 'Living Room',
			},
		},

	},
	[6] = {
		model = 'shell_store1',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104288612384/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713104926154853/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713105333006357/livingroom.webp',
				label = 'Living Room',
			},
		},

	},
	[7] = {
		model = 'shell_warehouse1',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713285117648976/entry.webp',
				label = 'Entance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713285449007196/office.webp',
				label = 'Office',
			},
		},
	},
	[8] = {
		model = 'container_shell',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713526319497267/container.webp',
				label = 'Container',
			},
		},

	},
	[9] = {
		model = 'shell_michael',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[10] = {
		model = 'shell_frankaunt',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[11] = {
		model = 'shell_ranch',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[12] = {
		model = 'shell_trailer',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[13] = {
		model = 'shell_lester',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[14] = {
		model = 'shell_v16mid',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[15] = {
		model = 'shell_trevor',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
	[16] = {
		model = 'shell_v16low',
		stash = {
			maxweight = 2000,
			slots = 20,
		},
		imgs = {
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596683145267/bathroom.webp',
				label = 'Bathroom',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597232586777/entry.webp',
				label = 'Entrance',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713597698166844/floor2.webp',
				label = 'Floor 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598201471106/kitchen.webp',
				label = 'Kitchen',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713598734159962/livingroom.webp',
				label = 'Living Room',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599178752020/room1.webp',
				label = 'Room 1',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713599690448956/room2.webp',
				label = 'Room 2',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713600176996394/room3.webp',
				label = 'Room 3',
			},
			{
				url = 'https://cdn.discordapp.com/attachments/1101313033684394084/1101713596179816499/room3dresser.webp',
				label = 'Room 3 Dresser',
			},
		},

	},
}

exports('getShells', function()
	return Config.Shells
end)

Config.HouseObjects = {
	[1] = { -- House 1
		model = 'lf_house_04_',
	},
	[2] = { -- House 2
		model = 'lf_house_05_',
	},
	[3] = { -- House 3
		model = 'lf_house_07_',
	},
	[4] = { -- House 4
		model = 'lf_house_08_',
	},
	[5] = { -- House 5
		model = 'lf_house_09_',
	},
	[6] = { -- House 6
		model = 'lf_house_10_',
	},
	[7] = { -- House 7
		model = 'lf_house_11_',
	},
	[8] = { -- House 8
		model = 'lf_house_13_',
	},
	[9] = { -- House 9
		model = 'lf_house_15_',
	},
	[10] = { -- House 10
		model = 'lf_house_16_',
	},
	[11] = { -- House 11
		model = 'lf_house_17_',
	},
	[12] = { -- House 12
		model = 'lf_house_18_',
	},
	[13] = { -- House 13
		model = 'lf_house_19_',
	},
	[14] = { -- House 14
		model = 'lf_house_20_',
	},
}

Config.Islands = {
	[1] = { -- Island 1
		model = 'qs_pineisland_01',
	},
	[2] = { -- Island 2
		model = 'qs_pineisland_02',
	},
	[3] = { -- Island 3
		model = 'qs_pineisland_03',
	},
	[4] = { -- Island 4
		model = 'qs_treeisland_01',
	},
	[5] = { -- Island 5
		model = 'qs_treeisland_02',
	},
	[6] = { -- Island 6
		model = 'qs_treeisland_03',
	},
	[7] = { -- Island 7
		model = 'qs_tropiisland_01',
	},
	[8] = { -- Island 8
		model = 'qs_tropiisland_02',
	},
	[9] = { -- Island 9
		model = 'qs_tropiisland_03',
	},
}

Config.IplData = {
	{
		-- Apartment
		export = function()
			return exports['bob74_ipl']:GetExecApartment1Object()
		end,
		defaultTheme = 'seductive',
		themes = {
			{ label = 'Modern',     value = 'modern',     price = 500 },
			{ label = 'Moody',      value = 'moody',      price = 500 },
			{ label = 'Vibrant',    value = 'vibrant',    price = 500 },
			{ label = 'Sharp',      value = 'sharp',      price = 500 },
			{ label = 'Monochrome', value = 'monochrome', price = 500 },
			{ label = 'Seductive',  value = 'seductive',  price = 500 },
			{ label = 'Regal',      value = 'regal',      price = 500 },
			{ label = 'Aqua',       value = 'aqua',       price = 500 }
		},
		exitCoords = vec3(-787.44, 315.81, 217.64),
		iplCoords = vec3(-787.78050000, 334.92320000, 215.83840000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Office
		export = function()
			return exports['bob74_ipl']:GetFinanceOffice1Object()
		end,
		defaultTheme = 'warm',
		themes = {
			{ label = 'Warm',         value = 'warm',         price = 500 },
			{ label = 'Classical',    value = 'classical',    price = 500 },
			{ label = 'Cintage',      value = 'vintage',      price = 500 },
			{ label = 'Contrash',     value = 'contrast',     price = 500 },
			{ label = 'Rich',         value = 'rich',         price = 500 },
			{ label = 'Cool',         value = 'cool',         price = 500 },
			{ label = 'Ice',          value = 'ice',          price = 500 },
			{ label = 'Conservative', value = 'conservative', price = 500 },
			{ label = 'Polished',     value = 'polished',     price = 500 }
		},
		exitCoords = vec3(-1579.756, -565.0661, 108.523),
		iplCoords = vec3(-1576.127441, -575.050537, 108.507690),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Night Club
		exitCoords = vec3(-1569.402222, -3017.604492, -74.413940),
		iplCoords = vec3(-1604.664, -3012.583, -78.000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Clubhouse 1
		exitCoords = vec3(1121.037354, -3152.782471, -37.074707),
		iplCoords = vec3(1107.04, -3157.399, -37.51859),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Clubhouse 2
		exitCoords = vec3(997.028564, -3158.136230, -38.911377),
		iplCoords = vec3(998.4809, -3164.711, -38.90733),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Cocaine Lab
		exitCoords = vec3(1088.703247, -3187.463623, -38.995605),
		iplCoords = vec3(1093.6, -3196.6, -38.99841),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Meth Lab
		exitCoords = vec3(996.896729, -3200.914307, -36.400757),
		iplCoords = vec3(1009.5, -3196.6, -38.99682),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Weed Lab
		exitCoords = vec3(1066.298950, -3183.586914, -39.164062),
		iplCoords = vec3(1056.975830, -3194.571533, -39.164062),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Counterfeit Cash Factory
		exitCoords = vec3(1138.101074, -3199.107666, -39.669556),
		iplCoords = vec3(1121.897, -3195.338, -40.4025),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Document Forgery
		exitCoords = vec3(1173.7, -3196.73, -39.01),
		iplCoords = vec3(1165, -3196.6, -39.01306),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Penthouse Casino
		exitCoords = vec3(980.83, 56.51, 116.16),
		iplCoords = vec3(976.636, 70.295, 115.164),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- NightClub Warehouse
		exitCoords = vec3(-1520.88, -2978.54, -80.45),
		iplCoords = vec3(-1505.783, -3012.587, -80.000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 2 Car
		exitCoords = vec3(179.15, -1000.15, -99.0),
		iplCoords = vec3(173.2903, -1003.6, -99.65707),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 6 Car
		exitCoords = vec3(212.4, -998.97, -99.0),
		iplCoords = vec3(197.8153, -1002.293, -99.65749),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 10 Car
		exitCoords = vec3(240.67, -1004.69, -99.0),
		iplCoords = vec3(229.9559, -981.7928, -99.66071),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Casino NightClub
		exitCoords = vec3(1545.57, 254.22, -46.01),
		iplCoords = vec3(1550.0, 250.0, -48.0),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Warehouse Small
		exitCoords = vec3(1087.43, -3099.48, -39.0),
		iplCoords = vec3(1094.988, -3101.776, -39.00363),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Warehouse Medium
		exitCoords = vec3(1048.12, -3097.28, -39.0),
		iplCoords = vec3(1056.486, -3105.724, -39.00439),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Warehouse Large
		exitCoords = vec3(992.38, -3098.08, -39.0),
		iplCoords = vec3(1006.967, -3102.079, -39.0035),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Vehicle Warehouse
		exitCoords = vec3(956.12, -2987.24, -39.65),
		iplCoords = vec3(994.5925, -3002.594, -39.64699),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Old Bunker Interior
		exitCoords = vec3(899.5518, -3246.038, -98.04907),
		iplCoords = vec3(899.5518, -3246.038, -98.04907),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Arcadius Garage 1
		exitCoords = vec3(-198.666, -580.515, 136.00),
		iplCoords = vec3(-191.0133, -579.1428, 135.0000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Arcadius Garage 2
		exitCoords = vec3(-124.532, -571.478, 136.00),
		iplCoords = vec3(-117.4989, -568.1132, 135.0000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Arcadius Garage 3
		exitCoords = vec3(-135.412, -622.440, 136.00),
		iplCoords = vec3(-136.0780, -630.1852, 135.0000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- Arcadius Mod Shop
		exitCoords = vec3(-139.388, -587.917, 167.00),
		iplCoords = vec3(-146.6166, -596.6301, 166.0000),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 2133 Mad Wayne Thunder
		exitCoords = vec3(-1289.89, 449.83, 97.9),
		iplCoords = vec3(-1288, 440.748, 97.69459),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 2868 Hillcrest Avenue
		exitCoords = vec3(-753.04, 618.82, 144.14),
		iplCoords = vec3(-763.107, 615.906, 144.1401),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- EclipseTowers, Apt 3	
		exitCoords = vec3(-785.12, 323.75, 212.0),
		iplCoords = vec3(-773.407, 341.766, 211.397),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	},
	{
		-- 	Dell Perro Heights, Apt 7
		exitCoords = vec3(-1453.86, -517.64, 56.93),
		iplCoords = vec3(-1477.14, -538.7499, 55.5264),
		stash = {
			maxweight = 2000,
			slots = 10,
		},
	}
}

--[[
	General controls when modifying or creating shells/ipl/mlo, configure the language and controls.
]]

ActionControls = {
	forward = {
		label = 'Forward +/-',
		codes = { 33, 32 }
	},
	right = {
		label = 'Right +/-',
		codes = { 35, 34 }
	},
	up = {
		label = 'Up +/-',
		codes = { 52, 51 }
	},
	add_point = {
		label = 'Add Point',
		codes = { 24 }
	},
	set_any = {
		label = 'Set',
		codes = { 24 }
	},
	undo_point = {
		label = 'Undo Last',
		codes = { 25 }
	},
	set_position = {
		label = 'Set Position',
		codes = { 24 }
	},
	add_garage = {
		label = 'Add Garage',
		codes = { 24 }
	},
	rotate_z = {
		label = 'RotateZ +/-',
		codes = { 20, 73 }
	},
	rotate_z_scroll = {
		label = 'RotateZ +/-',
		codes = { 17, 16 }
	},
	increase_z = {
		label = 'Z Boundary +/-',
		codes = { 180, 181 }
	},
	decrease_z = {
		label = 'Z Boundary +/-',
		codes = { 21, 180, 181 }
	},
	done = {
		label = 'Done',
		codes = { 191 }
	},
	change_player = {
		label = 'Player +/-',
		codes = { 82, 81 }
	},
	change_shell = {
		label = 'Change Shell +/-',
		codes = { 189, 190 }
	},
	select_player = {
		label = 'Select Player',
		codes = { 191 }
	},
	cancel = {
		label = 'Cancel',
		codes = { 194 }
	},
	change_outfit = {
		label = 'Outfit +/-',
		codes = { 82, 81 }
	},
	delete_outfit = {
		label = 'Delete Outfit',
		codes = { 178 }
	},
	select_vehicle = {
		label = 'Vehicle +/-',
		codes = { 82, 81 }
	},
	spawn_vehicle = {
		label = 'Spawn Vehicle',
		codes = { 191 }
	},
	leftApt = {
		label = 'Previous Apartment',
		codes = { 174 }
	},
	rightApt = {
		label = 'Next Apartment',
		codes = { 175 }
	},
	testPos = {
		label = 'Test Pos',
		codes = { 47 }
	},
}


Config.DynamicDoors = true -- Enable dynamic doors? needs `setr game_enableDynamicDoorCreation "true"`

CameraOptions = {
	lookSpeedX = 500.0,
	lookSpeedY = 500.0,
	moveSpeed = 10.0,
	climbSpeed = 10.0,
	rotateSpeed = 50.0,
}

--[[
	In this configuration we can create custom houses from the same configuration, without using
	the in-game system. We do not recommend this option unless you are an experienced developer.

	Otherwise, use the F7 menu and the corresponding work.
]]

CreatingHouse = {}

Config.Houses = {
	-- 	['Test House'] = {
	-- 		owned = 0,
	-- 		price = 0,
	-- 		locked = true,
	-- 		address = 'Nikola p1',
	-- 		tier = 1,
	-- 		coords = {
	-- 			enter = {
	-- 				['z'] = 71.46570587158203,
	-- 				['h'] = 311.8609924316406,
	-- 				['x'] = 1303.005859375,
	-- 				['y'] = -527.4683837890625
	-- 			},
	-- 			PolyZone = {
	-- 				thickness = 25.0,
	-- 				usePolyZone = true,
	-- 				points = { {
	-- 					['x'] = 1303.5743408203125,
	-- 					['y'] = -500.41802978515625,
	-- 					['z'] = 71.0
	-- 				}, {
	-- 					['x'] = 1293.0418701171875,
	-- 					['y'] = -537.6560668945312,
	-- 					['z'] = 71.0
	-- 				}, {
	-- 					['x'] = 1311.5504150390625,
	-- 					['y'] = -544.9464721679688,
	-- 					['z'] = 71.0
	-- 				}, {
	-- 					['x'] = 1327.7315673828125,
	-- 					['y'] = -498.835205078125,
	-- 					['z'] = 71.0
	-- 				} }
	-- 			},
	-- 			cam = {
	-- 				['h'] = 311.8609924316406,
	-- 				['y'] = -527.4683837890625,
	-- 				['z'] = 71.46570587158203,
	-- 				yaw = -10.0,
	-- 				['x'] = 1303.005859375
	-- 			},
	-- 			exit = {
	-- 				['z'] = 27.56341361999511,
	-- 				['h'] = 246.86099243164062,
	-- 				['x'] = 1264.6019287109375,
	-- 				['y'] = -545.8494262695312
	-- 			},
	-- 			interiorCoords = {
	-- 				['x'] = 1266.744384765625,
	-- 				['y'] = -544.3600463867188,
	-- 				['z'] = 26.55422592163086,
	-- 				['w'] = 311.8609924316406
	-- 			},
	-- 			shellCoords = {
	-- 				['z'] = 26.55422592163086,
	-- 				['h'] = 311.8609924316406,
	-- 				['x'] = 1266.744384765625,
	-- 				['y'] = -544.3600463867188
	-- 			}
	-- 		},
	-- 		garage = {
	-- 			max = 4, -- Maximum spawn point [max slot]
	-- 			access = {},
	-- 			slots = {
	-- 				[1] = { -- Spawn Points
	-- 					x = -125.64788055419922,
	-- 					y = -1297.646728515625,
	-- 					z = 29.44520378112793,
	-- 					h = 93.55599975585938,
	-- 				},
	-- 			},
	-- 			coords = {
	-- 				-- Garage location
	-- 				x = -228.8,
	-- 				y = -990.41,
	-- 				z = 29.34,
	-- 				h = 267.02,
	-- 			}
	-- 		},
	-- 		decorations = {},
	-- 	}
}

--[[
    Debug mode, this mode is to receive constant prints and information
    from the system, we do not recommend enabling it if you are not a
    developer, but it will help to understand how the resource works.
]]

Config.Debug = false
Config.ZoneDebug = false

Keys = { ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18, ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182, ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81, ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178, ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173, ['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118 }

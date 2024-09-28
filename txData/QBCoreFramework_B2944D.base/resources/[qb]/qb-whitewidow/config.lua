-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.com/invite/Gh4VpmAssN

Config = {
	Debug = false,  -- false to remove green boxes
	PrintDebug = false, -- false to remove f8 debug messages for the script

	-- Support Options
	Framework = "qb-core", -- framework folder name
	Target = "qb-target",
	Menu = "qb", -- "qb" or "ox"
	Notify = "qb", -- "qb" or "okok" or "infinity" or "rr" or "t"
	Fuel = "cdn-fuel", -- "LegacyFuel" or "ps-fuel"
	Inv = "qb", -- qb or ox
	Locale = "en",
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)
	Clothing = "illenium-appearance", -- "illenium-appearance" or "fivem-appearance" or "qb-clothing" or "rcore_clothes" or "ak47_clothing"
	-- if your clothing is not listed above, find out what the event of it is and add it to clothing.lua. Create a ticket if assisstance required!!!

	-- Blip
    blipEnable = true,
    blipName = "White Widow",
    blipCoord = vector3(193.24, -244.53, 54.07),
    blipSprite = 469,
    blipColor = 52,
    blipScale = 0.7,

	-- Job
	Job = "whitewidow",
    autoClock = { enter = true, exit = true, }, -- Turning these on will detect if the person has the job and auto clock them on or off
    zones = { -- Clockin/out zone
        vector2(214.04, -233.81),
		vector2(198.06, -275.28),
		vector2(147.99, -256.14),
		vector2(163.31, -218.23)
	},

	Croptopacket = 7, -- amouuts of packets you can make by trimming a crop

	-- Music Booth
	Booth = {
		enableBooth = true, -- Set false if using external DJ/Music stuff.
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 50, -- The radius of the sound from the booth
		coords = vector3(189.68, -256.0, 53.07), -- Where the booth is located
		heading = 70.57, -- Angle of object
		playing = false, -- Do not touch
	},

	-- Bong
	SmokeTime = 2.8, -- For Bong in seconds
	HighTime = 30, -- For Bong in seconds
	Bong = 'prop_bong_01',
	Tolerance = {
		[10] = {high = 1, sick = 3},
		[20] = {high = 3, sick = 5},
		[30] = {high = 5, sick = 7},
		[40] = {high = 7, sick = 9},
		[50] = {high = 9, sick = 11},
	},
	Strains = { -- what items you can use to smoke bong
		'weed_white-widow_cbd',
		'weed_skunk_cbd',
		'weed_og-kush_cbd',
		'weed_ak47_cbd'
	},
	bongtables = { -- Locations of tables with bongs to smoke
		[1] = vector3(199.54, -247.01, 53.07),
		[2] = vector3(195.73, -257.55, 53.07),
		[3] = vector3(193.71, -263.11, 53.07),
		[4] = vector3(192.02, -267.75, 53.07),
		[5] = vector3(183.75, -264.74, 53.07),
		[6] = vector3(186.01, -258.53, 53.07),
		[7] = vector3(197.35, -253.1, 53.07),
		[8] = vector3(188.09, -252.81, 53.07),
    },

	-- Farming
	Chance = {-- Chance of Success when farming, in percentage (i.e. 100 = no failure)
		Skunk = 90,
		OGKush = 50,
		AK47 = 40,
		WhiteWidow = 70,
	},

	-- Joints
	Joint = {
		SmokeTime = 5.5,  -- For Joint in seconds; Time taken to smoke a joint
		Armour = { -- Out of 100
			Skunk = math.random(1,5),
			OGKush = math.random(3,8),
			AK47 = math.random(9,13),
			WhiteWidow = math.random(5,11),
		},
		Stress = { -- Out of 100
			Skunk = math.random(1,5),
			OGKush = math.random(3,8),
			AK47 = math.random(9,13),
			WhiteWidow = math.random(5,11),
		},
	},

	-- Cookies
	Cookie = {
		EatTime = 6.5,
		Health = 5, -- Only available for cookie since it has a health effect
		Armour = { -- Out of 100
			Skunk = math.random(1,5),
			AK47 = math.random(9,13),
			WhiteWidow = math.random(5,11),
		},
		Seconds = { -- amount of seconds you want health to be given, more seconds = more health 
			Skunk = math.random(1,5),
			AK47 = math.random(9,13),
			WhiteWidow = math.random(5,11),
		},
		Stress = { -- Out of 100
			Skunk = math.random(1,5),
			AK47 = math.random(9,13),
			WhiteWidow = math.random(5,11),
		},
	},

	-- Gummys
	Gummy = {
		EatTime = 3.5,
		Armour = { -- Out of 100
			Strawberry = math.random(10,15),
			Raspberry = math.random(10,15),
		},
		Stress = { -- Out of 100
			Strawberry = math.random(10,15),
			Raspberry = math.random(10,15),
		},
	},

	StorageItems = { -- For job only players, to get items to sell or craft food
		label = "Storage",
		slots = 15,
		items = {
			{ name = "eggs", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "flour", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "sugar", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "gelatine", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "butter", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "bakingsoda", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "gummymould", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "chocolatechips", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "raspberry", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "strawberry", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "milk", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "empty_weed_bag", price = 0, amount = 1000, info = {}, type = "item", slot = 12 },
			{ name = "rolling_paper", price = 0, amount = 2000, info = {}, type = "item", slot = 13 },
			{ name = "lighter", price = 0, amount = 1000, info = {}, type = "item", slot = 14 },
			{ name = "bong", price = 0, amount = 1000, info = {}, type = "item", slot = 15 },
		},
	},
	SnackTable = { -- Items list for snack table, not job restricted, for any player
		label = "Shop",
		slots = 4,
		items = { -- You need to add your own items here, any you want
			{ name = "kurkakola",       	 price = 3,    amount = 100,  info = {}, type = "item", slot = 1 },
			{ name = "water_bottle",         price = 2,    amount = 100,  info = {}, type = "item", slot = 2 },
			{ name = "twerks_candy",         price = 2,    amount = 100,  info = {}, type = "item", slot = 3 },
			{ name = "snikkel_candy",        price = 2,    amount = 100,  info = {}, type = "item", slot = 4 },
		},
    },

    -- Vehicle
    Vehicle = '204sWhiteWidowVan', -- Change vehicle here, Custom WhiteWidow Vehicle Added
    VehicleDeposit = 100, -- Vehicle deposit price
	VehicleSpawn = {x = 193.14, y = -274.76, z = 48.94, h = 244.06}, -- Vehicle spawn location
    VehicleSpawnHeading = 244.06, -- Vehicle spawn heading
}
Crafting = {
	Joints = {
		{ ['weed_skunk_cbd_joint'] = { ['weed_skunk_cbd'] = 1, ['rolling_paper'] = 3, }, ["amount"] = math.random(1, 4) },
		{ ['weed_og-kush_cbd_joint'] = { ['weed_og-kush_cbd'] = 1, ['rolling_paper'] = 3, }, ["amount"] = math.random(1, 4) },
		{ ['weed_white-widow_cbd_joint'] = { ['weed_white-widow_cbd'] = 1, ['rolling_paper'] = 3, }, ["amount"] = math.random(1, 4) },
		{ ['weed_ak47_cbd_joint'] = { ['weed_ak47_cbd'] = 1, ['rolling_paper'] = 3, }, ["amount"] = math.random(1, 4) },
	},
	Food = {
		{ ['strawberrygummybear'] = { ['gummymould'] = 1, ['strawberry'] = 1, ['gelatine'] = 1, ['sugar'] = 1, ['weed_og-kush_cbd'] = 1, }, ["amount"] = math.random(5, 7) },
		{ ['raspberrygummybear'] = { ['gummymould'] = 1, ['raspberry'] = 1, ['gelatine'] = 1, ['sugar'] = 1, ['weed_og-kush_cbd'] = 1, }, ["amount"] = math.random(5, 7) },
		{ ['ak47cookie'] = { ['eggs'] = 1, ['flour'] = 1, ['butter'] = 1, ['bakingsoda'] = 1, ['milk'] = 1, ['weed_ak47_cbd'] = 1, }, ["amount"] = math.random(3, 5) },
		{ ['skunkcookie'] = { ['eggs'] = 1, ['flour'] = 1, ['butter'] = 1, ['bakingsoda'] = 1, ['milk'] = 1, ['weed_skunk_cbd'] = 1, }, ["amount"] = math.random(3, 5) },
		{ ['wwcookie'] = { ['eggs'] = 1, ['flour'] = 1, ['butter'] = 1, ['bakingsoda'] = 1, ['milk'] = 1, ['weed_white-widow_cbd'] = 1, }, ["amount"] = math.random(3, 5) },
	},
	Trimming = {
		{ ['weed_skunk_cbd'] = { ['weed_skunk_cbd_crop'] = 1, ['empty_weed_bag'] = 20, }, ["amount"] = math.random(1, 3) },
		{ ['weed_og-kush_cbd'] = { ['weed_og-kush_cbd_crop'] = 1, ['empty_weed_bag'] = 20, }, ["amount"] = math.random(1, 3) },
		{ ['weed_white-widow_cbd'] = { ['weed_white-widow_cbd_crop'] = 1, ['empty_weed_bag'] = 20, }, ["amount"] = math.random(1, 3) },
		{ ['weed_ak47_cbd'] = { ['weed_ak47_cbd_crop'] = 1, ['empty_weed_bag'] = 20, }, ["amount"] = math.random(1, 3) },
	},
}
Config, Locales = {}, {}

Config.Debug = false

Config.DoubleXP = false

Config.EventPrefix = 'okokCrafting'

Config.xpColumnsName = 'xp'

Config.craftQueryColumnName = 'okokcrafts'

Config.qbPrefix = 'qb'

Config.QBCorePrefix = 'QBCore'

Config.Locale = 'en' -- en / pt / gr / fr / de

Config.UseOkokTextUI = false -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.HideMinimap = true -- If true it'll hide the minimap when the Crafting menu is opened

Config.ShowBlips = true -- If true it'll show the crafting blips on the map

Config.ShowFloorBlips = true -- If true it'll show the crafting markers on the floor

Config.ShowAllCrafts = true -- This option will show all crafts even if you don't have enough level to craft it

Config.UseXP = true -- If you want to use the XP system or not

Config.SameLevelForAllTables = false -- Use the same level in all the crafting tables

Config.MaxLevel = 20 -- Max level on the workbenches

Config.StartXP = 100 -- First level XP

Config.LevelMultiplier = 1.05 -- How much the XP needed increases per level (1.05 = 5% | level 1 = 100 | level 2 = 205 | etc...)

Config.GiveXPOnCraftFailed = true -- If the player receives XP when he fails the craft of an item

Config.SetXPCommand = 'setcraftxp' -- Set the players XP

Config.SetLevelCommand = 'setcraftlevel' -- Set the players level

Config.CraftRadius = 5 -- if you are further it will stop the craft

Config.MaxCraftsPerWorkbench = 10 -- how many items can be in the queue at the same time

Config.UseCategories = true

Config.InventoryDirectory = 'qb-inventory/html/images'

Config.UseOx_inventory = false

Config.NotInterectableTables = false -- true = all blips will disapear and you can only open the crafting table using the `openClosestTable` or `openWorkbench` events

Config.AdminGroups = {
	'god',
	'admin',
	'mod'
}

Config.itemNames = { -- Format: id = label | In case the item starts with a number make sure to set it in this format: ['9mm'] = 9mm ammo,
	metalscrap = 'Metal Scrap',
	weapon_assaultrifle = 'Assault Rifle',
	iron = 'Iron',
	bandage = 'Bandage',
	firstaid = 'First Aid',
	['10kgoldchain'] = '10kgoldchain',
	plastic = 'Plastic',
	copper = 'Copper',
	aluminum = 'Aluminum',
	iron = 'Iron',
	cash = 'Money',
	WEAPON_ILLGLOCK17 = 'g17',
	WEAPON_MIDASGLOCK = 'gold switch',
	WEAPON_BLUEGLOCKS = 'blue switch',
	WEAPON_GLOCK21 = 'g21',
	WEAPON_P210 = 'p210',
	WEAPON_GLOCKBEAMS = 'glockbeam',
	WEAPON_SR40 = 'sr40',
	WEAPON_T1911 = '1911',
	WEAPON_MGGLOCK = 'mgglock',
	WEAPON_TGLOCK19 = 'g19',
	WEAPON_GLOCK41 = 'g41',
	WEAPON_FN57 = 'fn57',
	WEAPON_P30L = 'p30l',
}

Config.Crafting = {
	{
		coordinates = vector3(-809.4, 190.3, 72.5), -- coordinates of the table
		radius = 1, -- radius of the table
		showMapBlip = true,
		marker = {type = 20, r = 31, g = 94, b = 255, a = 155, bobUpAndDown = 0, faceCamera = 0, rotate = 1, textureDict = 0, textureName = 0, drawOnEnts = 0},
		showBlipRadius = 50,
		blip = {blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting'}, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
		tableName = 'General', -- Title
		tableID = 'general1', -- make a different one for every table with NO spaces
		crafts = { -- What items are available for crafting and the recipe
			'rifle', -- Recipe id
			'firstaid',
		},
		jobs = { -- What jobs are able to open the workbench
			['police'] = {
				['boss'] = true,
				['chief'] = true,
			},
			['ambulance'] = {
				['boss'] = true,
				['chief'] = true,
			},
		},
	},
	{
		coordinates = vector3(-817.0, 182.8, 72.3),
		radius = 1,
		showMapBlip = true,
		marker = {type = 20, r = 31, g = 94, b = 255, a = 155, bobUpAndDown = 0, faceCamera = 0, rotate = 1, textureDict = 0, textureName = 0, drawOnEnts = 0},
		showBlipRadius = 50,
		blip = {blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting'},
		tableName = 'Weapons',
		tableID = 'general2',
		crafts = {
			'firstaid',
			'g17',
			'blueswitch',
			'g21',
			'1911',
			'fn57',
		},
		jobs = {
			['all'] = true -- For everyone to be able to open the workbench
		},
	},
}

Config.Crafts = {
	['blueswitch'] = {
		item = 'WEAPON_BLUEGLOCKS', -- Item id and name of the image
		amount = 1, -- Amount of the item the player will receive
		maxCraft = 1, -- Max amount of crafts at a time
		successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
		isItem = true, -- if true = is item | if false = is weapon
		isDisassemble = false, -- true = disassemble | false = craft
		time = 6, -- Time to craft (in seconds)
		levelNeeded = 2, -- What level he needs to craft this item
		xpPerCraft = 40, -- How much XP he receives after crafting this item
		recipe = { -- Recipe to craft it
			{'iron', 1, true, false}, -- item/amount/if the item should be removed when crafting/if it's money
			{'cash', 2000, true, true},
		},
		job = { -- What jobs can craft this item in this workbench
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Weapons', -- Used as ID and Name of the category
	},
	['g17'] = {
		item = 'WEAPON_ILLGLOCK17', -- Item id and name of the image
		amount = 1, -- Amount of the item the player will receive
		maxCraft = 1, -- Max amount of crafts at a time
		successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
		isItem = true, -- if true = is item | if false = is weapon
		isDisassemble = false, -- true = disassemble | false = craft
		time = 6, -- Time to craft (in seconds)
		levelNeeded = 2, -- What level he needs to craft this item
		xpPerCraft = 40, -- How much XP he receives after crafting this item
		recipe = { -- Recipe to craft it
			{'iron', 1, true, false}, -- item/amount/if the item should be removed when crafting/if it's money
			{'cash', 2000, true, true},
		},
		job = { -- What jobs can craft this item in this workbench
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Weapons', -- Used as ID and Name of the category
	},
	['g21'] = {
		item = 'WEAPON_GLOCK21', -- Item id and name of the image
		amount = 1, -- Amount of the item the player will receive
		maxCraft = 1, -- Max amount of crafts at a time
		successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
		isItem = true, -- if true = is item | if false = is weapon
		isDisassemble = false, -- true = disassemble | false = craft
		time = 6, -- Time to craft (in seconds)
		levelNeeded = 2, -- What level he needs to craft this item
		xpPerCraft = 40, -- How much XP he receives after crafting this item
		recipe = { -- Recipe to craft it
			{'iron', 1, true, false}, -- item/amount/if the item should be removed when crafting/if it's money
			{'cash', 2000, true, true},
		},
		job = { -- What jobs can craft this item in this workbench
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Weapons', -- Used as ID and Name of the category
	},
	['1911'] = {
		item = 'WEAPON_T1911', -- Item id and name of the image
		amount = 1, -- Amount of the item the player will receive
		maxCraft = 1, -- Max amount of crafts at a time
		successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
		isItem = true, -- if true = is item | if false = is weapon
		isDisassemble = false, -- true = disassemble | false = craft
		time = 6, -- Time to craft (in seconds)
		levelNeeded = 2, -- What level he needs to craft this item
		xpPerCraft = 40, -- How much XP he receives after crafting this item
		recipe = { -- Recipe to craft it
			{'iron', 1, true, false}, -- item/amount/if the item should be removed when crafting/if it's money
			{'cash', 2000, true, true},
		},
		job = { -- What jobs can craft this item in this workbench
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Weapons', -- Used as ID and Name of the category
	},
	['fn57'] = {
		item = 'WEAPON_FN57', -- Item id and name of the image
		amount = 1, -- Amount of the item the player will receive
		maxCraft = 1, -- Max amount of crafts at a time
		successCraftPercentage = 75, -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
		isItem = true, -- if true = is item | if false = is weapon
		isDisassemble = false, -- true = disassemble | false = craft
		time = 6, -- Time to craft (in seconds)
		levelNeeded = 2, -- What level he needs to craft this item
		xpPerCraft = 40, -- How much XP he receives after crafting this item
		recipe = { -- Recipe to craft it
			{'iron', 1, true, false}, -- item/amount/if the item should be removed when crafting/if it's money
			{'cash', 2000, true, true},
		},
		job = { -- What jobs can craft this item in this workbench
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Weapons', -- Used as ID and Name of the category
	},
	['firstaid'] = {
		item = 'firstaid',
		amount = 1,
		maxCraft = 10,
		successCraftPercentage = 75,
		isItem = true,
		isDisassemble = false,
		time = 3,
		levelNeeded = 0,
		xpPerCraft = 15,
		recipe = {
			{'bandage', 4, true, false},
		},
		job = {
			''
		},
		data = {}, -- Used to pass additional data, such as metadata
		category = 'Health',
	},
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 3

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StartCraftWebhookColor = '16127'

Config.CancelWebhookColor = '16776960'

Config.ClaimCraftWebhookColor = '65352'

Config.FailedCraftWebhookColor = '16711680'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id) 
	if Locales[Config.Locale][id] then 
		return Locales[Config.Locale][id] 
	else 
		print('Locale '..id..' doesn\'t exist') 
	end 
end

--
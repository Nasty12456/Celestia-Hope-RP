-- Language Settings
Locales = {
	Lang = 'en', -- Choose the language you want to use
}

-- Resource Settings
Resource = {
	Notify = 'qb', -- Choose the one you are from: 'qb', 'okok', 'ox' 
	Menu = 'qb', -- Choose the one you are from: 'qb', 'ox'
	Text = 'qb', -- Choose the one you are from: 'qb', 'ox'
	Fuel = 'cdn-fuel', -- Choose the one you are from: 'LegacyFuel', 'ps-fuel', 'cdn-fuel'
}

-- Cutscene Settings
Cutscene = {
	CutsceneOnly = true, -- Play only cutscene & disable taxi & rental feature
	UseLamarPart = true, -- Exclude Lamar's cutscene segment
	StartCoords = vector4(-1042.49, -2746.0, 21.36, 326.91), -- Coordinates the player teleports after cutscene ends
	WelcomeMessage = true, -- Enable welcome message
	Message = "Hello dear, welcome to our qbcore V9 server", -- Welcome message
	TestCommand = false,  -- Enable command to start cutscene
	Command = 'cutscene', -- Command to start the cutscene
	QBApartment = true,  -- Set to true if using qb-apartments and modify the apartment file as instructed at https://errorhub.gitbook.io/docs/qbcore/eh-cutscene/modifications
	BlendTaxi = false,  -- Automatically teleport player to taxi after cutscene ends if CutsceneOnly = false.
}
  
-- AirportPed Settings (Ignore this if BlendTaxi = true)
AirportPed = {
	PedCoords = vector4(-1032.48, -2735.74, 20.17, 112.18), -- The coordinates of the airport ped
	PedModel = "u_m_m_rivalpap", -- The model for the airport ped. Other available models can be found at https://docs.fivem.net/docs/game-references/ped-models/.
	Scenario = 'WORLD_HUMAN_CLIPBOARD', -- The scenario for the airport ped
}

-- Ai-Taxi Settings
--[[Taxi = {
	Plate = "QBCOreV9", -- The number plate of the taxi. A maximum of 8 characters (numbers/alphabets) is allowed.
	Driver = "u_m_y_proldriver_01", -- The ped model of the taxi driver.
	DriveStyle = 129, -- If you want the player to be alive better not change it! XD | You can generate the style from here - https://vespura.com/fivem/drivingstyle/
	DrivingSpeed = 26.0, -- Speed in meter per seconds (Bydefault the speed is aprrox 93 kmph). 
	SkipRide = true, -- Set to a true if you want players to be able to skip taxi ride. Ignore if the taxi segment is disabled 

	DefaultTaxi = { -->> Set this up if BlendTaxi = true otherwise ignore.
		-- Model: The default taxi model.
		-- Price: For deducting any amount, put the value here. For example:  Price = 200.
		-- ChangeColor: Set to true if you want to change the taxi's color.
		-- Primary: The primary color of the taxi.
		-- Secondary: The secondary color of the taxi.
		Model = "taxi", Price = "Free", ChangeColor = false, Primary = 0, Secondary = 88,
	},
	
	DropLoc = { -->> Available dropoff locations. You can add as many as you want.
		-- Label: The name displayed on the taxi menu.
		-- Fare: The taxi fare (set to "Free" to make it free).
		-- Coord: The dropoff coordinates.
		-- SkipCoord: Skip coordinates for taxi ride teleportation.
		-- Image: The image of the taxi (currently only supported if Menu is set to 'ox'.
		[1] = { Label = "City Hall", 				    Fare = "Free", Coord = vector4(-236.51, -988.75, 28.75, 160.13),  SkipCoord = vector4(-209.49, -915.5, 28.78, 161.5),   Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096725262223290480/image.png" },
		[2] = { Label = "Integrity Way Apartment", 	    Fare = 100,    Coord = vector4(249.8, -644.05, 39.35, 336.88),    SkipCoord = vector4(212.53, -745.2, 33.11, 341.43),   Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096718553991893132/image.png" },
		[3] = { Label = "So. Rockford Drive Apartment", Fare = 100,    Coord = vector4(-686.79, -1095.06, 14.16, 210.84), SkipCoord = vector4(-803.66, -1146.16, 8.68, 300.96), Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096717207389614110/image.png" },
		[4] = { Label = "Morningwood Blvd Apartment",   Fare = 100,    Coord = vector4(-1287.53, -398.46, 35.56, 209.35), SkipCoord = vector4(-1345.92, -292.5, 39.91, 210.1),  Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096717914834477106/image.png" },
		[5] = { Label = "Tinsel Towers Apartment",      Fare = 100,    Coord = vector4(-648.81, 28.47, 38.8, 357.26),     SkipCoord = vector4(-498.87, 21.38, 44.37, 97.1),     Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096724182064173076/image.png" },
		[6] = { Label = "Fantastic Plaza Apartment",    Fare = 100,    Coord = vector4(300.06, -1077.5, 28.91, 357.79),   SkipCoord = vector4(335.74, -1136.22, 28.91, 87.82),  Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096724830549712936/image.png" },
	},

	TaxiMenu = true, -- Set to false to hide the taxi option from the airport ped menu. Ignore if BlendTaxi = true or CutsceneOnly = true.

	TaxiList = { -->> Available taxi models. You can add as many as you want. Ignore if TaxiMenu = false or BlendTaxi = true
		-- Label: The name that will be displayed on the taxi menu.
		-- Model: Spawn code of the taxi. Currently supports 2,3,4 wheeler vehicles i.e. Cars & Bikes (Land Vehicles).
		-- Price: Amount required to take the taxi (not fare). Can be made free by setting Price = "Free".
		-- ChangeColor: Change colour of the taxi.
		-- Primary: Primary colour of the taxi.
		-- Secondary: Secondary colour of the taxi.
		-- Image: Image of the taxi. Currently supported only if Menu = 'ox'.
		[1] = { Label = "Free Taxi",    Model = "emperor", Price = "Free", ChangeColor = true,  Primary = 0, Secondary = 88, Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096768812294099104/image.png",},
		[2] = { Label = "Normal Taxi",  Model = "taxi",    Price = 500,    ChangeColor = false, Primary = 0, Secondary = 88, Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096768745613041725/image.png",},
		[3] = { Label = "Premium Taxi", Model = "jubilee", Price = 1000,   ChangeColor = false, Primary = 0, Secondary = 88, Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096768877800722585/image.png",},
	},

	TaxiSpawn = {
		-- Coordinates where the taxi will spawn (the locations are random)
		-- You can change or edit the coordinates, but it is recommended not to add or remove more than 4 coordinates 
    	{Coords = vector4(-1013.06, -2734.99, 13.27, 238.1)},
    	{Coords = vector4(-1023.82, -2728.57, 13.29, 238.77)},
    	{Coords = vector4(-1040.57, -2719.0, 13.29, 239.87)},
    	{Coords = vector4(-1051.72, -2712.87, 13.27, 240.68)},
	},

	BlendSpawn = { 
		-- Coordinates where the taxi will spawn if BlendTaxi = true to avoid collision while spawning.
		-- Ignore if BlendTaxi = false
		-- You can change or edit the coordinates, but it is recommended not to add or remove more than 13 coordinates.
    	{Coords = vector4(-1019.99, -2490.69, 13.29, 148.39)},
    	{Coords = vector4(-1026.62, -2501.35, 13.27, 148.47)},
    	{Coords = vector4(-1070.71, -2578.55, 13.3, 147.78)},
    	{Coords = vector4(-1076.69, -2589.3, 13.3, 149.02)},
    	{Coords = vector4(-1023.78, -2489.97, 19.69, 149.69)},
    	{Coords = vector4(-1030.16, -2500.6, 19.68, 148.44)},
    	{Coords = vector4(-1036.01, -2510.94, 19.69, 147.28)},
    	{Coords = vector4(-1044.22, -2524.92, 19.68, 144.49)},
    	{Coords = vector4(-1050.47, -2536.17, 19.69, 146.99)},
    	{Coords = vector4(-1056.24, -2546.15, 19.69, 144.95)},
    	{Coords = vector4(-1064.46, -2560.15, 19.69, 145.99)},
    	{Coords = vector4(-1070.89, -2571.44, 19.69, 148.51)},
    	{Coords = vector4(-1076.86, -2581.83, 19.69, 150.07)},
	},
} ]]--

-- Rental Settings
Rental = {
	RentalMenu = true, -- Set to false to hide the taxi option from the airportped menu.
	SafetyDeposit = 0.25, -- Percentage of the rental fee that will be deducted as a safety deposit.
	RentalSpawn = vector4(-1030.53, -2732.65, 19.64, 238.7), -- Coordinates where the rental vehicle will spawn.
	RentalReturnPed = vector4(114.97, -1079.43, 29.19, 358.95), -- Coordinates of the rental vehicle return point.
	RentalReturnBlipName = "Rental Return Point", -- Name of the rental vehicle return point blip.
	WrapPlayer = false, -- Set to true to directly teleported player into the rental vehicle when they rent it.
	
	RentalVehicles = { -- Available rental vehicles. You can add as many as you want.
		-- Label: The name displayed on the rental menu.
		-- Model: The spawn code of the vehicle.
		-- Price: The rental fee.
		-- Image: Image of the rentals. Currently supported only if Menu = 'ox'.
		[1] = { Label = "Bicycle", Model = "scorcher", Price = 300, Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096766676101496902/image.png", },
		[2] = { Label = "SUV", 	   Model = "xls",      Price = 600, Image = "https://cdn.discordapp.com/attachments/1090968541534109756/1096766577099161660/image.png", },
    },
}

-- Airport Blip Settings
AirportBlip = {
	Enabled = false, -- Set to true to enable the blip
	Coords = vector3(-1037.88, -2738.34, 20.17), -- The location of the blip on the map
	Sprite = 423, -- The type of blip to display. You can find the blip codes here: https://docs.fivem.net/docs/game-references/blips/
	Scale = 0.6, -- The size of the airport blip
	Colour = 3, -- The color of the blip. You can find the color codes here: https://docs.fivem.net/docs/game-references/blips/
}

Lan = {}



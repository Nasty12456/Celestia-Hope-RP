Config = {}

Config.Core = "QB-Core" -- "ESX" or "QB-Core" 
Config.CoreExport = function()
    --return exports['es_extended']:getSharedObject()
    return exports['qb-core']:GetCoreObject()
end

Config.ESX_Item = 'weight' -- weight / limit

Config.DistanceView = 15.0
Config.DistanceAccess = 1.2

Config.DisplayRadarAfterClose = false

Config.Notification = function(text, type)
    if type == 'success' then
       -- exports["vms_notify"]:Notification("Ammunition", text, 3950, '#38d662', 'fa-solid fa-gun')
        -- ESX.ShowNotification(text)
         QBCore.Functions.Notify(text, 'success', 3950)
    elseif type == 'error' then
        --exports["vms_notify"]:Notification("Ammunition", text, 3950, '#d63838', 'fa-solid fa-gun')
        -- ESX.ShowNotification(text)
         QBCore.Functions.Notify(text, 'error', 3950)
    end
end

Config.TextUI = {
	Enabled = true, -- if you want to use TextUI set to true, if you prefer ESX.ShowHelpNotification set to false
	Open = function(key, message)
		exports['interact']:Open(key, message)
	end,
	Close = function()
		exports['interact']:Close()
	end
}

Config.Marker = {
    Enabled = false,
    Type = 29,
    Size = vec(.22, .22, .22),
    Color = {245, 245, 20, 95},
    Bouncing = true,
    Rotating = true,
}

Config.UI_Color = {255, 189, 19}

Config.Blips = {
    Sprite = 110,
    Scale = 0.65,
    Display = 4,
    Color = 5,
}

Config.Zones = {
    {   
        name = 1,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(16.08, -1109.51, 29.80),
        camera = {x = 16.08, y = -1109.51, z = 30.10},
        objectPosition = vector3(16.61, -1108.25, 30.10)
    },
    {
        name = 2, 
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(249.81, -50.20, 69.94),
        camera = {x = 249.81, y = -50.20, z = 70.34},
        objectPosition = vector3(249.37, -51.54, 70.34)
    },
    {
        name = 3,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(814.86, -2153.11, 29.62),
        camera = {x = 814.86, y = -2153.11, z = 29.85},
        objectPosition = vector3(814.86, -2154.53, 29.85)
    },
    {
        name = 4,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(-661.30, -937.97, 21.83),
        camera = {x = -661.30, y = -937.97, z = 22.03},
        objectPosition = vector3(-659.9, -937.97, 22.03)
    },
    {
        name = 5,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(2566.88, 296.91, 108.74),
        camera = {x = 2566.88, y = 296.91, z = 108.97},
        objectPosition = vector3(2565.48, 296.91, 108.97)
    },
    {
        name = 6,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(-328.68, 6081.22, 31.45),
        camera = {x = -328.68, y = 6081.22, z = 31.65},
        objectPosition = vector3(-327.96, 6081.96, 31.65)
    },
    {
        name = 7,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(1695.05, 3757.44, 34.71),
        camera = {x = 1695.05, y = 3757.44, z = 34.91},
        objectPosition = vector3(1695.85, 3758.33, 34.91)
    },
    {
        name = 8,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(843.26, -1031.02, 28.19),
        camera = {x = 843.26, y = -1031.02, z = 28.39},
        objectPosition = vector3(841.79, -1031.02, 28.39)
    },
    {
        name = 9,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(-1308.41, -392.65, 36.70),
        camera = {x = -1308.41, y = -392.65, z = 36.90},
        objectPosition = vector3(-1308.74, -394.02, 36.90)
    },
    {
        name = 10,
        enableBlip = true,
        shopName = "Ammunition",
        position = vector3(-1115.29, 2697.32, 18.55),
        camera = {x = -1115.29, y = 2697.32, z = 18.75},
        objectPosition = vector3(-1114.45, 2698.12, 18.75)
    },
}

Config.Texts = {
    ['nomoney'] = "You don't have enough money for that.",
    ['bought'] = "You bought.",
    ['nolicense'] = "You don't have a license for this.",
    ['e-open'] = "Press E to open menu",
}

Config.Items = {
    ["hand"] = {
        {
            label = "KNIFE",
            item = "WEAPON_KNIFE",
            price = 240,
            object = "WEAPON_KNIFE",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 40, range = 0.1, speed = 0.1
        },
        {
            label = "KNUCKLE",
            item = "WEAPON_KNUCKLE",
            price = 540,
            object = "WEAPON_KNUCKLE",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 30, range = 0.1, speed = 0.1
        },
        {
            label = "SWITCHBLADE",
            item = "WEAPON_SWITCHBLADE",
            price = 600,
            object = "WEAPON_SWITCHBLADE",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 40, range = 0.1, speed = 0.1
        },
        {
            label = "HAMMER",
            item = "WEAPON_HAMMER",
            price = 500,
            object = "WEAPON_HAMMER",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 50, range = 0.1, speed = 0.1
        },
        {
            label = "GOLF CLUB",
            item = "WEAPON_GOLFCLUB",
            price = 1000,
            object = "WEAPON_GOLFCLUB",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 40, range = 0.1, speed = 0.1
        },
        {
            label = "BAT",
            item = "WEAPON_BAT",
            price = 2000,
            object = "WEAPON_BAT",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 60, range = 0.1, speed = 0.1
        },
        {
            label = "CROWBAR",
            item = "WEAPON_CROWBAR",
            price = 2000,
            object = "WEAPON_CROWBAR",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 55, range = 0.1, speed = 0.1
        },
        {
            label = "MACHETE",
            item = "WEAPON_MACHETE",
            price = 3000,
            object = "WEAPON_MACHETE",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 1, -- only if you use type = "weapon"
            damage = 80, range = 0.1, speed = 0.1
        },
    },
    ["pistols"] = {
        {
            label = "PISTOL",
            item = "weapon_pistol",
            price = 12000,
            object = "WEAPON_PISTOL",
            type = "weapon", -- If you are using inventory with weapons in item set this value to "item" but if you are using standard weapon use "weapon" 
            ammo = 28, -- only if you use type = "weapon"
            damage = 45, range = 45, speed = 45,
        },
    },
    ["magazines"] = {
        {
            label = "PISTOL AMMO",
            item = "pistol_ammo",
            price = 2000,
            object = "prop_ld_ammo_pack_01",
            type = "item",
            damage = nil, range = nil, speed = nil,
        },
    },
    
    
}

Config.Categories = {
    [1] = "hand",
    [2] = "pistols",
    [3] = "magazines"
    
}

Config.DefaultCategory = Config.Categories[1]
Config.DefaultItem = Config.Items[Config.DefaultCategory][1] 
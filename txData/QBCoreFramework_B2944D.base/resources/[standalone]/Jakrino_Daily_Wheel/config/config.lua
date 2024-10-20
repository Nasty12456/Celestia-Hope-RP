
Config = Config or {}
Locales = Locales or {}

Config.Locales = 'EN' -- EN * TR --
Config.SQLScript = 'oxmysql' -- oxmysql * ghmattimysql * mysql-async
Config.SpinPeriod = 24 -- HOURS 
Config.TebexPageLink = "https://celestia-hope-rp.tebex.io"
Config.DefaultGarage = "motelgarage"
Config.MoneyType = "cash" -- bank
Config.StartDay = { day = 21, month = 7, year = 2024 } -- This is the start of the awards, this is Day 1 - Prizes increase day by day from this date

Config.Command = {
    ["Name"] = "dailywheel", -- /dailywheel
    ["Description"] = "Daily Luck System", -- Description of the command
}

Config.Days = {
    [1] = {
        [1] = {
            itemName = "weapon_pistol_mk2", -- Spawn Code
            itemLabel = "Combat PDW", -- Item Label for collect prize
            itemCount = 1, -- Item Count :D
            itemType = "item" -- item * money * vehicle --
        },
        [2] = {
            itemName = "weapon_pistol",
            itemLabel = "Pisol",
            itemCount = 1,
            itemType = "item"
        },
        [3] = {
            itemName = "weapon_machete",
            itemLabel = "Machete",
            itemCount = 1,
            itemType = "item"
        },
        [4] = {
            itemName = "weapon_combatpistol",
            itemLabel = "Combat Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [5] = {
            itemName = "weapon_ceramicpistol",
            itemLabel = "Ceramic Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [6] = {
            itemName = "weapon_knuckle",
            itemLabel = "Knuckle",
            itemCount = 1,
            itemType = "item"
        },
        [7] = {
            itemName = "weapon_switchblade",
            itemLabel = "switch blade",
            itemCount = 1,
            itemType = "item"
        },
        [8] = {
            itemName = "pistol_ammo",
            itemLabel = "Pistol Ammo",
            itemCount = 3,
            itemType = "item"
        }
    },
    [2] = {
        [1] = {
            itemName = "weapon_snspistol",
            itemLabel = "Sns Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [2] = {
            itemName = "weapon_vintagepistol",
            itemLabel = "Vintage Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [3] = {
            itemName = "weapon_fireextinguisher",
            itemLabel = "Fire Extinguisher",
            itemCount = 1,
            itemType = "item"
        },
        [4] = {
            itemName = "weapon_pistol_mk2",
            itemLabel = "Pistol Mk2",
            itemCount = 1,
            itemType = "item"
        },
        [5] = {
            itemName = "weapon_ceramicpistol",
            itemLabel = "Ceramic Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [6] = {
            itemName = "weapon_pistol50",
            itemLabel = "Pistol 50cal",
            itemCount = 1,
            itemType = "item"
        },
        [7] = {
            itemName = "weapon_machinepistol",
            itemLabel = "Machine Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [8] = {
            itemName = "Armor",
            itemLabel = "Armor",
            itemCount = 1,
            itemType = "item"
        }
    },
    [3] = {
        [1] = {
            itemName = "money",
            itemLabel = "1000$",
            itemCount = 1000,
            itemType = "money"
        },
        [2] = {
            itemName = "money",
            itemLabel = "10000$",
            itemCount = 10000,
            itemType = "money"
        },
        [3] = {
            itemName = "money",
            itemLabel = "10000$",
            itemCount = 10000,
            itemType = "money"
        },
        [4] = {
            itemName = "money",
            itemLabel = "20000$",
            itemCount = 20000,
            itemType = "money"
        },
        [5] = {
            itemName = "thermite",
            itemLabel = "thermite",
            itemCount = 1,
            itemType = "item"
        },
        [6] = {
            itemName = "weapon_heavypistol",
            itemLabel = "Heavy Pistol",
            itemCount = 100000,
            itemType = "money"
        },
        [7] = {
            itemName = "smg_ammo",
            itemLabel = "Smg Ammo",
            itemCount = 2,
            itemType = "money"
        },
        [8] = {
            itemName = "Armor",
            itemLabel = "Armor",
            itemCount = 2,
            itemType = "item"
        }
    },
    [4] = {
        [1] = {
            itemName = "club",
            itemLabel = "Club",
            itemCount = 1,
            itemType = "vehicle"
        },
        [2] = {
            itemName = "sentinel",
            itemLabel = "Sentinel",
            itemCount = 1,
            itemType = "vehicle"
        },
        [3] = {
            itemName = "hakuchou",
            itemLabel = "Hakuchou",
            itemCount = 1,
            itemType = "vehicle"
        },
        [4] = {
            itemName = "stryder",
            itemLabel = "Stryder",
            itemCount = 1,
            itemType = "vehicle"
        },
        [5] = {
            itemName = "yosemite3",
            itemLabel = "Yosemite3",
            itemCount = 1,
            itemType = "vehicle"
        },
        [6] = {
            itemName = "dominator7",
            itemLabel = "Dominator7",
            itemCount = 1,
            itemType = "vehicle"
        },
        [7] = {
            itemName = "seven70",
            itemLabel = "seven70",
            itemCount = 1,
            itemType = "vehicle"
        },
        [8] = {
            itemName = "italigtb2",
            itemLabel = "Itali GTB 2",
            itemCount = 1,
            itemType = "vehicle"
        }
    },
    [5] = {
        [1] = {
            itemName = "weapon_pistol50",
            itemLabel = "Pistol 50",
            itemCount = 1,
            itemType = "item"
        },
        [2] = {
            itemName = "weapon_heavypistol",
            itemLabel = "Heavy Pistol",
            itemCount = 1,
            itemType = "item"
        },
        [3] = {
            itemName = "money",
            itemLabel = "50.000",
            itemCount = 50000,
            itemType = "money"
        },
        [4] = {
            itemName = "italigtb2",
            itemLabel = "Itali GTB 2",
            itemCount = 1,
            itemType = "vehicle"
        },
        [5] = {
            itemName = "weapon_bzgas",
            itemLabel = "BZ Gas",
            itemCount = 1,
            itemType = "item"
        },
        [6] = {
            itemName = "money",
            itemLabel = "10.000$",
            itemCount = 10000,
            itemType = "money"
        },
        [7] = {
            itemName = "paragon",
            itemLabel = "Paragon",
            itemCount = 1,
            itemType = "vehicle"
        },
        [8] = {
            itemName = "money",
            itemLabel = "1.000$",
            itemCount = 1000,
            itemType = "money"
        }
    }
}
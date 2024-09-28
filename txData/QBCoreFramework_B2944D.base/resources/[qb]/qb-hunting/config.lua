Config = {}

Config.Debug = false

Config.Target = "QB" -- Set this to nil if not using target. Options: OX, Q, QB
Config.NoTarget = false -- Set this to true if not using target.

Config.Language = "en"

Config.ZonePathCount = 10 -- Amount of paths to generate each zone so animals can roam.
Config.ActionDistance = 10 -- Distance until an animal attacks / flees.

Config.HuntingZones = {
    {
        blip = {
            Label = "Animal Hunting",
            Location = vector3(-473.4817, 5647.9702, 55.4819),
            ID = 141,
            Display = 4,
            Scale = 0.75,
            Color = 0,
            Radius = {
                Color = 0,
                Opacity = 100,
            }
        },
        location = vector3(-473.4817, 5647.9702, 55.4819),
        radius = 50.0,
        maxAnimals = 15,
        animals = {
            [`a_c_deer`] = {
                Chance = 50, -- 25% chance of spawning per spawn request.
            },
            [`a_c_mtlion`] = {
                Chance = 5, -- % chance of spawning per spawn request.
            },
            [`a_c_boar`] = {
                Chance = 5, -- % chance of spawning per spawn request.
            },
            [`a_c_pig`] = {
                Chance = 5, -- % chance of spawning per spawn request.
            },
            [`a_c_rabbit_01`] = {
                Chance = 5, -- % chance of spawning per spawn request.
            },
        }
    },
}

Config.Animals = {
    [`a_c_deer`] = {
        canAttack = false,
        skinTime = 3,
        chopTime = 3,
        skinRewards = {
            {name = "animal_hide_1", count = 1, chance = 50},
            {name = "animal_hide_2", count = 1, chance = 25},
            {name = "animal_hide_3", count = 1, chance = 10},
        },
        chopRewards = {
            {name = "animal_meat_1", count = 1, chance = 50},
            {name = "animal_meat_2", count = 1, chance = 25},
            {name = "animal_meat_3", count = 1, chance = 10},
        },
        player = {
            boneID = 60309,
            offset = vector3(0.15, -0.47, 0.35),
            rotation = vector3(90.0, 0.0, 0.0),
        },
        trunk = {
            boneName = "engine",
            offset = vector3(0.0, 0.0, 1.0),
            rotation = vector3(0.0, 0.0, 90.0),
        }
    },
    [`a_c_mtlion`] = {
        canAttack = true,
        skinTime = 3,
        chopTime = 3,
        skinRewards = {
            {name = "animal_hide_1", count = 1, chance = 50},
            {name = "animal_hide_2", count = 1, chance = 25},
            {name = "animal_hide_3", count = 1, chance = 10},
        },
        chopRewards = {
            {name = "animal_meat_1", count = 1, chance = 50},
            {name = "animal_meat_2", count = 1, chance = 25},
            {name = "animal_meat_3", count = 1, chance = 10},
        },
        player = {
            boneID = 60309,
            offset = vector3(0.15, -0.47, 0.35),
            rotation = vector3(90.0, 0.0, 0.0),
        },
        trunk = {
            boneName = "boot",
            offset = vector3(0.0, 1.0, 1.2),
            rotation = vector3(0.0, 0.0, 90.0),
        }
    },
    [`a_c_boar`] = {
        canAttack = true,
        skinTime = 3,
        chopTime = 3,
        skinRewards = {
            {name = "animal_hide_1", count = 1, chance = 50},
            {name = "animal_hide_2", count = 1, chance = 25},
            {name = "animal_hide_3", count = 1, chance = 10},
        },
        chopRewards = {
            {name = "animal_meat_1", count = 1, chance = 50},
            {name = "animal_meat_2", count = 1, chance = 25},
            {name = "animal_meat_3", count = 1, chance = 10},
        },
        player = {
            boneID = 60309,
            offset = vector3(0.15, -0.47, 0.35),
            rotation = vector3(90.0, 0.0, 0.0),
        },
        trunk = {
            boneName = "boot",
            offset = vector3(0.0, 1.0, 1.2),
            rotation = vector3(0.0, 0.0, 90.0),
        }
    },
    [`a_c_pig`] = {
        canAttack = true,
        skinTime = 3,
        chopTime = 3,
        skinRewards = {
            {name = "animal_hide_1", count = 1, chance = 50},
            {name = "animal_hide_2", count = 1, chance = 25},
            {name = "animal_hide_3", count = 1, chance = 10},
        },
        chopRewards = {
            {name = "animal_meat_1", count = 1, chance = 50},
            {name = "animal_meat_2", count = 1, chance = 25},
            {name = "animal_meat_3", count = 1, chance = 10},
        },
        player = {
            boneID = 60309,
            offset = vector3(0.15, -0.47, 0.35),
            rotation = vector3(90.0, 0.0, 0.0),
        },
        trunk = {
            boneName = "boot",
            offset = vector3(0.0, 1.0, 1.2),
            rotation = vector3(0.0, 0.0, 90.0),
        }
    },
    [`a_c_rabbit_01`] = {
        canAttack = false,
        skinTime = 3,
        chopTime = 3,
        skinRewards = {
            {name = "animal_hide_1", count = 1, chance = 50},
            {name = "animal_hide_2", count = 1, chance = 25},
            {name = "animal_hide_3", count = 1, chance = 10},
        },
        chopRewards = {
            {name = "animal_meat_1", count = 1, chance = 50},
            {name = "animal_meat_2", count = 1, chance = 25},
            {name = "animal_meat_3", count = 1, chance = 10},
        },
        player = {
            boneID = 60309,
            offset = vector3(0.15, -0.47, 0.35),
            rotation = vector3(90.0, 0.0, 0.0),
        },
        trunk = {
            boneName = "boot",
            offset = vector3(0.0, 1.0, 1.2),
            rotation = vector3(0.0, 0.0, 90.0),
        }
    },
}

Config.Chopping = {
    points = { -- When animal is dropped in a chop-point, reward.
        {
            blip = {
                Label = "Animal Processing",
                Location = vector3(-85.6187, 6233.6670, 31.0911),
                ID = 141,
                Display = 4,
                Scale = 0.75,
                Color = 4,
            },
            requireLicense = true,
            location = vector3(-85.6187, 6233.6670, 31.0911),
            radius = 1.75,
        }
    }
}

Config.Exchange = {
    exchangeTime = 5,
    points = { -- When animal is dropped in a chop-point, reward.
        {
            blip = {
                Label = "Animal Selling",
                Location = vector3(2448.0605, 4962.3848, 44.8537),
                ID = 141,
                Display = 4,
                Scale = 0.75,
                Color = 4,
            },
            requireLicense = true,
            model = `ig_hunter`,
            location = vector3(2448.0605, 4962.3848, 44.8537),
            heading = 224.80,
            radius = 1.75,
            exchange = {
                ["animal_hide_1"] = { name = "money", min = 10, max = 30 },
                ["animal_hide_2"] = { name = "money", min = 20, max = 40 },
                ["animal_hide_3"] = { name = "money", min = 30, max = 50 },
                ["animal_meat_1"] = { name = "money", min = 40, max = 60 },
                ["animal_meat_2"] = { name = "money", min = 50, max = 70 },
                ["animal_meat_3"] = { name = "money", min = 60, max = 80 },
            },
        }
    }
}

Config.HuntingHorn = {
    item = "hunting_horn",
    radius = 1000.0, -- Displays all animals in radius.
    time = 120, -- Display timer.
    blip = {
        Label = "Tracked Animal",
        ID = 141,
        Display = 4,
        Scale = 0.4,
        Color = 1,
    },
}

Config.LicenseCheck = function(source, data, cb)
    -- Add your license check here, using Pickle Documents as an example.
    -- You can buy documents at https://store.picklemods.com/.
    local count = Search(source, "hunting_license")
    if count > 0 then 
        cb(true)
    else
        cb(true)
    end
end
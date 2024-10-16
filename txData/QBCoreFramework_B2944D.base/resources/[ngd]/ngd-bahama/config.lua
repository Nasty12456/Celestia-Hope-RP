---@diagnostic disable: duplicate-set-field
Config = {}

-- ██    ██ ████████ ██ ██      ██ ████████ ██ ███████ ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██      ██
-- ██    ██    ██    ██ ██      ██    ██    ██ █████   ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██           ██
--  ██████     ██    ██ ███████ ██    ██    ██ ███████ ███████

Config.debug = false                          -- leave off unless needed.
Config.polydebug = false                      -- leave off unless needed.
Config.BridgeDebug = false                    -- leave off unless needed.
Config.SDAutoVersion = true                  -- Autodetect menu used
Config.SDMenuVersion = 'ox'                   -- If above = false, define menu you want to use. (ox or qb)
Config.SDInputVersion = 'ox'                  -- input menu override
Config.UseOxProgBar = false                    -- true = Use ox_lib, false = use qb-progressbar
Config.Job = "bahama"                         -- Job Required
Config.ClearBlood = true                      -- Removed blood from player when using sink.
Config.ImagePath = Bridge.InventoryImagePath  -- This is set automatically
Config.UseSeating = true                      -- Use built in 'target' seating.
Config.UseDuty = true                         -- Shows 'Toggle Duty' option in boss menu.
Config.Notify = 'qb'                          --'esx', 'qb', 'qbox' 'okok', 'custom'
--Notifications:
Config.Notification = function(title, message, length, type)
    if Config.Notify == 'esx' then
        exports["esx_notify"]:Notify(type, length, message)
    elseif Config.Notify == 'qb' or 'qbox' then
        TriggerEvent('QBCore:Notify', { caption = title, text = message }, type, length)
    elseif Config.Notify == 'okok' then
        exports['okokNotify']:Alert(title, message, length, type)
    else
        --custom
    end
end

--Billing:
Config.BillingSystem = "NGD"                  --NGD, OkOkBilling or jim-payments
Config.PaymentType = 'cash'                   --Payment type for NGD billing system.  'cash' or 'bank'
Config.BillingCommission = {
  Enabled = true,    --Enable the ability for online employees to get paid from NGD billing system
  Percentage = 5,    --Percentage of total bill to pay employees
  Notify = true,     --Notify employee of payment
  MoneyType = 'cash' --Type of money to give employeee
}

-- ███    ██  ██████  ██████         ██████  ██████  ███    ██ ███████ ██    ██ ███    ███ ███████
-- ████   ██ ██       ██   ██       ██      ██    ██ ████   ██ ██      ██    ██ ████  ████ ██
-- ██ ██  ██ ██   ███ ██   ██ █████ ██      ██    ██ ██ ██  ██ ███████ ██    ██ ██ ████ ██ █████
-- ██  ██ ██ ██    ██ ██   ██       ██      ██    ██ ██  ██ ██      ██ ██    ██ ██  ██  ██ ██
-- ██   ████  ██████  ██████         ██████  ██████  ██   ████ ███████  ██████  ██      ██ ███████
--Configuration for the built in consumables.  If NGDConsume = true - then it will register all of the food items.

Config.NGDConsume = true                      -- Use built in consumables.
Config.DisableMovement = false                -- Disables moving while eating
Config.DisableCarMovement = false             -- Disables driving while eating
Config.DisableMouse = false                   -- Disables mouse movement while eating
Config.DisableCombat = true                   -- Disables combat while eating
-- Pretzel Configuration --
Config.PretzelBagItem = 'ngd_bhpretzelb'      -- Pretzel Bag in the ingredients store
Config.PretzelItem = 'ngd_bhpretzel'          -- Pretzel Item
Config.PretzelItemQTY = 10                    -- Amount of pretzels you get from bag when used
-- Thirst/Stress Configuration --
Config.CoffeeThirstRange = { 5, 15 } --Ranges for the food/drink effects
Config.CoffeeStressRange = { 5, 15 }
Config.WineThirstRange = { 5, 15 }
Config.WineStressRange = { 5, 15 }
Config.MixedDrinkThirstRange = { 5, 15 }
Config.MixedDrinkStressRange = { 5, 15 }
Config.BeerThirstRange = { 5, 15 }
Config.BeerStressRange = { 5, 15 }
Config.PretzelMinusThirstRange = { 1, 2 }
Config.PretzelHungerRange = { 1, 2 }


-- ███    ███  █████  ██ ███    ██     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██
-- ████  ████ ██   ██ ██ ████   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██
-- ██ ████ ██ ███████ ██ ██ ██  ██     ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██
-- ██  ██  ██ ██   ██ ██ ██  ██ ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██
-- ██      ██ ██   ██ ██ ██   ████     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████
--Main location configuration

Config.Locations = {}
Config.Locations['BahamaMama'] = {
  coords = {          --PZ to spawn in props
    vector3(-1383.986328125, -583.12420654297, 30.0),
    vector3(-1415.1124267578, -603.87225341797, 30.0),
    vector3(-1389.7033691406, -644.48284912109, 30.0),
    vector3(-1357.2215576172, -623.00946044922, 30.0)
  },
  height = 20,
  props = {                                            --Targetmodel props
    [1] = {
      coords = vector4(-1379.04, -599.39, 31.21, 309.0), -- Counter Left MAIN
      model = `lary_shaker_1`                          -- Drink Mixer
    },
    [2] = {
      coords = vector4(-1376.53, -595.88, 31.14, 128.0), -- Back drink cabinets MAIN
      model = `lary_shaker_1`                          -- Drink Mixer
    },
    [3] = {
      coords = vector4(-1380.42, -596.85, 31.21, 307.0), -- Counter Right MAIN
      model = `lary_shaker_1`                          -- Drink Mixer
    },
    [4] = {
      coords = vector4(-1382.9, -628.1, 36.93, 112.0), -- Counter Right VIP
      model = `lary_shaker_1`                        -- Drink Mixer
    },
    [5] = {
      coords = vector4(-1385.9, -623.52, 36.93, 112.0), -- Counter LEFT VIP
      model = `lary_shaker_1`                         -- Drink Mixer
    },
  },
  nontarget = {                                       --Non targetmodel props
    [1] = {
      coords = vector4(-1386.95, -622.8, 36.93, 213.0), -- VIP BAR COUNTER
      model = `winerow`
    },
    [2] = {
      coords = vector4(-1377.99, -602.45, 31.68, 137.0), -- Main BAR COUNTER
      model = `prop_cs_silver_tray`
    },
    [3] = {
      coords = vector4(-1381.24, -596.90, 31.21, 302.0), -- Main BAR COUNTER
      model = `prop_cs_silver_tray`
    },
    [4] = {
      coords = vector4(-1379.46, -599.70, 31.21, 222.0), -- Main BAR COUNTER
      model = `prop_cs_silver_tray`
    },
  }
}

-- ██████  ██      ██ ██████
-- ██   ██ ██      ██ ██   ██
-- ██████  ██      ██ ██████
-- ██   ██ ██      ██ ██
-- ██████  ███████ ██ ██
--Blip Configuration

Config.Blip = {
  Enabled = true,
  Location = vector3(-1388.93, -584.68, 30.22),
  Sprite = 766,
  Scale = 0.8,
  Color = 50,
  ShortRange = true, --Blip will only show when nearby.
  Name = "Bahama Mama",
}

-- ██████  ███████ ██████      ███████ ████████  ██████  ██████  ███████
-- ██   ██ ██      ██   ██     ██         ██    ██    ██ ██   ██ ██
-- ██████  █████   ██   ██     ███████    ██    ██    ██ ██████  █████
-- ██      ██      ██   ██          ██    ██    ██    ██ ██   ██ ██
-- ██      ███████ ██████      ███████    ██     ██████  ██   ██ ███████

--STORE PED
Config.UseStorePed = true                                     -- Use the store PED to load/sell items to other players
Config.PedLocation = vector4(-1378.77, -598.51, 30.22, 127.85) -- Location of the store PED
Config.PedModel = 'a_f_y_genhot_01'                           -- Model of store PED
Config.SocietyAccount = 'bahama'                                  -- Society to deposit money made
Config.StorePedStash = 'NGDBahamaPedStoreStash'                   -- Stash for PED store (No reason to change)
Config.CurrencyType = 'cash'                                  --'cash' or 'bank'
Config.StoreProducts = {
  ['ngd_bhredwine'] = {                                            -- Item able to be added and sold at store
    price = 15,                                               -- Price that items are sold for
  },
  ['ngd_bhwhitewine'] = {
    price = 8,
  },
  ['ngd_bhcham'] = {
    price = 8,
  },
  ['ngd_bhes'] = {
    price = 12,
  },
  ['ngd_bhbs'] = {
    price = 15,
  },
  ['ngd_bhgh'] = {
    price = 18,
  },
  ['ngd_bhyb'] = {
    price = 15,
  },
  ['ngd_bhss'] = {
    price = 15,
  },
  ['ngd_bhpr'] = {
    price = 15,
  },
  ['ngd_bhbh'] = {
    price = 12,
  },
  ['ngd_bhhb'] = {
    price = 14,
  },
  ['ngd_bhts'] = {
    price = 12,
  },
  ['ngd_bhpk'] = {
    price = 12,
  },
  ['ngd_bhbama'] = {
    price = 12,
  },
  ['ngd_bhjf'] = {
    price = 15,
  },
  ['ngd_bhfb'] = {
    price = 15,
  },
  ['ngd_bhba'] = {
    price = 15,
  },
  ['ngd_bhtt'] = {
    price = 12,
  },
  ['ngd_bhgf'] = {
    price = 10,
  },
  ['ngd_bhgat'] = {
    price = 25,
  },
  ['ngd_bhhm'] = {
    price = 8,
  },
  ['ngd_bhmar'] = {
    price = 8,
  },
  ['ngd_bhav'] = {
    price = 8,
  },
  ['ngd_bhlb'] = {
    price = 8,
  },
  ['ngd_bhlager'] = {
    price = 8,
  },
  ['ngd_bhstout'] = {
    price = 8,
  },
  ['ngd_bhpretzelb'] = {
    price = 5,
  },
}


-- ███    ███ ███████ ███    ██ ██    ██
-- ████  ████ ██      ████   ██ ██    ██
-- ██ ████ ██ █████   ██ ██  ██ ██    ██
-- ██  ██  ██ ██      ██  ██ ██ ██    ██
-- ██      ██ ███████ ██   ████  ██████
--Event to open UI if you want to trigger it another way: 'ngd-bahama:Client:OpenMenu'

--Config for physical/usable item for menu
Config.MenuItem = {
  Enabled = true, --If false, you MUST remove the item from the [9] in Config.IngredientStores !!
  ItemName = 'ngd_bhmenu'
}

--Target zones for ingame menu UI
Config.MenuLocations = {
  ['BahamaMenu1'] = { --Main Bar
    coords = vector3(-1380.79, -597.35, 30.21),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
  ['BahamaMenu2'] = { --Main Bar
    coords = vector3(-1383.24, -593.9, 30.21),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
  ['BahamaMenu3'] = { --Main Bar
    coords = vector3(-1379.15, -600.0, 30.21),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
}

-- ██████   ██████  ███████ ███████     ███    ███ ███████ ███    ██ ██    ██
-- ██   ██ ██    ██ ██      ██          ████  ████ ██      ████   ██ ██    ██
-- ██████  ██    ██ ███████ ███████     ██ ████ ██ █████   ██ ██  ██ ██    ██
-- ██   ██ ██    ██      ██      ██     ██  ██  ██ ██      ██  ██ ██ ██    ██
-- ██████   ██████  ███████ ███████     ██      ██ ███████ ██   ████  ██████
--Locations of Boss/Duty menu

Config.BossDutyMenu = {
  ['bossmenu1'] = { --Main Bar
    coords = vector3(-1374.62, -603.58, 30.5),
    size = vector3(0.8, 0.8, 0.8),
    rotation = 114.0,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    billinglabel = 'NGD Billing System',
    billingicon = 'fa-solid fa-dollar-sign'
  },
  ['bossmenu2'] = { -- Bosses Office Upstairs
    coords = vector3(-1376.4, -620.99, 35.8),
    size = vector3(0.8, 0.8, 0.8),
    rotation = 113.42,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    billinglabel = 'NGD Billing System',
    billingicon = 'fa-solid fa-dollar-sign'
  },
}

-- ██████  █████  ███████  ██   ██     ██████  ███████  ██████  ██ ███████ ████████ ███████ ██████  ███████
-- ██      ██   ██ ██      ██   ██     ██   ██ ██      ██       ██ ██         ██    ██      ██   ██ ██
-- ██      ███████ ███████ ███████     ██████  █████   ██   ███ ██ ███████    ██    █████   ██████  ███████
-- ██      ██   ██      ██ ██   ██     ██   ██ ██      ██    ██ ██      ██    ██    ██      ██   ██      ██
--  ██████ ██   ██ ███████ ██   ██     ██   ██ ███████  ██████  ██ ███████    ██    ███████ ██   ██ ███████
--Locations of Cash Registers

Config.CashRegister = {
  ['cashregister1'] = {                             -- Main Bar
    coords = vector3(-1376.74, -603.04, 30.5), -- Computer Monitor
    size = vector3(0.38, 0.7, 0.8),
    rotation = 61.0,
    label = 'Charge Customer',
    icon = 'fa-solid fa-cash-register',
  },
}

-- ██  ██████ ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██ ██      ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██ ██      █████       ███████    ██    ██    ██ ██████  █████   ███████
-- ██ ██      ██               ██    ██    ██    ██ ██   ██ ██           ██
-- ██  ██████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Locations and items from the ice machines

Config.IceMaker = {
  ['icemaker1'] = { -- Main Bar
    coords = vector3(-1382.00, -593.91, 29.66),
    size = vector3(0.5, 0.8, 1.2),
    rotation = 214.0,
    label = 'Grab Ice',
    icon = 'fa-solid fa-icicles',
  },
  ['icemaker2'] = { -- VIP Bar
    coords = vector3(-1383.57, -628.57, 35.57),
    size = vector3(0.5, 0.8, 0.8),
    rotation = 123.85,
    label = 'Grab Ice',
    icon = 'fa-solid fa-icicles',
  },
}

Config.IceMachineStore = {
  { name = "ngd_bhice", price = 0, count = 100, metadata = {} },
}

-- ██████   ██       █████  ███████ ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██       ██      ██   ██ ██      ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██   ███ ██      ███████ ███████ ███████     ███████    ██    ██    ██ ██████  █████   ███████
-- ██    ██ ██      ██   ██      ██      ██          ██    ██    ██    ██ ██   ██ ██           ██
--  ██████  ███████ ██   ██ ███████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items from the empty glass store

Config.Glasses = {
  ['glasses1'] = { --Main Bar
    coords = vector3(-1381.62, -591.52, 30.8),
    size = vector3(0.5, 1.8, 0.6),
    rotation = 123.0,
    label = 'Grab A Glass',
    icon = 'fa-solid fa-martini-glass',
  },
  ['glasses2'] = { --VIP Bar
    coords = vector3(-1384.50, -625.53, 37.2),
    size = vector3(0.6, 4.8, 0.5),
    rotation = 212.0,
    label = 'Grab A Glass',
    icon = 'fa-solid fa-martini-glass',
  },
}
Config.EmptyGlasses = {
  [1] = { name = "ngd_bhmartiniglass", price = 0, count = 100, metadata = {} },
  [2] = { name = "ngd_bhwineglass", price = 0, count = 100, metadata = {} },
  [3] = { name = "ngd_bhhurricaneglass", price = 0, count = 100, metadata = {} },
  [4] = { name = "ngd_bhchamglass", price = 0, count = 100, metadata = {} },
  [5] = { name = "ngd_bhtallglass", price = 0, count = 100, metadata = {} },
}

-- ██████   ██████  ████████ ████████ ██      ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██   ██ ██    ██    ██       ██    ██      ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██████  ██    ██    ██       ██    ██      █████       ███████    ██    ██    ██ ██████  █████   ███████
-- ██   ██ ██    ██    ██       ██    ██      ██               ██    ██    ██    ██ ██   ██ ██           ██
-- ██████   ██████     ██       ██    ███████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items from the bottle/alcohol stores

Config.AlcoholZones = {
  ['Alcohol1'] = { --Main Bar
    coords = vector3(-1381.2, -595.34, 30.2),
    size = vector3(0.3, 1.7, 0.5),
    rotation = 213.0,
    label = 'Grab Bottles',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['Alcohol2'] = { --VIP Bar
    coords = vector3(-1383.34, -629.14, 36.1),
    size = vector3(0.4, 2.0, 0.4),
    rotation = 123.0,
    label = 'Grab Bottles',
    icon = 'fa-solid fa-wine-bottle',
  },
}
Config.AlcoholStore = {
  [1] = { name = "ngd_bhtequila", price = 0, count = 100, metadata = {} },
  [2] = { name = "ngd_bhbrandy", price = 0, count = 100, metadata = {} },
  [3] = { name = "ngd_bhgin", price = 0, count = 100, metadata = {} },
  [4] = { name = "ngd_bhvodka", price = 0, count = 100, metadata = {} },
  [5] = { name = "ngd_bhrum", price = 0, count = 100, metadata = {} },
  [6] = { name = "ngd_bhcocorum", price = 0, count = 100, metadata = {} },
  [7] = { name = "ngd_bhvermouth", price = 0, count = 100, metadata = {} },
  [8] = { name = "ngd_bhhpnotiq", price = 0, count = 100, metadata = {} },
  [9] = { name = "ngd_bhbc", price = 0, count = 100, metadata = {} },
  [10] = { name = "ngd_bhcdm", price = 0, count = 100, metadata = {} },
  [11] = { name = "ngd_bhol", price = 0, count = 100, metadata = {} },
  [12] = { name = "ngd_bhmidori", price = 0, count = 100, metadata = {} },
  [13] = { name = "ngd_bhcdv", price = 0, count = 100, metadata = {} },
  [14] = { name = "ngd_bhgrenadine", price = 0, count = 100, metadata = {} },
}

-- ██ ███    ██  ██████  ██████  ███████ ██████  ██ ███████ ███    ██ ████████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██ ████   ██ ██       ██   ██ ██      ██   ██ ██ ██      ████   ██    ██        ██         ██    ██    ██ ██   ██ ██      ██
-- ██ ██ ██  ██ ██   ███ ██████  █████   ██   ██ ██ █████   ██ ██  ██    ██        ███████    ██    ██    ██ ██████  █████   ███████
-- ██ ██  ██ ██ ██    ██ ██   ██ ██      ██   ██ ██ ██      ██  ██ ██    ██             ██    ██    ██    ██ ██   ██ ██           ██
-- ██ ██   ████  ██████  ██   ██ ███████ ██████  ██ ███████ ██   ████    ██        ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items of the ingredient stores.

Config.IngredientZones = {
  ['Ingredients1'] = { --Main Bar
    coords = vector3(-1379.28, -598.30, 29.7),
    size = vector3(0.3, 3.8, 1.0),
    rotation = 213.0,
    label = 'Grab Ingredients',
    icon = 'fa-solid fa-cart-shopping',
  },
  ['Ingredients2'] = { --VIP Bar
    coords = vector3(-1388.03, -624.85, 35.6),
    size = vector3(0.4, 0.8, 2.0),
    rotation = 212.0,
    label = 'Grab Ingredients',
    icon = 'fa-solid fa-cart-shopping',
  },
}
Config.IngredientStores = {
  [1] = { name = "ngd_bhoj", price = 0, count = 100, metadata = {} },
  [2] = { name = "ngd_bhpj", price = 0, count = 100, metadata = {} },
  [3] = { name = "ngd_bhlj", price = 0, count = 100, metadata = {} },
  [4] = { name = "ngd_bhtonic", price = 0, count = 100, metadata = {} },
  [5] = { name = "ngd_bholive", price = 0, count = 100, metadata = {} },
  [6] = { name = "ngd_bhjal", price = 0, count = 100, metadata = {} },
  [7] = { name = "ngd_bhlime", price = 0, count = 100, metadata = {} },
  [8] = { name = "ngd_bhcream", price = 0, count = 100, metadata = {} },
  [9] = { name = "ngd_bhbb", price = 0, count = 100, metadata = {} },
  [10] = { name = "ngd_bhpretzelb", price = 0, count = 100, metadata = {} },
  [11] = { name = "ngd_bhcherry", price = 0, count = 100, metadata = {} },
  [12] = { name = "ngd_bhmenu", price = 0, count = 100, metadata = {} },
}

-- ██     ██ ██ ███    ██ ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██     ██ ██ ████   ██ ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██  █  ██ ██ ██ ██  ██ █████       ███████    ██    ██    ██ ██████  █████   ███████
-- ██ ███ ██ ██ ██  ██ ██ ██               ██    ██    ██    ██ ██   ██ ██           ██
--  ███ ███  ██ ██   ████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Locations and items of the wine stores.

Config.WineZones = {
  ['Wine1'] = { --Main Bar
    coords = vector3(-1376.04, -596.71, 30.0),
    size = vector3(0.6, 0.8, 2.3),
    rotation = 214.0,
    label = 'Grab Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['Wine2'] = { --VIP Bar
    coords = vector3(-1386.23, -627.47, 36.0),
    size = vector3(0.6, 1.8, 2.3),
    rotation = 212.0,
    label = 'Grab Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
}
Config.WineStore = {
  [1] = { name = "ngd_bhrwbottle", price = 0, count = 100, metadata = {} },
  [2] = { name = "ngd_bhwwbottle", price = 0, count = 100, metadata = {} },
  [3] = { name = "ngd_bhchambottle", price = 0, count = 100, metadata = {} },
}

-- ██     ██ ██ ███    ██ ███████     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██ ███████
-- ██     ██ ██ ████   ██ ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ██  █  ██ ██ ██ ██  ██ █████       ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████
-- ██ ███ ██ ██ ██  ██ ██ ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
--  ███ ███  ██ ██   ████ ███████     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████ ███████
--Locations to pour wine.

Config.PourWine = {
  ['PourWine1'] = { --Main Bar
    coords = vector3(-1378.4, -592.99, 30.45),
    size = vector3(0.4, 0.4, 0.5),
    rotation = 213.0,
    label = 'Pour Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['PourWine2'] = { --VIP Bar
    coords = vector3(-1386.95, -622.8, 36.2),
    size = vector3(0.6, 0.9, 0.5),
    rotation = 303.0,
    label = 'Pour Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
}

-- ███████ ████████  █████  ███████ ██   ██     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██ ███████
-- ██         ██    ██   ██ ██      ██   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ███████    ██    ███████ ███████ ███████     ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████
--      ██    ██    ██   ██      ██ ██   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
-- ███████    ██    ██   ██ ███████ ██   ██     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████ ███████
--Locations for stashes !! stashname = "" MUST BE UNIQUE PER STASH !!

--Stashes for job.  Requires the Config.Job = "" to open
Config.BulkStorage = {
  ['Storage1'] = { --Main Bar
    coords = vector3(-1377.86, -594.36, 30.4),
    size = vector3(0.3, 1.2, 2.1),
    rotation = 213.0,
    label = 'Open Storage',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Main Bar',
    InvWeight = 10000,
    InvSlots = 25
  },
  ['Storage2'] = {  --VIP Bar
    coords = vector3(-1384.66, -625.55, 35.35),
    size = vector3(0.3, 4.0, 1.1),
    rotation = 212.0,
    label = 'Open Storage',
    icon = 'fa-solid fa-warehouse',
    stashname = 'VIP Bar',
    InvWeight = 10000,
    InvSlots = 25
  },
}

--Stashes to pass food to other players
Config.FoodPass = {
  ['FoodPass1'] = { --Main Bar
    coords = vector3(-1377.99, -602.45, 30.68),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 227.0,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Main Bar Tray1',
    InvWeight = 2500,
    InvSlots = 5
  },
  ['FoodPass2'] = { --Main Bar
    coords = vector3(-1381.24, -596.90, 30.21),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 212.0,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Main Bar Tray2',
    InvWeight = 2500,
    InvSlots = 5
  },
  ['FoodPass3'] = { --Main Bar
    coords = vector3(-1379.46, -599.70, 30.21),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 132.0,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Main Bar Tray3',
    InvWeight = 2500,
    InvSlots = 5
  },
  ['FoodPass4'] = { --VIP Bar
    coords = vector3(-1385.26, -623.85, 35.95),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 122.0,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'VIP Bar Tray',
    InvWeight = 2500,
    InvSlots = 5
  },
}

-- ██████   ██████  ███████ ███████ ███████ ███████     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██ ███████
-- ██      ██    ██ ██      ██      ██      ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ██      ██    ██ █████   █████   █████   █████       ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████
-- ██      ██    ██ ██      ██      ██      ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
-- ██████  ██████   ██      ██      ███████ ███████     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████ ███████
--Locations for coffee dispensing

Config.CoffeeMachines = {
  ['Coffee1'] = { --VIP Bar
    coords = vector4(-1384.61, -629.82, 36.2, 213.0),
    size = vector3(0.5, 0.7, 0.5),
    rotation = 123.0,
    label = 'Make Coffee',
    icon = 'fa-solid fa-mug-hot',
    progtime = 2500
  },
}

-- ███████ ██ ███    ██ ██   ██ ███████
-- ██      ██ ████   ██ ██  ██  ██
-- ███████ ██ ██ ██  ██ █████   ███████
--      ██ ██ ██  ██ ██ ██  ██       ██
-- ███████ ██ ██   ████ ██   ██ ███████
--Locations for handwash

Config.HandWash = {
  ['sink1'] = { -- Main Bar
    coords = vector3(-1381.54, -591.84, 29.8),
    size = vector3(0.9, 0.9, 1.0),
    rotation = 123.0,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['sink2'] = { -- Bathroom Left
    coords = vector3(-1378.85, -625.07, 30.2),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 212.0,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['sink3'] = { -- Bathroom Middle Left
    coords = vector3(-1379.64, -623.86, 30.2),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 212.0,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['sink4'] = { -- Bathroom Middle Right
    coords = vector3(-1380.59, -622.39, 30.2),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 212.0,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['sink5'] = { -- Bathroom Right
    coords = vector3(-1381.39, -621.16, 30.2),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 212.0,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
}
-- ██████  ███████ ███████ ██████
-- ██   ██ ██      ██      ██   ██
-- ██████  █████   █████   ██████
-- ██   ██ ██      ██      ██   ██
-- ██████  ███████ ███████ ██   ██
--Locations for beer

Config.PourBeerLocations = {
  ['BHPourBeer1'] = { --Main Bar
    coords = vector3(-1378.05, -600.69, 30.24),
    size = vector3(0.4, 0.6, 0.6),
    rotation = 213.0,
    label = 'Pour Beer',
    icon = 'fa-solid fa-beer-mug-empty',
  },
}

--  █████  ███    ██ ██ ███    ███  █████  ████████ ██  ██████  ███    ██ ███████
-- ██   ██ ████   ██ ██ ████  ████ ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ███████ ██ ██  ██ ██ ██ ████ ██ ███████    ██    ██ ██    ██ ██ ██  ██ ███████
-- ██   ██ ██  ██ ██ ██ ██  ██  ██ ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
-- ██   ██ ██   ████ ██ ██      ██ ██   ██    ██    ██  ██████  ██   ████ ███████
--Animations for mixing drinks and pouring wine

Config.WineDrinkAnim = {
  dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@normal',
  anim = 'pour_one',
  prop = 'prop_wine_bot_01',
  bone = 57005,
  coords = vector3(0.17, -0.12, -0.11),
  rotation = vector3(-106.0, -260.0, 20.0),
  time = 3650,
  timeQB = 3650
}

Config.MixDrinksAnim = {
  dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_d@normal',
  anim = 'pour_one',
  prop = 'lary_shaker_1',
  bone = 57005,
  coords = vector3(0.11, -0.05, -0.05),
  rotation = vector3(-109.0, -126.0, -6.0),
  time = 3650,
  timeQB = 1800
}

Config.PourBeerAnim = {
  dict = 'mp_ped_interaction',
  anim = 'handshake_guy_a',
  time = 3650,
  timeQB = 1800
}

-- ███╗   ██╗ ██████╗ ██████╗       ██████╗      ██╗
-- ████╗  ██║██╔════╝ ██╔══██╗      ██╔══██╗     ██║
-- ██╔██╗ ██║██║  ███╗██║  ██║█████╗██║  ██║     ██║
-- ██║╚██╗██║██║   ██║██║  ██║╚════╝██║  ██║██   ██║
-- ██║ ╚████║╚██████╔╝██████╔╝      ██████╔╝╚█████╔╝
-- ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝       ╚═════╝  ╚════╝ 

Config.UseMusicPlayer = false --Use built in music player?  (Requires the installation of the ngd-dj resource included with script.)

Config.DjBooths = {
    [1] = {
        Header = 'Bahama DJ Booth',
        MusicCoords = vector3(-1388.63, -604.55, 30.21),
        Radius = 25,
        TargetCoords = vector3(-1389.23, -604.6, 31.4),
        TargetSize = vector3(1.4, 0.6, 0.6),
        TargetRotation = 344,
        TargetLabel = 'Play Music',
        TargetIcon = 'fa-solid fa-music',
        JobRestrict = Config.Job
    },
}


-- ██████  ███████  ██████ ██ ██████  ███████ ███████
-- ██   ██ ██      ██      ██ ██   ██ ██      ██
-- ██████  █████   ██      ██ ██████  █████   ███████
-- ██   ██ ██      ██      ██ ██      ██           ██
-- ██   ██ ███████  ██████ ██ ██      ███████ ███████
--Recipes for the drink mixer and wine pouring.

--WINE
Config.WineDrinks = {
  ['ngd_bhredwine'] = {
    ['ngd_bhwineglass'] = 1,
    ['ngd_bhrwbottle'] = 1,
  },
  ['ngd_bhwhitewine'] = {
    ['ngd_bhwineglass'] = 1,
    ['ngd_bhwwbottle'] = 1,
  },
  ['ngd_bhcham'] = {
    ['ngd_bhchamglass'] = 1,
    ['ngd_bhchambottle'] = 1,
  },
}
--BEER
Config.PourBeer = {
  ['ngd_bhlb'] = {
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhlager'] = {
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhstout'] = {
    ['ngd_bhtallglass'] = 1,
  },
}

--MIXED DRINKS
Config.MixedDrinks = {
  ['ngd_bhes'] = {
    ['ngd_bhtequila'] = 1,
    ['ngd_bhoj'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhbs'] = {
    ['ngd_bhbrandy'] = 1,
    ['ngd_bhbb'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhgh'] = {
    ['ngd_bhcdm'] = 1,
    ['ngd_bhcream'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhyb'] = {
    ['ngd_bhrum'] = 1,
    ['ngd_bhol'] = 1,
    ['ngd_bhlime'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhss'] = {
    ['ngd_bhcocorum'] = 1,
    ['ngd_bhmidori'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhpr'] = {
    ['ngd_bhvodka'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhcherry'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhbh'] = {
    ['ngd_bhcocorum'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhhb'] = {
    ['ngd_bhcocorum'] = 1,
    ['ngd_bhjal'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhts'] = {
    ['ngd_bhtequila'] = 1,
    ['ngd_bhgrenadine'] = 1,
    ['ngd_bhoj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhpk'] = {
    ['ngd_bhrum'] = 1,
    ['ngd_bhtonic'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhoj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhhurricaneglass'] = 1,
  },
  ['ngd_bhbama'] = {
    ['ngd_bhrum'] = 1,
    ['ngd_bhcocorum'] = 1,
    ['ngd_bhgrenadine'] = 1,
    ['ngd_bhpj'] = 1,
    ['ngd_bhoj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhjf'] = {
    ['ngd_bhvodka'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhtonic'] = 1,
    ['ngd_bhcream'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhfb'] = {
    ['ngd_bhtequila'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhlj'] = 1,
    ['ngd_bhcream'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhtt'] = {
    ['ngd_bhvodka'] = 1,
    ['ngd_bhtequila'] = 1,
    ['ngd_bhrum'] = 1,
    ['ngd_bhgin'] = 1,
    ['ngd_bhmidori'] = 1,
    ['ngd_bhlj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhgf'] = {
    ['ngd_bhgin'] = 1,
    ['ngd_bhoj'] = 1,
    ['ngd_bhlj'] = 1,
    ['ngd_bhlime'] = 1,
    ['ngd_bhtonic'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
  ['ngd_bhgat'] = {
    ['ngd_bhgin'] = 1,
    ['ngd_bhvermouth'] = 1,
    ['ngd_bhmidori'] = 1,
    ['ngd_bholive'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhhm'] = {
    ['ngd_bhhpnotiq'] = 1,
    ['ngd_bhgin'] = 1,
    ['ngd_bholive'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhmar'] = {
    ['ngd_bhgin'] = 1,
    ['ngd_bhvermouth'] = 1,
    ['ngd_bholive'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhav'] = {
    ['ngd_bhgin'] = 1,
    ['ngd_bhcdv'] = 1,
    ['ngd_bholive'] = 1,
    ['ngd_bhlj'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhmartiniglass'] = 1,
  },
  ['ngd_bhba'] = {
    ['ngd_bhbrandy'] = 1,
    ['ngd_bhbc'] = 1,
    ['ngd_bhlj'] = 1,
    ['ngd_bhcream'] = 1,
    ['ngd_bhice'] = 1,
    ['ngd_bhtallglass'] = 1,
  },
}

-- ███    ██  ██████  ██████         ██████  ██████  ███    ██ ███████ ██    ██ ███    ███  █████  ██████  ██      ███████ ███████
-- ████   ██ ██       ██   ██       ██      ██    ██ ████   ██ ██      ██    ██ ████  ████ ██   ██ ██   ██ ██      ██      ██
-- ██ ██  ██ ██   ███ ██   ██ █████ ██      ██    ██ ██ ██  ██ ███████ ██    ██ ██ ████ ██ ███████ ██████  ██      █████   ███████
-- ██  ██ ██ ██    ██ ██   ██       ██      ██    ██ ██  ██ ██      ██ ██    ██ ██  ██  ██ ██   ██ ██   ██ ██      ██           ██
-- ██   ████  ██████  ██████         ██████  ██████  ██   ████ ███████  ██████  ██      ██ ██   ██ ██████  ███████ ███████ ███████
--These for for if ngd-consumables = true | This sets the props and offsets.  Don't change unless you know what you are doing.

--Wine
Config.WineConsumables = {
  ['ngd_bhredwine'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'p_wine_glass_s',
    bone = 57005,
    coords = vector3(0.13, -0.07, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhwhitewine'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'prop_drink_whtwine',
    bone = 57005,
    coords = vector3(0.13, -0.07, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhcham'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'prop_drink_champ',
    bone = 57005,
    coords = vector3(0.09, -0.15, -0.08),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
}

--Coffee
Config.CoffeeItems = {
  ['ngd_bhcoffee'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'dark_roast_1',
    bone = 57005,
    coords = vector3(0.14, 0.03, -0.03),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 3500
  },
}

--Pretzels
Config.Pretzels = {
  ['ngd_bhpretzel'] = {
    dict = 'mp_player_inteat@burger',
    anim = 'mp_player_int_eat_burger',
    prop = 'lary_pretzel_1',
    bone = 18905,
    coords = vector3(0.15, 0.06, 0.02),
    rotation = vector3(0.0, 0.0, 0.0),
    time = 2500
  },
}

--Beer
Config.BeerConsumables = {
  ['ngd_bhlb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'lightbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhlager'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'mediumtbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhstout'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'darktbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
}

--Mixed Drinks
Config.MixedDrinkConsumables = {
  ['ngd_bhes'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_1',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhbs'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_2',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhgh'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_3',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhyb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_4',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhss'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_5',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhpr'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_6',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhbh'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_7',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhhb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_8',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhts'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_9',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhpk'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_10',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_bhbama'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_11',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhjf'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_12',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhfb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_13',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhba'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_14',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhtt'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_15',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhgf'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_16',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_bhgat'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_17',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhhm'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_18',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhmar'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_19',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_bhav'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'drink_aa_20',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
}

-- ██████  ██   ██  █████  ██ ██████  ███████
-- ██      ██   ██ ██   ██ ██ ██   ██ ██
-- ██      ███████ ███████ ██ ██████  ███████
-- ██      ██   ██ ██   ██ ██ ██   ██      ██
--  ██████ ██   ██ ██   ██ ██ ██   ██ ███████
Config.AnimationSets = {
  [1] = {
    { dict = 'anim@amb@office@seating@female@var_d@base@',              anim = 'base' },
    { dict = 'amb@code_human_in_bus_passenger_idles@female@sit@idle_a', anim = 'idle_b' },
    { dict = 'anim@amb@clubhouse@seating@female@var_a@base@',           anim = 'base' },
    { dict = 'anim@amb@clubhouse@seating@female@var_c@base@',           anim = 'base' },
    { dict = 'anim@amb@clubhouse@seating@female@var_b@base@',           anim = 'base' },
    { dict = 'anim@amb@clubhouse@seating@female@var_a@base@',           anim = 'base' },
  },
}
Config.Chairs = {
  [1] = {
    coords = vector3(-1403.00, -620.53, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 304,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [2] = {
    coords = vector3(-1403.61, -619.50, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 305,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [3] = {
    coords = vector3(-1404.19, -618.50, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 307,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [4] = {
    coords = vector3(-1404.79, -617.36, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 306,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [5] = {
    coords = vector3(-1405.29, -616.37, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 292,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [6] = {
    coords = vector3(-1405.61, -615.25, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 275,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [7] = {
    coords = vector3(-1405.82, -614.33, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 282,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [8] = {
    coords = vector3(-1405.97, -613.41, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 284,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [9] = {
    coords = vector3(-1406.26, -612.24, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 309,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [10] = {
    coords = vector3(-1406.78, -611.03, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 292,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [11] = {
    coords = vector3(-1407.19, -610.23, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 295,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [12] = {
    coords = vector3(-1407.42, -609.26, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 269,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [13] = {
    coords = vector3(-1406.93, -608.57, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 226,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [14] = {
    coords = vector3(-1406.04, -607.89, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 225,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [15] = {
    coords = vector3(-1405.00, -606.84, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 239,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [16] = {
    coords = vector3(-1404.40, -605.49, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 284,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [17] = {
    coords = vector3(-1404.62, -604.05, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 296,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [18] = {
    coords = vector3(-1404.97, -602.84, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 294,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [19] = {
    coords = vector3(-1404.20, -601.61, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 209,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [20] = {
    coords = vector3(-1403.21, -601.09, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 224,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [21] = {
    coords = vector3(-1402.19, -600.16, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 237,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [22] = {
    coords = vector3(-1401.48, -599.23, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 253,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [23] = {
    coords = vector3(-1400.87, -598.32, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 251,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [24] = {
    coords = vector3(-1400.39, -597.48, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 243,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [25] = {
    coords = vector3(-1398.41, -597.18, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 218,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [26] = {
    coords = vector3(-1396.62, -599.23, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 58,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [27] = {
    coords = vector3(-1390.92, -594.98, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 70,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [28] = {
    coords = vector3(-1393.77, -593.94, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 243,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [29] = {
    coords = vector3(-1401.22, -622.76, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 304,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [30] = {
    coords = vector3(-1401.75, -621.93, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 312,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [31] = {
    coords = vector3(-1399.24, -625.42, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 318,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [32] = {
    coords = vector3(-1397.55, -623.40, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 86,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [33] = {
    coords = vector3(-1397.11, -620.10, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 148,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [34] = {
    coords = vector3(-1393.80, -621.64, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 149,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [35] = {
    coords = vector3(-1365.38, -617.96, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 138,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [36] = {
    coords = vector3(-1364.59, -619.25, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 126,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [37] = {
    coords = vector3(-1364.51, -620.84, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 31,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [38] = {
    coords = vector3(-1365.59, -621.43, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 41,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [39] = {
    coords = vector3(-1366.64, -622.14, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 34,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [40] = {
    coords = vector3(-1367.92, -621.77, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 308,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [41] = {
    coords = vector3(-1368.86, -620.35, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 311,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [42] = {
    coords = vector3(-1366.64, -622.14, 29.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 34,
    height = 28.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
}

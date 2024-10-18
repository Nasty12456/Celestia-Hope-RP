---@diagnostic disable: duplicate-set-field
Config = {}

-- ██    ██ ████████ ██ ██      ██ ████████ ██ ███████ ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██      ██
-- ██    ██    ██    ██ ██      ██    ██    ██ █████   ███████
-- ██    ██    ██    ██ ██      ██    ██    ██ ██           ██
--  ██████     ██    ██ ███████ ██    ██    ██ ███████ ███████

Config.Job = "vu"                             -- Job Required
Config.ImagePath = Bridge.InventoryImagePath  -- Path to inventory for menu images
Config.debug = false                          -- leave off unless needed.
Config.polydebug = false                      -- leave off unless needed.
Config.BridgeDebug = false                    -- leave off unless needed
Config.SDAutoVersion = true                  -- Autodetect menu used
Config.SDMenuVersion = 'ox'                   -- If above = false, define menu you want to use. (v1 = nh_contextv1, v2 = nhcontextv2, zf = zf_context, qb = qb_menu, ox = ox_lib)
Config.UseDuty = true                         -- Adds toggle duty target options.
Config.UseOxProgBar = false                    -- true = Use ox_lib, false = use qb-progressbar
Config.SDInputVersion = 'ox'                  -- input menu override
Config.ClearBlood = true                      -- Removed blood from player when using sink.
Config.UseSeating = true                      -- Use built in 'target' seating.
Config.Notify = 'qb'                         --'esx', 'qb', 'qbox' 'okok', 'custom'
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
Config.BillingSystem = "NGD" --NGD, OkOkBilling or jim-payments
Config.PaymentType = 'cash'  --Payment type for NGD billing system.  'cash' or 'bank'
Config.BillingCommission = {
  Enabled = true,            --Enable the ability for online employees to get paid from NGD billing system
  Percentage = 5,            --Percentage of total bill to pay employees
  Notify = true,             --Notify employee of payment
  MoneyType = 'cash'         --Type of money to give employeee
}

-- ███    ██  ██████  ██████         ██████  ██████  ███    ██ ███████ ██    ██ ███    ███ ███████
-- ████   ██ ██       ██   ██       ██      ██    ██ ████   ██ ██      ██    ██ ████  ████ ██
-- ██ ██  ██ ██   ███ ██   ██ █████ ██      ██    ██ ██ ██  ██ ███████ ██    ██ ██ ████ ██ █████
-- ██  ██ ██ ██    ██ ██   ██       ██      ██    ██ ██  ██ ██      ██ ██    ██ ██  ██  ██ ██
-- ██   ████  ██████  ██████         ██████  ██████  ██   ████ ███████  ██████  ██      ██ ███████
--Configuration for the built in consumables.  If NGDConsume = true - then it will register all of the food items.

Config.NGDConsume = true                 -- Use built in consumables.
Config.DisableMovement = false           -- Disables moving while eating
Config.DisableCarMovement = false        -- Disables driving while eating
Config.DisableMouse = false              -- Disables mouse movement while eating
Config.DisableCombat = true              -- Disables combat while eating
-- Thirst/Stress Configuration Ranges --
Config.CoffeeThirstRange = { 5, 15 }     -- Range for thirst given from coffee
Config.CoffeeStressRange = { 5, 15 }     -- Range for stress relieved from coffee
Config.WineThirstRange = { 5, 15 }       -- Range for thirst given from wine
Config.WineStressRange = { 5, 15 }       -- Range for stress relieved from wine
Config.MixedDrinkThirstRange = { 5, 15 } -- Range for thirst given from mixed drinks
Config.MixedDrinkStressRange = { 5, 15 } -- Range for stress relieved from mixed drinks
Config.BeerThirstRange = { 5, 15 }       -- Range for thirst given from beer
Config.BeerStressRange = { 5, 15 }       -- Range for stress relieved from beer



-- ███    ███  █████  ██ ███    ██     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██
-- ████  ████ ██   ██ ██ ████   ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██
-- ██ ████ ██ ███████ ██ ██ ██  ██     ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██
-- ██  ██  ██ ██   ██ ██ ██  ██ ██     ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██
-- ██      ██ ██   ██ ██ ██   ████     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████
--Main location configuration

Config.Locations = {} --dont change.
Config.Locations['VU'] = {
  coords = {          --PZ to spawn in props
    vector3(100.72971343994, -1317.9542236328, 29.0),
    vector3(84.859603881836, -1289.576171875, 29.0),
    vector3(99.947257995605, -1281.6762695312, 29.0),
    vector3(134.11882019043, -1275.3835449219, 29.0),
    vector3(142.12991333008, -1291.2868652344, 29.0),
    vector3(115.36865997314, -1306.7048339844, 29.0),
    vector3(116.21619415283, -1309.2655029297, 29.0)
  },
  height = 15,
  props = {                                          --Targetmodel props
    [1] = {
      coords = vector4(114.64, -1282.03, 30.59, 48), -- Counter Left Main VU
      model = `lary_shaker_1`                        -- Drink Mixer
    },
    [2] = {
      coords = vector4(111.09, -1284.00, 30.59, 299), -- Counter Right Main VU
      model = `lary_shaker_1`                         -- Drink Mixer
    },
    [3] = {
      coords = vector4(102.70, -1297.36, 36.58, 340), -- Boss Office
      model = `lary_shaker_1`                         -- Drink Mixer
    },
    [4] = {
      coords = vector4(112.85, -1303.40, 22.46, 121), -- Pool
      model = `lary_shaker_1`                         -- Drink Mixer
    },
  },
  nontarget = {                                       --Non targetmodel props
    [1] = {
      coords = vector4(109.76, -1285.88, 30.75, 213), -- MAIN BAR RIGHT
      model = `prop_cs_silver_tray`
    },
    [2] = {
      coords = vector4(113.56, -1283.59, 30.725, 50), -- Main BAR MIDDLE
      model = `prop_cs_silver_tray`
    },
    [3] = {
      coords = vector4(117.50, -1281.54, 30.73, 225), -- Main BAR LEFT
      model = `prop_cs_silver_tray`
    },
    [4] = {
      coords = vector4(111.95, -1301.1, 22.8, 301), --Pool
      model = `prop_wine_rose`
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
  Location = vector3(130.62, -1301.38, 29.24),
  Sprite = 121,
  Scale = 0.8,
  Color = 61,
  ShortRange = true, --Blip will only show when nearby.
  Name = "Vanilla Unicorn",
}

-- ███╗   ██╗ ██████╗ ██████╗       ██████╗      ██╗
-- ████╗  ██║██╔════╝ ██╔══██╗      ██╔══██╗     ██║
-- ██╔██╗ ██║██║  ███╗██║  ██║█████╗██║  ██║     ██║
-- ██║╚██╗██║██║   ██║██║  ██║╚════╝██║  ██║██   ██║
-- ██║ ╚████║╚██████╔╝██████╔╝      ██████╔╝╚█████╔╝
-- ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝       ╚═════╝  ╚════╝

Config.UseMusicPlayer = true --Use built in music player?  (Requires the installation of the ngd-dj resource included with script.)

Config.DjBooths = {
  [1] = {
    Header = 'VU DJ Booth',
    MusicCoords = vector3(118.89, -1296.32, 28.44),
    Radius = 25,
    TargetCoords = vector3(119.01, -1299.56, 29.23),
    TargetSize = vector3(1.4, 0.6, 0.6),
    TargetRotation = 30,
    TargetLabel = 'Play Music',
    TargetIcon = 'fa-solid fa-music',
    JobRestrict = Config.Job
  },
}

-- ██████  ███████ ██████      ███████ ████████  ██████  ██████  ███████
-- ██   ██ ██      ██   ██     ██         ██    ██    ██ ██   ██ ██
-- ██████  █████   ██   ██     ███████    ██    ██    ██ ██████  █████
-- ██      ██      ██   ██          ██    ██    ██    ██ ██   ██ ██
-- ██      ███████ ██████      ███████    ██     ██████  ██   ██ ███████

--STORE PED
Config.UseStorePed = true                                     -- Use the store PED to load/sell items to other players
Config.PedLocation = vector4(112.23, -1282.78, 29.62, 213.38) -- Location of the store PED
Config.PedModel = 'a_f_y_genhot_01'                           -- Model of store PED
Config.SocietyAccount = 'vu'                                  -- Society to deposit money made
Config.StorePedStash = 'NGDVUStorePedStash'                   -- Stash for PED store (No reason to change)
Config.CurrencyType = 'cash'                                  --'cash' or 'bank'
Config.StoreProducts = {
  ['ngd_vusp'] = {                                            -- Item able to be added and sold at store
    price = 15,                                               -- Price that items are sold for
  },
  ['ngd_vuredwine'] = {
    price = 8,
  },
  ['ngd_vuwhitewine'] = {
    price = 8,
  },
  ['ngd_vucham'] = {
    price = 12,
  },
  ['ngd_vump'] = {
    price = 15,
  },
  ['ngd_50sog'] = {
    price = 18,
  },
  ['ngd_vuemp'] = {
    price = 15,
  },
  ['ngd_vudb'] = {
    price = 15,
  },
  ['ngd_vufc'] = {
    price = 15,
  },
  ['ngd_vurd'] = {
    price = 12,
  },
  ['ngd_vucs'] = {
    price = 14,
  },
  ['ngd_vubm'] = {
    price = 12,
  },
  ['ngd_vuds'] = {
    price = 12,
  },
  ['ngd_vublm'] = {
    price = 12,
  },
  ['ngd_vumgs'] = {
    price = 15,
  },
  ['ngd_vureap'] = {
    price = 15,
  },
  ['ngd_vuom'] = {
    price = 15,
  },
  ['ngd_vubw'] = {
    price = 12,
  },
  ['ngd_vumar'] = {
    price = 10,
  },
  ['ngd_vulmar'] = {
    price = 25,
  },
  ['ngd_vulb'] = {
    price = 8,
  },
  ['ngd_vustout'] = {
    price = 8,
  },
  ['ngd_vulager'] = {
    price = 8,
  },
}


-- ███    ███ ███████ ███    ██ ██    ██
-- ████  ████ ██      ████   ██ ██    ██
-- ██ ████ ██ █████   ██ ██  ██ ██    ██
-- ██  ██  ██ ██      ██  ██ ██ ██    ██
-- ██      ██ ███████ ██   ████  ██████
--Event to open UI if you want to trigger it another way: 'ngd-vu:Client:OpenMenu'

--Config for physical/usable item for menu
Config.MenuItem = {
  Enabled = true, --If false, you MUST remove the item from the [9] in Config.IngredientStores !!
  ItemName = 'ngd_vumenu'
}

--Target zones for ingame menu UI
Config.MenuLocations = {
  ['VUMenu1'] = { --Main Bar
    coords = vector3(118.06, -1280.88, 29.73),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
  ['VUMenu2'] = { --Main Bar
    coords = vector3(114.45, -1283.16, 29.73),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
  ['VUMenu3'] = { --Main Bar
    coords = vector3(110.95, -1285.29, 29.73),
    size = vector3(0.3, 0.3, 0.7),
    rotation = 120,
    label = 'Open Menu',
    icon = 'fa-solid fa-file',
  },
}

-- ███████ ████████ ██████  ██ ██████  ██████  ███████ ██████  ███████
-- ██         ██    ██   ██ ██ ██   ██ ██   ██ ██      ██   ██ ██
-- ███████    ██    ██████  ██ ██████  ██████  █████   ██████  ███████
--      ██    ██    ██   ██ ██ ██      ██      ██      ██   ██      ██
-- ███████    ██    ██   ██ ██ ██      ██      ███████ ██   ██ ███████

Config.MoneyType = "cash"     --Type of money used  when giving to strippers
Config.SocietyJob = "vu"      --Society that stripper money goes to
Config.StripperStartOn = true --PED strippers start on script start.
Config.StripperLocations = {
  ['Pole1'] = {
    coords = vector4(121.77, -1289.25, 29.26, 150.0),
    model = `csb_stripper_01`,
    dict = 'mini@strip_club@pole_dance@pole_dance1',
    anim = 'pd_dance_01'
  },
  ['Pole2'] = {
    coords = vector4(116.66, -1292.19, 29.26, 150.0),
    model = `csb_stripper_02`,
    dict = 'mini@strip_club@pole_dance@pole_dance2',
    anim = 'pd_dance_02'
  },
  ['Pole3'] = {
    coords = vector4(111.50, -1295.17, 29.26, 150.0),
    model = `csb_stripper_02`,
    dict = 'mini@strip_club@pole_dance@pole_dance3',
    anim = 'pd_dance_03'
  },
}

-- ██████   ██████  ███████ ███████     ███    ███ ███████ ███    ██ ██    ██
-- ██   ██ ██    ██ ██      ██          ████  ████ ██      ████   ██ ██    ██
-- ██████  ██    ██ ███████ ███████     ██ ████ ██ █████   ██ ██  ██ ██    ██
-- ██   ██ ██    ██      ██      ██     ██  ██  ██ ██      ██  ██ ██ ██    ██
-- ██████   ██████  ███████ ███████     ██      ██ ███████ ██   ████  ██████
--Locations of Boss/Duty menu

Config.BossDutyMenu = {
  ['VUbossmenu1'] = { --Main Bar
    coords = vector3(117.1, -1279.55, 29.6),
    size = vector3(0.6, 0.7, 1.2),
    rotation = 230,
    bosslabel = 'Open Boss Menu',
    bossicon = 'fa-solid fa-laptop',
    dutylabel = 'Toggle Duty',
    dutyicon = 'fa-solid fa-briefcase',
    stripperlabel = 'Toggle Strippers',
    strippericon = 'fa-solid fa-dollar-sign',
    billinglabel = 'NGD Billing System',
    billingicon = 'fa-solid fa-dollar-sign'
  },
  ['VUbossmenu2'] = { -- Bosses Office Upstairs
    coords = vector3(99.7, -1298.2, 35.7),
    size = vector3(0.4, 0.6, 0.8),
    rotation = 156,
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
  ['VUcashregister1'] = { -- Main Bar
    coords = vector3(117.36, -1280.44, 29.6),
    size = vector3(0.38, 0.6, 0.8),
    rotation = 202,
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
  ['VUicemaker1'] = { -- Main Bar
    coords = vector3(113.90, -1282.35, 28.9),
    size = vector3(0.5, 0.8, 1.2),
    rotation = 121,
    label = 'Grab Ice',
    icon = 'fa-solid fa-icicles',
  },
  ['VUicemaker2'] = { -- Boss Office
    coords = vector3(103.02, -1296.98, 35.8),
    size = vector3(0.3, 0.3, 0.4),
    rotation = 210,
    label = 'Grab Ice',
    icon = 'fa-solid fa-icicles',
  },
  ['VUicemaker3'] = { -- Pool
    coords = vector3(111.76, -1300.71, 21.6),
    size = vector3(0.3, 0.3, 0.4),
    rotation = 180,
    label = 'Grab Ice',
    icon = 'fa-solid fa-icicles',
  },
}
Config.IceMachineStore = {
  [1] = { name = "ngd_vuice", price = 0, count = 100, info = {}, type = "item", slot = 1 },
}

-- ██████   ██       █████  ███████ ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██       ██      ██   ██ ██      ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██   ███ ██      ███████ ███████ ███████     ███████    ██    ██    ██ ██████  █████   ███████
-- ██    ██ ██      ██   ██      ██      ██          ██    ██    ██    ██ ██   ██ ██           ██
--  ██████  ███████ ██   ██ ███████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items from the empty glass store

Config.Glasses = {
  ['VUglasses1'] = { --Main Bar
    coords = vector3(108.75, -1285.3, 29.7),
    size = vector3(0.5, 0.6, 0.4),
    rotation = 120,
    label = 'Grab A Glass',
    icon = 'fa-solid fa-martini-glass',
  },
  ['VUglasses2'] = { --Boss Office
    coords = vector3(102.41, -1295.97, 36.4),
    size = vector3(0.2, 2.2, 0.4),
    rotation = 210,
    label = 'Grab A Glass',
    icon = 'fa-solid fa-martini-glass',
  },
  ['VUglasses3'] = { --Pool
    coords = vector3(113.13, -1303.26, 21.45),
    size = vector3(0.3, 0.3, 0.4),
    rotation = 210,
    label = 'Grab A Glass',
    icon = 'fa-solid fa-martini-glass',
  },
}
Config.EmptyGlasses = {
  [1] = { name = "ngd_vumartiniglass", price = 0, count = 100, info = {}, type = "item", slot = 1 },
  [2] = { name = "ngd_vuwineglass", price = 0, count = 100, info = {}, type = "item", slot = 2 },
  [3] = { name = "ngd_vuhurricaneglass", price = 0, count = 100, info = {}, type = "item", slot = 3 },
  [4] = { name = "ngd_vuchamglass", price = 0, count = 100, info = {}, type = "item", slot = 4 },
  [5] = { name = "ngd_vutallglass", price = 0, count = 100, info = {}, type = "item", slot = 5 },
}

-- ██████   ██████  ████████ ████████ ██      ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██   ██ ██    ██    ██       ██    ██      ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██████  ██    ██    ██       ██    ██      █████       ███████    ██    ██    ██ ██████  █████   ███████
-- ██   ██ ██    ██    ██       ██    ██      ██               ██    ██    ██    ██ ██   ██ ██           ██
-- ██████   ██████     ██       ██    ███████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items from the bottle/alcohol stores

Config.AlcoholZones = {
  ['VUAlcohol1'] = { --Main Bar
    coords = vector3(112.16, -1280.33, 30.5),
    size = vector3(0.3, 6.7, 1.5),
    rotation = 101,
    label = 'Grab Bottles',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['VUAlcohol2'] = { --Boss Office
    coords = vector3(102.3, -1295.77, 35.58),
    size = vector3(0.4, 2.0, 0.4),
    rotation = 210,
    label = 'Grab Bottles',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['VUAlcohol3'] = { --Pool
    coords = vector3(112.89, -1302.93, 21.6),
    size = vector3(0.3, 0.3, 0.3),
    rotation = 210,
    label = 'Grab Bottles',
    icon = 'fa-solid fa-wine-bottle',
  },
}
Config.AlcoholStore = {
  [1] = { name = "ngd_vutequila", price = 0, count = 100, info = {}, type = "item", slot = 1 },
  [2] = { name = "ngd_vugin", price = 0, count = 100, info = {}, type = "item", slot = 2 },
  [3] = { name = "ngd_vuvodka", price = 0, count = 100, info = {}, type = "item", slot = 3 },
  [4] = { name = "ngd_vurum", price = 0, count = 100, info = {}, type = "item", slot = 4 },
  [5] = { name = "ngd_vucocorum", price = 0, count = 100, info = {}, type = "item", slot = 5 },
  [6] = { name = "ngd_vuvermouth", price = 0, count = 100, info = {}, type = "item", slot = 6 },
  [7] = { name = "ngd_vublvodka", price = 0, count = 100, info = {}, type = "item", slot = 7 },
  [8] = { name = "ngd_vubc", price = 0, count = 100, info = {}, type = "item", slot = 8 },
  [9] = { name = "ngd_vumidori", price = 0, count = 100, info = {}, type = "item", slot = 9 },
  [10] = { name = "ngd_vucdv", price = 0, count = 100, info = {}, type = "item", slot = 10 },
  [11] = { name = "ngd_vugrenadine", price = 0, count = 100, info = {}, type = "item", slot = 11 },
}

-- ██ ███    ██  ██████  ██████  ███████ ██████  ██ ███████ ███    ██ ████████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██ ████   ██ ██       ██   ██ ██      ██   ██ ██ ██      ████   ██    ██        ██         ██    ██    ██ ██   ██ ██      ██
-- ██ ██ ██  ██ ██   ███ ██████  █████   ██   ██ ██ █████   ██ ██  ██    ██        ███████    ██    ██    ██ ██████  █████   ███████
-- ██ ██  ██ ██ ██    ██ ██   ██ ██      ██   ██ ██ ██      ██  ██ ██    ██             ██    ██    ██    ██ ██   ██ ██           ██
-- ██ ██   ████  ██████  ██   ██ ███████ ██████  ██ ███████ ██   ████    ██        ███████    ██     ██████  ██   ██ ███████ ███████
--Location and items of the ingredient stores.

Config.IngredientZones = {
  ['VUIngredients1'] = { --Main Bar
    coords = vector3(110.65, -1284.13, 29.1),
    size = vector3(0.3, 2.5, 0.8),
    rotation = 120,
    label = 'Grab Ingredients',
    icon = 'fa-solid fa-cart-shopping',
  },
  ['VUIngredients2'] = { --Boss Office
    coords = vector3(102.08, -1296.30, 35.2),
    size = vector3(0.4, 1.8, 0.5),
    rotation = 210,
    label = 'Grab Ingredients',
    icon = 'fa-solid fa-cart-shopping',
  },
  ['VUIngredients3'] = { --Pool
    coords = vector3(112.21, -1302.11, 20.9),
    size = vector3(0.4, 3.8, 0.7),
    rotation = 210,
    label = 'Grab Ingredients',
    icon = 'fa-solid fa-cart-shopping',
  },
}
Config.IngredientStores = {
  [1] = { name = "ngd_vuoj", price = 0, count = 100, info = {}, type = "item", slot = 1 },
  [2] = { name = "ngd_vupj", price = 0, count = 100, info = {}, type = "item", slot = 2 },
  [3] = { name = "ngd_vulj", price = 0, count = 100, info = {}, type = "item", slot = 3 },
  [4] = { name = "ngd_vutonic", price = 0, count = 100, info = {}, type = "item", slot = 4 },
  [5] = { name = "ngd_vuolive", price = 0, count = 100, info = {}, type = "item", slot = 5 },
  [6] = { name = "ngd_vulime", price = 0, count = 100, info = {}, type = "item", slot = 6 },
  [7] = { name = "ngd_vumint", price = 0, count = 100, info = {}, type = "item", slot = 7 },
  [8] = { name = "ngd_vucbj", price = 0, count = 100, info = {}, type = "item", slot = 8 },
  [9] = { name = "ngd_vumenu", price = 0, count = 100, info = {}, type = "item", slot = 9 },
}

-- ██     ██ ██ ███    ██ ███████     ███████ ████████  ██████  ██████  ███████ ███████
-- ██     ██ ██ ████   ██ ██          ██         ██    ██    ██ ██   ██ ██      ██
-- ██  █  ██ ██ ██ ██  ██ █████       ███████    ██    ██    ██ ██████  █████   ███████
-- ██ ███ ██ ██ ██  ██ ██ ██               ██    ██    ██    ██ ██   ██ ██           ██
--  ███ ███  ██ ██   ████ ███████     ███████    ██     ██████  ██   ██ ███████ ███████
--Locations and items of the wine stores.

Config.WineZones = {
  ['VUWine1'] = { --Main Bar
    coords = vector3(110.95, -1284.56, 29.8),
    size = vector3(0.5, 0.8, 0.5),
    rotation = 120,
    label = 'Grab Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['VUWine2'] = { --VIP Bar
    coords = vector3(-1386.23, -627.47, 35.0),
    size = vector3(0.6, 1.8, 2.3),
    rotation = 212,

    label = 'Grab Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['VUWine3'] = { --VIP Bar
    coords = vector3(111.95, -1301.1, 21.6),
    size = vector3(0.2, 0.2, 0.4),
    rotation = 211,
    label = 'Grab Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
}
Config.WineStore = {
  [1] = { name = "ngd_vurwbottle", price = 0, count = 100, info = {}, type = "item", slot = 1 },
  [2] = { name = "ngd_vuwwbottle", price = 0, count = 100, info = {}, type = "item", slot = 2 },
  [3] = { name = "ngd_vuchambottle", price = 0, count = 100, info = {}, type = "item", slot = 3 },
}

-- ██     ██ ██ ███    ██ ███████     ██       ██████   ██████  █████  ████████ ██  ██████  ███    ██ ███████
-- ██     ██ ██ ████   ██ ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ████   ██ ██
-- ██  █  ██ ██ ██ ██  ██ █████       ██      ██    ██ ██      ███████    ██    ██ ██    ██ ██ ██  ██ ███████
-- ██ ███ ██ ██ ██  ██ ██ ██          ██      ██    ██ ██      ██   ██    ██    ██ ██    ██ ██  ██ ██      ██
--  ███ ███  ██ ██   ████ ███████     ███████  ██████   ██████ ██   ██    ██    ██  ██████  ██   ████ ███████
--Locations to pour wine.

Config.PourWine = {
  ['VUPourWine1'] = { --Main Bar
    coords = vector3(110.05, -1284.77, 29.6),
    size = vector3(0.4, 0.4, 0.5),
    rotation = 120,
    label = 'Pour Wine',
    icon = 'fa-solid fa-wine-bottle',
  },
  ['VUPourWine2'] = { --Pool
    coords = vector3(113.33, -1303.71, 21.44),
    size = vector3(0.3, 0.3, 0.4),
    rotation = 210,
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
  ['VUStorage1'] = { --Main Bar
    coords = vector3(115.65, -1281.18, 29.2),
    size = vector3(0.3, 2.0, 0.8),
    rotation = 120,
    label = 'Open Storage',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Main Bar',
    InvWeight = 10000,
    InvSlots = 25
  },
  ['VUStorage2'] = { --Main Bar Storeroom
    coords = vector3(99.93, -1289.51, 29.3),
    size = vector3(0.3, 1.5, 2.1),
    rotation = 210,
    label = 'Open Storage',
    icon = 'fa-solid fa-warehouse',
    stashname = 'Store Room',
    InvWeight = 10000,
    InvSlots = 25
  },
}

--Stashes to pass food to other players
Config.FoodPass = {
  ['VUFoodPass1'] = { --Main Bar
    coords = vector3(109.76, -1285.88, 29.8),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 123,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'VU Bar',
    InvWeight = 2500,
    InvSlots = 5
  },
  ['VUFoodPass2'] = { --Main Bar
    coords = vector3(113.56, -1283.59, 29.8),
    size = vector3(0.3, 0.4, 0.2),
    rotation = 140,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'VU Bar2',
    InvWeight = 2500,
    InvSlots = 5
  },
  ['VUFoodPass3'] = { --Main Bar
    coords = vector3(117.50, -1281.54, 29.8),
    size = vector3(0.35, 0.4, 0.2),
    rotation = 135,
    label = 'Grab Drinks',
    icon = 'fa-solid fa-warehouse',
    stashname = 'VU Bar3',
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
  ['VUCoffee1'] = { --Conference Room
    coords = vector3(106.84, -1308.37, 35.55),
    size = vector3(0.5, 0.5, 0.4),
    rotation = 120,
    label = 'Make Coffee',
    icon = 'fa-solid fa-mug-hot',
    progtime = 2500
  },
  ['VUCoffee2'] = { --Pool
    coords = vector3(112.51, -1302.4, 21.6),
    size = vector3(0.5, 0.5, 0.3),
    rotation = 210,
    label = 'Make Coffee',
    icon = 'fa-solid fa-mug-hot',
    progtime = 2500
  },
}

-- ██████  ███████ ███████ ██████
-- ██   ██ ██      ██      ██   ██
-- ██████  █████   █████   ██████
-- ██   ██ ██      ██      ██   ██
-- ██████  ███████ ███████ ██   ██
--Locations for beer

Config.PourBeerLocations = {
  ['VUPourBeer1'] = { --Main Bar
    coords = vector3(108.81, -1284.66, 29.8),
    size = vector3(0.3, 0.3, 0.4),
    rotation = 120,
    label = 'Pour Beer',
    icon = 'fa-solid fa-beer-mug-empty',
  },
}

-- ███████ ██ ███    ██ ██   ██ ███████
-- ██      ██ ████   ██ ██  ██  ██
-- ███████ ██ ██ ██  ██ █████   ███████
--      ██ ██ ██  ██ ██ ██  ██       ██
-- ███████ ██ ██   ████ ██   ██ ███████
--Locations for handwash

Config.HandWash = {
  ['VUsink1'] = {
    coords = vector3(126.83, -1276.73, 22.5),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 210,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['VUsink2'] = {
    coords = vector3(132.88, -1273.33, 22.5),
    size = vector3(0.7, 0.7, 0.5),
    rotation = 210,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['VUsink3'] = {
    coords = vector3(132.93, -1268.78, 22.36),
    size = vector3(0.7, 2.7, 0.5),
    rotation = 210,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['VUsink4'] = {
    coords = vector3(122.86, -1274.51, 22.3),
    size = vector3(0.7, 2.7, 0.5),
    rotation = 210,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
  ['VUsink5'] = {
    coords = vector3(107.69, -1283.37, 29.4),
    size = vector3(0.7, 1.0, 0.6),
    rotation = 29,
    label = 'Wash Hands',
    icon = 'fa-solid fa-hands-bubbles',
  },
}


-- ███████ ████████  █████   ██████  ███████
-- ██         ██    ██   ██ ██       ██
-- ███████    ██    ███████ ██   ███ █████
--      ██    ██    ██   ██ ██    ██ ██
-- ███████    ██    ██   ██  ██████  ███████

--Target zones to throw money at strippers.
Config.StageLocation = {
  ['MainStage'] = { --Main Stage
    coords = vector3(116.3141, -1292.617, 28.21893),
    size = vector3(16.5, 4.5, 0.4),
    rotation = 206,
    label = 'Throw Money',
    icon = 'fa-solid fa-money-bill-wave',
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
Config.ThrowMoneyAnim = {
  dict = 'anim@mp_player_intupperraining_cash',
  anim = 'idle_a',
  prop = 'prop_anim_cash_pile_01',
  bone = 18905,
  coords = vector3(0.16, 0.04, 0.02),
  rotation = vector3(0.0, 0.0, 0.0),
  time = 3650,
  timeQB = 3650
}

-- ██████  ███████  ██████ ██ ██████  ███████ ███████
-- ██   ██ ██      ██      ██ ██   ██ ██      ██
-- ██████  █████   ██      ██ ██████  █████   ███████
-- ██   ██ ██      ██      ██ ██      ██           ██
-- ██   ██ ███████  ██████ ██ ██      ███████ ███████
--Recipes for the drink mixer and wine pouring.

--Wine
Config.WineDrinks = {
  ['ngd_vuredwine'] = {
    ['ngd_vuwineglass'] = 1,
    ['ngd_vurwbottle'] = 1,
  },
  ['ngd_vuwhitewine'] = {
    ['ngd_vuwineglass'] = 1,
    ['ngd_vuwwbottle'] = 1,
  },
  ['ngd_vucham'] = {
    ['ngd_vuchamglass'] = 1,
    ['ngd_vuchambottle'] = 1,
  },
}

--Beer
Config.PourBeer = {
  ['ngd_vulb'] = {
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vulager'] = {
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vustout'] = {
    ['ngd_vutallglass'] = 1,
  },
}

--Mixed Drinks
Config.MixedDrinks = {
  ['ngd_vusp'] = {
    ['ngd_vutequila'] = 1,
    ['ngd_vupj'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_vump'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vugrenadine'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vupj'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_50sog'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vulj'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vucdv'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_vuemp'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vuvermouth'] = 1,
    ['ngd_vuoj'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vudb'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vucdv'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuchambottle'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vufc'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vucdv'] = 1,
    ['ngd_vulj'] = 1,
    ['ngd_vutonic'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vurd'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vugin'] = 1,
    ['ngd_vuoj'] = 1,
    ['ngd_vugrenadine'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vucs'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vugrenadine'] = 1,
    ['ngd_vupj'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vuds'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vutonic'] = 1,
    ['ngd_vurwbottle'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vubm'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vucdv'] = 1,
    ['ngd_vulj'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vuhurricaneglass'] = 1,
  },
  ['ngd_vuem'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vumidori'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuoj'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vublm'] = {
    ['ngd_vurum'] = 1,
    ['ngd_vumint'] = 1,
    ['ngd_vulime'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vumgs'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuoj'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vureap'] = {
    ['ngd_vuvodka'] = 1,
    ['ngd_vucocorum'] = 1,
    ['ngd_vutonic'] = 1,
    ['ngd_vugrenadine'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vutallglass'] = 1,
  },
  ['ngd_vuom'] = {
    ['ngd_vugin'] = 1,
    ['ngd_vuoj'] = 1,
    ['ngd_vuolive'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_vubw'] = {
    ['ngd_vublvodka'] = 1,
    ['ngd_vucbj'] = 1,
    ['ngd_vuolive'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_vumar'] = {
    ['ngd_vucocorum'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuolive'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
  ['ngd_vulmar'] = {
    ['ngd_vucocorum'] = 1,
    ['ngd_vubc'] = 1,
    ['ngd_vuolive'] = 1,
    ['ngd_vuice'] = 1,
    ['ngd_vumartiniglass'] = 1,
  },
}

-- ███    ██  ██████  ██████         ██████  ██████  ███    ██ ███████ ██    ██ ███    ███  █████  ██████  ██      ███████ ███████
-- ████   ██ ██       ██   ██       ██      ██    ██ ████   ██ ██      ██    ██ ████  ████ ██   ██ ██   ██ ██      ██      ██
-- ██ ██  ██ ██   ███ ██   ██ █████ ██      ██    ██ ██ ██  ██ ███████ ██    ██ ██ ████ ██ ███████ ██████  ██      █████   ███████
-- ██  ██ ██ ██    ██ ██   ██       ██      ██    ██ ██  ██ ██      ██ ██    ██ ██  ██  ██ ██   ██ ██   ██ ██      ██           ██
-- ██   ████  ██████  ██████         ██████  ██████  ██   ████ ███████  ██████  ██      ██ ██   ██ ██████  ███████ ███████ ███████
--These for for if ngd-consumables = true | This sets the props and offsets.  Don't change unless you know what you are doing.

--Beer
Config.BeerConsumables = {
  ['ngd_vulb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'lightbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vulager'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'mediumtbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vustout'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'darktbeer_glass',
    bone = 57005,
    coords = vector3(0.11, -0.03, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
}

--Wine
Config.WineConsumables = {
  ['ngd_vuredwine'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'p_wine_glass_s',
    bone = 57005,
    coords = vector3(0.13, -0.07, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vuwhitewine'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'prop_drink_whtwine',
    bone = 57005,
    coords = vector3(0.13, -0.07, -0.04),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vucham'] = {
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
  ['ngd_vucoffee'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'dark_roast_1',
    bone = 57005,
    coords = vector3(0.14, 0.03, -0.03),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 3500
  },
}

--Mixed Drinks
Config.MixedDrinkConsumables = {
  ['ngd_vusp'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink1',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vump'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink2',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_50sog'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink3',
    bone = 57005,
    coords = vector3(0.14, 0.01, -0.01),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vuemp'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink5',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vudb'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink6',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vufc'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink7',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vurd'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink8',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vucs'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink9',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vuds'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink10',
    bone = 57005,
    coords = vector3(0.11, -0.02, -0.04),
    rotation = vector3(-124.0, -93.0, -6.0),
    time = 5000
  },
  ['ngd_vubm'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink12',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_vuem'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink13',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_vublm'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink14',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_vumgs'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink15',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_vureap'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink16',
    bone = 57005,
    coords = vector3(0.08, -0.09, -0.06),
    rotation = vector3(-124.0, -117.0, 8.0),
    time = 5000
  },
  ['ngd_vuom'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink17',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vubw'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink18',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vumar'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink19',
    bone = 57005,
    coords = vector3(0.14, 0.02, -0.02),
    rotation = vector3(-109.0, -126.0, -6.0),
    time = 5000
  },
  ['ngd_vulmar'] = {
    dict = 'amb@world_human_drinking@coffee@male@idle_a',
    anim = 'idle_c',
    prop = 'alcdrink20',
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
  [2] = {
    { dict = 'amb@prop_human_seat_sunlounger@male@base', anim = 'base' },
  }
}

Config.Chairs = {
  [1] = {
    coords = vector3(120.10, -1279.61, 29.0),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 218,
    height = 28.1,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [2] = {
    coords = vector3(122.26, -1278.97, 29.0),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 157,
    height = 28.1,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [3] = {
    coords = vector3(125.82, -1278.13, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 222,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [4] = {
    coords = vector3(128.61, -1277.42, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 173,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [5] = {
    coords = vector3(129.50, -1281.89, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 55,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [6] = {
    coords = vector3(130.68, -1279.69, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 104,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [7] = {
    coords = vector3(130.68, -1279.69, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 104,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [8] = {
    coords = vector3(130.97, -1277.03, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 222,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [9] = {
    coords = vector3(133.63, -1277.67, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 99,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [10] = {
    coords = vector3(127.64, -1284.00, 28.6),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 177,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [11] = {
    coords = vector3(129.13, -1286.42, 28.60),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 91,
    height = 27.7,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [12] = {
    coords = vector3(126.12, -1293.18, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 33,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [13] = {
    coords = vector3(124.85, -1293.95, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 33,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [14] = {
    coords = vector3(120.71, -1296.32, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 35,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [15] = {
    coords = vector3(116.71, -1298.58, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 37,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [16] = {
    coords = vector3(117.83, -1298.06, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 31,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [17] = {
    coords = vector3(120.77, -1284.08, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 213,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [18] = {
    coords = vector3(119.64, -1284.64, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 201,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [19] = {
    coords = vector3(115.35, -1287.04, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 210,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [20] = {
    coords = vector3(111.32, -1289.42, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 209,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [21] = {
    coords = vector3(112.49, -1288.86, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 223,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [22] = {
    coords = vector3(116.61, -1286.40, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 217,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [23] = {
    coords = vector3(121.88, -1295.62, 27.8),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 37,
    height = 26.93,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [24] = {
    coords = vector3(134.61, -1288.56, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 33,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [25] = {
    coords = vector3(131.54, -1288.45, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 297,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [26] = {
    coords = vector3(131.91, -1289.09, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 314,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [27] = {
    coords = vector3(131.13, -1287.73, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 309,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [28] = {
    coords = vector3(128.02, -1282.29, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 295,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [29] = {
    coords = vector3(127.60, -1281.62, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 295,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [30] = {
    coords = vector3(127.25, -1280.87, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 306,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [31] = {
    coords = vector3(128.97, -1279.01, 22.05),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 218,
    height = 21.15,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [32] = {
    coords = vector3(124.09, -1287.61, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 41,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [33] = {
    coords = vector3(123.37, -1288.95, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 207,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [34] = {
    coords = vector3(123.03, -1288.26, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 28,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [35] = {
    coords = vector3(124.34, -1288.33, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 207,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [36] = {
    coords = vector3(119.68, -1291.62, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 260,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [37] = {
    coords = vector3(119.16, -1292.53, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 224,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [38] = {
    coords = vector3(118.29, -1292.86, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 184,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [39] = {
    coords = vector3(117.32, -1292.56, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 145,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [40] = {
    coords = vector3(116.86, -1291.70, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 118,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [41] = {
    coords = vector3(117.01, -1290.74, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 75,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [42] = {
    coords = vector3(117.68, -1290.11, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 25,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [43] = {
    coords = vector3(118.80, -1290.12, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 1,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [44] = {
    coords = vector3(119.50, -1290.70, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 307,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [45] = {
    coords = vector3(113.00, -1294.12, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 25,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [46] = {
    coords = vector3(113.28, -1294.75, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 211,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [47] = {
    coords = vector3(112.26, -1295.37, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 215,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [48] = {
    coords = vector3(111.89, -1294.65, 20.83),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 32,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [49] = {
    coords = vector3(111.62, -1291.74, 20.81),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 49,
    height = 19.9,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [50] = {
    coords = vector3(107.94, -1290.49, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 309,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [51] = {
    coords = vector3(107.38, -1289.54, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 302,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [52] = {
    coords = vector3(106.87, -1288.09, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 254,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [53] = {
    coords = vector3(107.82, -1287.11, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 221,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [54] = {
    coords = vector3(108.77, -1286.70, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 208,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [55] = {
    coords = vector3(109.93, -1286.14, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 181,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [56] = {
    coords = vector3(111.70, -1288.23, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 122,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [57] = {
    coords = vector3(111.18, -1287.18, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 120,
    height = 19.875,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [58] = {
    coords = vector3(121.37, -1286.13, 20.81),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 14,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [59] = {
    coords = vector3(122.89, -1285.34, 20.81),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 44,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [60] = {
    coords = vector3(118.83, -1284.19, 20.78),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 297,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [61] = {
    coords = vector3(118.13, -1283.33, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 306,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [62] = {
    coords = vector3(117.66, -1281.83, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 257,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [63] = {
    coords = vector3(119.51, -1280.31, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 224,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [64] = {
    coords = vector3(120.91, -1279.90, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 158,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [65] = {
    coords = vector3(121.98, -1280.93, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 129,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [66] = {
    coords = vector3(122.58, -1281.94, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [67] = {
    coords = vector3(118.65, -1280.79, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 205,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [68] = {
    coords = vector3(124.68, -1291.25, 20.81),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 217,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [69] = {
    coords = vector3(128.83, -1292.71, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [70] = {
    coords = vector3(129.46, -1293.63, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 124,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [71] = {
    coords = vector3(129.85, -1295.27, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 81,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [72] = {
    coords = vector3(128.80, -1296.24, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 27,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [73] = {
    coords = vector3(128.01, -1296.71, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 32,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [74] = {
    coords = vector3(126.55, -1297.16, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 346,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [75] = {
    coords = vector3(125.46, -1296.07, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 299,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [76] = {
    coords = vector3(124.85, -1295.09, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 300,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [77] = {
    coords = vector3(113.94, -1301.29, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 303,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [78] = {
    coords = vector3(114.65, -1302.24, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 308,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [79] = {
    coords = vector3(115.67, -1303.36, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 353,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [80] = {
    coords = vector3(117.13, -1303.02, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 353,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [81] = {
    coords = vector3(117.13, -1303.02, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 32,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [82] = {
    coords = vector3(117.91, -1302.45, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 33,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [83] = {
    coords = vector3(118.99, -1301.49, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 83,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [84] = {
    coords = vector3(118.49, -1299.98, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 119,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [85] = {
    coords = vector3(117.89, -1298.99, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 119,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [86] = {
    coords = vector3(124.00, -1303.14, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 124,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [87] = {
    coords = vector3(124.39, -1303.88, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 118,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [88] = {
    coords = vector3(124.89, -1304.58, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 123,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [89] = {
    coords = vector3(125.38, -1306.05, 20.98),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 81,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [90] = {
    coords = vector3(125.48, -1302.30, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 305,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [91] = {
    coords = vector3(125.85, -1302.95, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 301,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [92] = {
    coords = vector3(126.20, -1303.54, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 308,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [93] = {
    coords = vector3(112.56, -1280.11, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 304,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [94] = {
    coords = vector3(112.18, -1279.57, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 312,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [95] = {
    coords = vector3(111.67, -1278.69, 20.775),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 304,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  [96] = {
    coords = vector3(117.21, -1272.90, 20.98),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 160,
    height = 19.91,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 1,
  },
  --Loungers:
  [97] = {
    coords = vector3(107.54, -1302.31, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
  [98] = {
    coords = vector3(106.32, -1300.18, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
  [99] = {
    coords = vector3(105.02, -1298.11, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
  [100] = {
    coords = vector3(103.94, -1296.25, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
  [101] = {
    coords = vector3(102.69, -1294.12, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
  [102] = {
    coords = vector3(101.57, -1292.19, 20.7),
    size = vector3(0.4, 0.4, 0.4),
    rotation = 117,
    height = 19.8,
    label = 'Sit',
    icon = 'fas fa-couch',
    animationSet = 2,
  },
}

--[[
    If you have a different script name for the following ones, change it to your one
    Example:

    EXTERNAL_SCRIPTS_NAMES = {
        ["es_extended"] = "mygamemode_extended",
    }
]]

EXTERNAL_SCRIPTS_NAMES = {
    ["es_extended"] = "es_extended",
    ["qb-core"] = "qb-core",

    ["esx_addonaccount"] = "esx_addonaccount",

    -- If you don't use these inventories, don't touch
    ["ox_inventory"] = "ox_inventory",
    ["qs-inventory"] = "qs-inventory",
    
    -- Targeting
    ["ox_target"] = "ox_target",
    ["qb-target"] = "qb-target",
}

-- Edit here your police jobs
POLICE_JOBS_NAMES = {
    ["police"] = true,
    ["sheriff"] = true,
}

-- Separator for values like $12.553.212 (default it's the dot '.')
PRICES_SEPARATOR = "."

--[[
    The shared object of the framework will refresh each X seconds. If for any reason you don't want it to refresh, set to nil
]] 
SECONDS_TO_REFRESH_SHARED_OBJECT = nil

--[[
    Here you can define the Z axis offset of a object model, it can be useful in case a object is floating in fields or in seeds

    If the number is negative, the object will be placed below the default position
    If the number is positive, the object will be placed above the default position
]]
OBJECTS_MODELS_OFFSETS = {
    [GetHashKey("prop_plant_fern_01b")] = -0.3,
    [GetHashKey("prop_plant_paradise")] = -0.7,
    [GetHashKey("prop_plant_paradise_b")] = -0.5,
    [GetHashKey("prop_veg_grass_02_a")] = -0.55,
    [GetHashKey("bkr_prop_weed_med_01a")] = -2.52,
    [GetHashKey("bkr_prop_weed_lrg_01a")] = -2.52,
    [GetHashKey("prop_snow_tree_04_d")] = -2.2,
    [GetHashKey("prop_tree_pine_02")] = -0.5,
}
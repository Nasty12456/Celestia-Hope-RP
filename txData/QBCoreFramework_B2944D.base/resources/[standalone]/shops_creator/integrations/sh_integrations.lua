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

    ["doors_creator"] = "doors_creator", -- Only doors creator is supported

    -- If you don't use these inventories, don't touch
    ["ox_inventory"] = "ox_inventory",
    ["qs-inventory"] = "qs-inventory",

    -- Safe minigame, credits: https://github.com/VHall1/pd-safe
    ["pd-safe"] = "pd-safe",

    -- Scripts used for societies accounts
    ["qb-management"] = "qb-management",
    ["qb-bossmenu"] = "qb-bossmenu",
    ["esx_addonaccount"] = "esx_addonaccount",
    ["qb-banking"] = "qb-banking",

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
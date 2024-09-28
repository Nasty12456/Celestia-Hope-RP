Config = Config or {}

-- Change fuel script export
-- Suported fuel scripts: cdn-fuel, cdn-fuel
Config.FuelExport = "cdn-fuel";

-- true: allows the player to pay the rent with money from the bank
-- false: allows the player to pay the rent only with cash in hand
Config.EnableBankPayment = true;

-- Blips settings
Config.Blips = {
    sprite = 225,
    display = 2,
    scale = 0.5,
    colour = 32,
}

-- Add locations where the player can rent a vehicle
Config.Rentals = {
    -- Pillbox Hill Rent
    {
        ShowBlip = true,                                        -- Turn on/off blip on map

        -- Rental Npc Settings
        Npc = {
            coords = vector3(-1013.43, -2698.11, 13.99),            -- Spawn position for ped   old vector     vector3(111.53, -1089.1, 29.3)
            heading = 53.85,                                    -- Spawn heading for ped
            model = "s_m_m_dockwork_01",                        -- Model name of ped
            scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY",        -- Scenario that ped should play
        },

        -- Vehicle Spawn Settings
        VehicleSpawn = {
            { coords = vector3(-1024.16, -2685.89, 13.83), heading = 158.2},    
            { coords = vector3(-1031.23, -2671.69, 13.83), heading = 244.28 },
            { coords = vector3(-1031.4, -2657.74, 13.83),  heading = 148.97 },
        },

    },

    -- Hotel Rent
    {
        ShowBlip = true,                                        -- Turn on/off blip on map

        -- Rental Npc Settings
        Npc = {
            coords = vector3(-293.42, -986.73, 31.08),          -- Spawn position for ped
            heading = 63.85,                                    -- Spawn heading for ped
            model = "a_f_y_business_01",                        -- Model name of ped
            scenario = "WORLD_HUMAN_STAND_MOBILE",              -- Scenario that ped should play
        },

        -- Vehicle Spawn Settings
        VehicleSpawn = {
            { coords = vector3(-297.97, -990.52, 30.62), heading = 340.98 },
            { coords = vector3(-301.22, -988.95, 30.62), heading = 340.98 },
            { coords = vector3(-304.82, -987.76, 30.62), heading = 340.98 },
        },

    },
}

-- Add vehicles that shoul appears on rental menus
Config.Vehicles = {
    { name = 'BMX',         modelName = 'bmx',          price = 50,     needLicense = false,    menuIcon = 'fa-solid fa-bicycle'},
    { name = 'Scorcher',    modelName = 'scorcher',     price = 50,     needLicense = false,    menuIcon = 'fa-solid fa-bicycle' },
    { name = 'tailgater',      modelName = 'tailgater',       price = 100,    needLicense = false,     menuIcon = 'fa-solid fa-car-side' },
    { name = 'Panto',       modelName = 'panto',        price = 250,    needLicense = false,     menuIcon = 'fa-solid fa-car-side' },
    { name = 'Bison',       modelName = 'bison',        price = 500,    needLicense = false,     menuIcon = 'fa-solid fa-truck-pickup' }
}
-- Vehicle classes are identified by integer values. Common classes include:
-- [0]  Compacts, [1]  Sedans, [2]  SUVs, [3]  Coupes, [4]  Muscle, [5]  Sports Classics,
-- [6]  Sports, [7]  Super, [8]  Motorcycles, [9]  Off-road, [10] Industrial, [11] Utility,
-- [12] Vans, [13] Cycles, [14] Boats, [15] Helicopters, [16] Planes, [17] Service,
-- [18] Emergency, [19] Military, [20] Commercial, [21] Trains

zr_config = {}

-- Vehicle Class Blacklist Configuration:
-- To blacklist a vehicle class, set its value to 'true'.
zr_config.VehicleClassBlacklist = {
    [21] = true, -- Trains
}

zr_config.soundinsideonly = false

-- Command and Shortcut to open the menu
zr_config.OpenCommand = 'vehmenu'
zr_config.DefaultKey = "O"

 -- Set to true if you want the neon settings to be enabled without the need of installing it
zr_config.InstalledNeon = true
-- Set to true if you want players to switch to drift mode
zr_config.EnableDriftMode = true

-- Neon lights durations configuration

zr_config.neonFlashMode = 250
zr_config.neonPulseMode = 50
zr_config.neonShuffleMode = 500

-- Headlights durations configuration

zr_config.xenonFlashMode = 250
zr_config.xenonShuffleMode = 500


-- Script Data Update loop (Don't make it lower than 500)
zr_config.UpdateInterval = 500 



-- Translations 
zr_config.desText = "No destination"
zr_config.vehmenuNotif = {
    title = "[Vehicle Menu]",
    cannotAccessMessage = "You cannot access the vehicle menu while in this vehicle."
}


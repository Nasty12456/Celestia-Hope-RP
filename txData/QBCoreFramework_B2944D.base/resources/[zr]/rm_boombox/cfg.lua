Config = {
    framework = {
        name = "QB", -- Only ESX or QB or STANDALONE.
        scriptName = "qb-core", -- Framework script name work framework exports. (Example: qb-core or es_extended)
        eventName = "esx:getSharedObject", -- If your framework using trigger event for shared object, you can set in here.
        command = "boombox",
    },
    -- WARNING: Default mode will consume more ms. This option may cause performance loss!
    targetScript = "qb-target", -- Target script name (qtarget or qb-target or ox_target or default (for showhelpnotification))
    apiKey = "AIzaSyASwIPL9v53DuGDZfj1zLd5QpA_Dpslq00",-- ENTER API KEY (https://youtu.be/LLAZUTbc97I)
    boomboxLimit = 10, -- maximum boombox in server
    syncCooldown = 15, -- 15 seconds
    removeCommand = "rboombox",
    staffList = {
        ["steam:110000"] = true
    },
    boomboxes = {
        ["cutter"] = {
            propModel = "dtsm_speaker_1_white", -- boombox model
            maxDistance = 10, -- maximum sound hearing distance
            maxVolume = 1.0, -- maximum volume
            canPutHand = false, -- can put your hand
            canPutVehicle = false, -- can put on vehicle
            monitorOffsset = vector3(0.0, 0.0, 0.85), -- offset of the monitor on the boombox
            monitorRotation = vector3(0.0, 0.0, 90.0), -- rotation of the monitor on the boombox
            handOffset = vector3(0.6, 0.0, 0.2), -- offset in the boombox your hand
            handRotation = vector3(0.0, 250.0, 140.0), -- rotation in the boombox your hand
            vehicleOffset = vector3(0.0, 0.0, 0.9), -- offset on boombox vehicle
            vehicleRotation = vector3(0.0, 0.0, 0.0), -- rotation on boombox vehicle
            uiOffset = vector3(0.0, 0.0, 1.75) -- ui offset on boombox
        },
        ["boombox_red_large"] = {
            propModel = "dtsm_speaker_1_red",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },
        ["boombox_purple_large"] = {
            propModel = "dtsm_speaker_1_purple",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },
        ["boombox_pink_large"] = {
            propModel = "dtsm_speaker_1_pink",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },
        ["boombox_orange_large"] = {
            propModel = "dtsm_speaker_1_orange",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },
        ["boombox_green_large"] = {
            propModel = "dtsm_speaker_1_green",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },
        ["boombox_blue_large"] = {
            propModel = "dtsm_speaker_1_blue",
            maxDistance = 10,
            maxVolume = 1.0,
            canPutHand = false,
            canPutVehicle = false,
            monitorOffsset = vector3(0.0, 0.0, 0.85),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 0.0),
            uiOffset = vector3(0.0, 0.0, 1.75)
        },

        ["boombox_white_medium"] = {
            propModel = "dtsm_speaker_2_white",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_red_medium"] = {
            propModel = "dtsm_speaker_2_red",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_purple_medium"] = {
            propModel = "dtsm_speaker_2_purple",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_pink_medium"] = {
            propModel = "dtsm_speaker_2_pink",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_orange_medium"] = {
            propModel = "dtsm_speaker_2_orange",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_green_medium"] = {
            propModel = "dtsm_speaker_2_green",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },
        ["boombox_blue_medium"] = {
            propModel = "dtsm_speaker_2_blue",
            maxDistance = 50,
            maxVolume = 1.0,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.6, 0.0, 0.2),
            handRotation = vector3(0.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.5, 1.25)
        },

        ["boombox_white_small"] = {
            propModel = "dtsm_speaker_3_white",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_red_small"] = {
            propModel = "dtsm_speaker_3_red",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_purple_small"] = {
            propModel = "dtsm_speaker_3_purple",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_pink_small"] = {
            propModel = "dtsm_speaker_3_pink",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_orange_small"] = {
            propModel = "dtsm_speaker_3_orange",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_green_small"] = {
            propModel = "dtsm_speaker_3_green",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
        ["boombox_blue_small"] = {
            propModel = "dtsm_speaker_3_blue",
            maxDistance = 20,
            maxVolume = 0.5,
            canPutHand = true,
            canPutVehicle = true,
            monitorOffsset = vector3(0.0, 0.0, 0.4),
            monitorRotation = vector3(0.0, 0.0, 90.0),
            handOffset = vector3(0.5, 0.0, 0.2),
            handRotation = vector3(-40.0, 250.0, 140.0),
            vehicleOffset = vector3(0.0, 0.0, 0.9),
            vehicleRotation = vector3(0.0, 0.0, 90.0),
            uiOffset = vector3(0.0, 0.0, 1.25)
        },
    },
    controllerKeybinds = { -- https://docs.fivem.net/docs/game-references/controls/
        ["fullscreen"] = {
            keyText = "F",
            text = "Fullscreen",
            key = 23,
            order = 1,
        },
        ["pause"] = {
            keyText = "E",
            text = "Pause",
            key = 38,
            order = 2,
        },
        ["loop"] = {
            keyText = "L",
            text = "Loop",
            key = 182,
            order = 3,
        },
        ["f_seek"] = {
            keyText = ">",
            text = "+15s",
            duration = 15,
            key = 175,
            order = 4,
        },
        ["b_seek"] = {
            keyText = "<",
            text = "-15s",
            duration = -15,
            key = 174,
            order = 5,
        },
        ["skip"] = {
            keyText = "G",
            text = "Skip",
            key = 47,
            order = 6,
        },
    },
    standaloneKeys = { -- https://docs.fivem.net/docs/game-references/controls/
        ["enterUrl"] = 56,
        ["remove"] = 57,
        ["hand"] = 344,
        ["volume_up"] = 172,
        ["volume_down"] = 173,
    },
    putVehicleKey = "K",
    dropBoomboxKey = "L"
}

Strings = {
    ["already_have_boombox"] = "You have already placed a boombox.",
    ["boombox_limit"] = "You can't add more boombox because the boombox limit on the server has been reached.",
    ["dont_have_boombox"] = "You don't have enough boombox on you.",
    ["entity_not_exist"] = "Boombox entity not found.",
    ["api_key_not_found"] = "API key not found.",
    ["boombox_not_found"] = "No boombox belonging to you was found.",
    ["boombox_removed"] = "You removed the boombox.",
    ["boombox_hand_error"] = "You have to hold the boombox in your hand to put it in the vehicle.",
    ["cant_put_vehicle"] = "This boombox can't be put in the vehicle",
    ["cant_put_hand"] = "This boombox can't be put hand",
    ["not_found_vehicle"] = "No vehicle found nearby",
    --> input texts > https://docs.fivem.net/docs/game-references/controls/
    ["boombox_controller"] = "~INPUT_DROP_WEAPON~ Enter Url\n~INPUT_DROP_AMMO~ Remove Boombox\n~INPUT_SWITCH_VISOR~ Put Hand",
    ["drop_boombox"] = "Drop Boombox",
    ["put_vehicle"] = "Put/Take Boombox to Vehicle",
    ["target_enter_url"] = "Enter Url",
    ["target_remove_boombox"] = "Remove Boombox",
    ["target_put_hand"] = "Put Hand",
}


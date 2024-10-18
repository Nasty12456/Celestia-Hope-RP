/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-police-grab-ped
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Configuration ]]

Config = {
    Language = 'en', -- Language library used for the script, see the last lines to modify the text of the language. (Config.Languages)

    UseOutdatedVersion = false, -- Enable this parameter to suppress alert messages in the console if you wish to use an older version of the script.

    CommandEnabled = false, -- Activate or not the system to take it via the command.
    GrabCommand = 'grab', -- Command to take the person by the arm (modifiable from cl_utils.lua)
    PutCarCommand = 'putcar', -- Command to put the person into the vehicle. (modifiable from cl_utils.lua)
    ExitCarCommand = 'exitcar', -- Command to get the player out of a vehicle. (modifiable from cl_utils.lua)

    ESX = { -- ESX compatibility (you can modify this function on cl_utils.lua)
        enabled = false, -- Activate or not the ESX system
        jobs = { -- Job for which the grab ped can be used
            'police',
            'fbi',
        },
        exceptionJobs = false -- Do not take people with the above jobs (Config.ESX.jobs)
    },
        
    QB = { -- QB compatibility (you can modify this function on cl_utils.lua)
        enabled = false, -- Activate or not the QB system
        jobs = { -- Job for which the grab ped can be used
            'police',
            'fbi',
        }
    },

    Hint = true, -- Display the notifications at the top left of the screen to manage the dragged player (Drop the player, put in a vehicle, get out of the vehicle) when CommandEnabled = true

    DisableSprint = true, -- Disable the sprint (recommended: leave it true)

    CollisionRange = 0.5, -- Collision distance (0.0 to disable the dragged player's collision)

    AttachPosition = vector3(0.20, 0.45, 0.0), -- Positioning of the player facing the police officer

    Animations = {
        policeAnimation = {
            enabled = true, -- Activate or not the animation of the policeman when he takes a person by the arm.
            animDict = 'amb@world_human_drinking@coffee@male@base',
            anim = 'base'
        },
        citizenAnimation = {
            enabled = false, -- Activate or not the animation of the citizen when he is taken by the arm.
            animDict = 'amb@world_human_drinking@coffee@male@base',
            anim = 'base'
        }
    }
}

-- https://docs.fivem.net/docs/game-references/controls/
Config.Keys = {
    GrabAndDropKey = 289, -- If CommandEnabled is equal to false you must put a key to take the person.
    GrabAndDropKeyString = '~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~', -- Name of the button.

    TaskEnterKey = 305, -- Button to put the person inside the vehicle
    TaskEnterKeyString = '~INPUT_REPLAY_STARTPOINT~' -- Name of the button to put the person inside the vehicle
}

-- Libraries of languages.
Config.Languages = {
    ['en'] = {
        ['taskenter'] = 'Put the person in the vehicle '..Config.Keys.TaskEnterKeyString,
        ['exitped'] = 'Taking the person out the vehicle '..Config.Keys.TaskEnterKeyString,
        ['releaseperson'] = 'Release the person press '..Config.Keys.GrabAndDropKeyString
    },
    ['fr'] = {
        ['taskenter'] = 'Faire monter la personne '..Config.Keys.TaskEnterKeyString,
        ['exitped'] = 'Faire descendre la personne '..Config.Keys.TaskEnterKeyString,
        ['releaseperson'] = 'Lacher la personne '..Config.Keys.GrabAndDropKeyString
    }
}
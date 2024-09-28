Config = {}

Config.Framework = "auto" -- auto, esx or qb
Config.voipSystem = "auto" -- auto, pma-voice, mumble-voip, saltychat
Config.debug = true
Config.radioName = "radio" -- item name
Config.defaultVolume = 50 -- default volume of the radio, 0 - 100

Config.RadioProp = 'prop_cs_hand_radio'

Config.jobChannels = { -- channels where only designated jobs can participate
    [1] = {
        frequency = {
            "1",
            "2",
            "3",
            "4",
            "5"
        },
        jobs = {
            "police",
            "bcso"
        }
    },
    [2] = {
        frequency = {
            "1",
            "2",
            "3",
            "4",
            "5"
        },
        jobs = {
            "ambulance"
        }
    }
}

Config.Locale = {
    created = "Channel successfully created!",
    created_fail = "Already created on the same frequency.",
    
    disconnected = "You have successfully left the radio contact!",
    disconnected_fail = "An error occurred while trying to disconnect from the radio link.",

    connected = "You've successfully established radio contact!",
    password = "Enter the password for this channel to enter!",

    notfound = "frequency you want to enter was not found!",
    wrong = "Password is not correct!",

    wait = "Try again 1 second later.",
    kick = "You were disconnected because you didn't have a radio.",
    job = "This frequency is dedicated to a specific job!",

    volume_up = "volume increased.",
    volume_down = "volume reduced.",
    max = "volume at maximum level!",
    min = "volume at minimun level!"
}

function getFramework()
    if Config.Framework == "esx" then
        return exports['es_extended']:getSharedObject(), "esx"
    elseif Config.Framework == "qb" then
        return exports["qb-core"]:GetCoreObject(), "qb"
    elseif Config.Framework == "auto" then
        if GetResourceState('qb-core') == 'started' then
            return exports["qb-core"]:GetCoreObject(), "qb"
        elseif GetResourceState('es_extended') == 'started' then
            return exports['es_extended']:getSharedObject(), "esx"
        end
    end
end
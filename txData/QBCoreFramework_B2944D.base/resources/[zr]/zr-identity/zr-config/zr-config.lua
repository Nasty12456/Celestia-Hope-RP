zr_config = {}
zr_config.zr_translation = {}
zr_trans = zr_config.zr_translation

-- We support the following frameworks: 'QB' / 'ESX'
zr_config.framework = 'QB'
zr_config.QB = 'qb-core'
zr_config.ESX = 'es_extended'

zr_config.zr_notify = true

zr_config.ToggleInterior = true
zr_config.Interior = vector3(-786.9563, 315.6229, 187.9136)
zr_config.PlaCoords = vector4(-792.76, 343.09, 187.11, 184.69)
zr_config.CamCoords = vector4(-798.98, 328.32, 190.72, 270.53)
zr_config.EndCoords = vector4(-796.28, 328.3, 190.72, 85.32)
zr_config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86)

zr_config.DefaultModels = {"mp_m_freemode_01","mp_f_freemode_01"}

zr_config.quasarInventory = false
zr_config.spawn = 'qb-spawn' -- 'ps-housing' or 'qb-spawn' if you have 'zr-locations' you need to change in ZR-Multicharacter not here.
zr_config.StartingAppartment = true -- if 'true' make sure to keep 'qb-spawn' installed in your resources.

zr_config.maxlength = 18;
zr_config.minlength = 2;
zr_config.zr_minYear = 1900;
zr_config.zr_maxYear = 2005;
zr_config.zr_Format = "d/m/Y";

zr_config.minHeight = 160;
zr_config.maxHeight = 215;


zr_trans.notify_rls = 'Read & accept the rules first!'
zr_trans.notify_fld = 'All field are required!'
zr_trans.notify_fnm = 'First name length must be between '..zr_config.minlength..' and '..zr_config.maxlength..' characters!'
zr_trans.notify_lnm = 'Last name length must be between '..zr_config.minlength..' and '..zr_config.maxlength..' characters!'
zr_trans.notify_dat = 'Date format Invalide!'

zr_trans.maxch = "Oops! " ..zr_config.maxlength.. " characters max , letters only, no special characters or numbers and no badwords."
zr_trans.miny = "Must be at least 18 years."
zr_trans.org = 'OR'
zr_trans.nat = "The country you come from."
zr_trans.hei = "Must be between 160 and 215 CM."

zr_trans.rtitle = "Rules"
zr_trans.conf = "Your signature, your touch of elegance"
zr_trans.signature = "Signature"
zr_trans.rcaccept = "Accept"

zr_trans.cancel = "Cancel"
zr_trans.create = "Create character"


zr_trans.Ptitle = "Create Your Identity"
zr_trans.Pfname = "FIRST NAME"
zr_trans.Plname = "LAST NAME"
zr_trans.Pdob = "BIRTHDAY"
zr_trans.Pnat = "NATIONALITY"
zr_trans.Pgender = "GENDER"
zr_trans.Phei = "HEIGHT"

zr_config.Rules = {
    {
        title = "Roleplay Etiquette",
        rules = {
            "Respect the immersive nature of the server by staying in character (IC) at all times.",
            "Use appropriate roleplay names for your character. Avoid names that are offensive or unrealistic.",
            "Use appropriate roleplay names for your character. Avoid names that are offensive or unrealistic.",
            "Use appropriate roleplay names for your character. Avoid names that are offensive or unrealistic.",
            "Use appropriate roleplay names for your character. Avoid names that are offensive or unrealistic.",
            "Use appropriate roleplay names for your character. Avoid names that are offensive or unrealistic."
        }
    },
    {
        title = "Metagaming",
        rules = {
            "Do not use out-of-character (OOC) information for in-character (IC) actions.",
            "Communication between players should occur within the game, not through external means."
        }
    },
    {
        title = "Powergaming",
        rules = {
            "Avoid unrealistic actions that give your character an unfair advantage in roleplay situations.",
            "Ensure that your actions contribute to a fair and enjoyable experience for all players."
        }
    },
    {
        title = "Character Creation",
        rules = {
            "Create characters with realistic backgrounds and motivations.",
            "Refrain from creating characters with overpowered abilities or unrealistic traits."
        }
    },
    {
        title = "Value of Life",
        rules = {
            "Treat your character's life with value and avoid engaging in reckless behavior.",
            "Do not intentionally respawn or commit suicide to avoid roleplay situations."
        }
    },
    {
        title = "New Life Rule (NLR)",
        rules = {
            "After death, forget the events leading to your death and do not return to the same situation for a set period.",
            "NLR time should be clearly defined in the server rules."
        }
    },
    {
        title = "Robberies and Hostage Situations",
        rules = {
            "Prioritize roleplay during robberies and hostage situations.",
            "Follow the server guidelines for initiating and resolving these scenarios."
        }
    },
    {
        title = "Communication",
        rules = {
            "Use appropriate in-game channels for communication, such as local, radio, or phone.",
            "Avoid spamming or flooding communication channels."
        }
    },
    {
        title = "Respect for Staff and Players",
        rules = {
            "Follow instructions from server staff members.",
            "Treat all players with respect and avoid offensive language or behavior."
        }
    },
    {
        title = "Illegal Activities",
        rules = {
            "Follow server rules regarding illegal activities, such as drug trafficking, theft, and violence.",
            "Engage in these activities with proper roleplay and consideration for other players."
        }
    },
    {
        title = "Vehicle Usage",
        rules = {
            "Follow traffic laws and drive responsibly.",
            "Do not use vehicles to intentionally harm other players without proper roleplay."
        }
    },
    {
        title = "Out-of-Character (OOC) Disputes",
        rules = {
            "Resolve conflicts or disputes in a mature and respectful manner through appropriate channels.",
            "Avoid bringing OOC issues into the in-game environment."
        }
    },

}


zr_config.DefaultSkins = {
    ["m"] = {
        mom = 43,
        dad = 29,
        face_md_weight = 61,
        skin_md_weight = 27,
        nose_1 = -5,
        nose_2 = 6,
        nose_3 = 5,
        nose_4 = 8,
        nose_5 = 10,
        nose_6 = 0,
        cheeks_1 = 2,
        cheeks_2 = -10,
        cheeks_3 = 6,
        lip_thickness = -2,
        jaw_1 = 0,
        jaw_2 = 0,
        chin_1 = 0,
        chin_2 = 0,
        chin_13 = 0,
        chin_4 = 0,
        neck_thickness = 0,
        hair_1 = 76,
        hair_2 = 0,
        hair_color_1 = 61,
        hair_color_2 = 29,
        tshirt_1 = 4,
        tshirt_2 = 2,
        torso_1 = 23,
        torso_2 = 2,
        decals_1 = 0,
        decals_2 = 0,
        arms = 1,
        arms_2 = 0,
        pants_1 = 28,
        pants_2 = 3,
        shoes_1 = 70,
        shoes_2 = 2,
        mask_1 = 0,
        mask_2 = 0,
        bproof_1 = 0,
        bproof_2 = 0,
        chain_1 = 22,
        chain_2 = 2,
        helmet_1 = -1,
        helmet_2 = 0,
        glasses_1 = 0,
        glasses_2 = 0,
        watches_1 = -1,
        watches_2 = 0,
        bracelets_1 = -1,
        bracelets_2 = 0,
        bags_1 = 0,
        bags_2 = 0,
        eye_color = 0,
        eye_squint = 0,
        eyebrows_2 = 0,
        eyebrows_1 = 0,
        eyebrows_3 = 0,
        eyebrows_4 = 0,
        eyebrows_5 = 0,
        eyebrows_6 = 0,
        makeup_1 = 0,
        makeup_2 = 0,
        makeup_3 = 0,
        makeup_4 = 0,
        lipstick_1 = 0,
        lipstick_2 = 0,
        lipstick_3 = 0,
        lipstick_4 = 0,
        ears_1 = -1,
        ears_2 = 0,
        chest_1 = 0,
        chest_2 = 0,
        chest_3 = 0,
        bodyb_1 = -1,
        bodyb_2 = 0,
        bodyb_3 = -1,
        bodyb_4 = 0,
        age_1 = 0,
        age_2 = 0,
        blemishes_1 = 0,
        blemishes_2 = 0,
        blush_1 = 0,
        blush_2 = 0,
        blush_3 = 0,
        complexion_1 = 0,
        complexion_2 = 0,
        sun_1 = 0,
        sun_2 = 0,
        moles_1 = 0,
        moles_2 = 0,
        beard_1 = 11,
        beard_2 = 10,
        beard_3 = 0,
        beard_4 = 0
    },
    ["f"] = {
        mom = 28,
        dad = 6,
        face_md_weight = 63,
        skin_md_weight = 60,
        nose_1 = -10,
        nose_2 = 4,
        nose_3 = 5,
        nose_4 = 0,
        nose_5 = 0,
        nose_6 = 0,
        cheeks_1 = 0,
        cheeks_2 = 0,
        cheeks_3 = 0,
        lip_thickness = 0,
        jaw_1 = 0,
        jaw_2 = 0,
        chin_1 = -10,
        chin_2 = 10,
        chin_13 = -10,
        chin_4 = 0,
        neck_thickness = -5,
        hair_1 = 43,
        hair_2 = 0,
        hair_color_1 = 29,
        hair_color_2 = 35,
        tshirt_1 = 111,
        tshirt_2 = 5,
        torso_1 = 25,
        torso_2 = 2,
        decals_1 = 0,
        decals_2 = 0,
        arms = 3,
        arms_2 = 0,
        pants_1 = 12,
        pants_2 = 2,
        shoes_1 = 20,
        shoes_2 = 10,
        mask_1 = 0,
        mask_2 = 0,
        bproof_1 = 0,
        bproof_2 = 0,
        chain_1 = 85,
        chain_2 = 0,
        helmet_1 = -1,
        helmet_2 = 0,
        glasses_1 = 33,
        glasses_2 = 12,
        watches_1 = -1,
        watches_2 = 0,
        bracelets_1 = -1,
        bracelets_2 = 0,
        bags_1 = 0,
        bags_2 = 0,
        eye_color = 8,
        eye_squint = -6,
        eyebrows_2 = 7,
        eyebrows_1 = 32,
        eyebrows_3 = 52,
        eyebrows_4 = 9,
        eyebrows_5 = -5,
        eyebrows_6 = -8,
        makeup_1 = 0,
        makeup_2 = 0,
        makeup_3 = 0,
        makeup_4 = 0,
        lipstick_1 = 0,
        lipstick_2 = 0,
        lipstick_3 = 0,
        lipstick_4 = 0,
        ears_1 = -1,
        ears_2 = 0,
        chest_1 = 0,
        chest_2 = 0,
        chest_3 = 0,
        bodyb_1 = -1,
        bodyb_2 = 0,
        bodyb_3 = -1,
        bodyb_4 = 0,
        age_1 = 0,
        age_2 = 0,
        blemishes_1 = 0,
        blemishes_2 = 0,
        blush_1 = 0,
        blush_2 = 0,
        blush_3 = 0,
        complexion_1 = 0,
        complexion_2 = 0,
        sun_1 = 0,
        sun_2 = 0,
        moles_1 = 12,
        moles_2 = 8,
        beard_1 = 0,
        beard_2 = 0,
        beard_3 = 0,
        beard_4 = 0
    }
}
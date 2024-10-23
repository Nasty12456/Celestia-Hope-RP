-- machine properties for each hash, for both server & client
machineHashes = {-1932041857, -1519644200, -430989390, 654385216, 161343630, 1096374064, 207578973, -487222358,
                 -271916471, -1885297978, -1072855969, 1031635129, 681595944, -1313086203, -731399252}
machineReelsRotations = {0.0, 23.0, 67.7, 90.5, 113.15, 135.37, 157.6, 0}
machineModels = {}
machineModels[-1932041857] = {
    name = "Angel Knight",
    bannerDict = "CasinoUI_Slots_Angel",
    model = "vw_prop_casino_slot_01a",
    display = "machine_01a",
    reels = "vw_prop_casino_slot_01a_reels",
    reelsBlurry = "vw_prop_casino_slot_01b_reels",
    sounds = "dlc_vw_casino_slot_machine_ak_player_sounds",
    announcer = "CAPA_ANAB",
    messageId = 1,
    maxBet = 500,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 25000,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 5000,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 7500,
        ShowUpReducer = 70
    }, {
        name = "Star", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 500,
        ShowUpReducer = 80
    }, {
        name = "Piano", -- fifth item of each machine is the jackpot one
        value = 100000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 2500,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 10000,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[-1519644200] = {
    name = "Impotent Rage",
    bannerDict = "CasinoUI_Slots_Impotent",
    model = "vw_prop_casino_slot_02a",
    display = "machine_02a",
    reels = "vw_prop_casino_slot_02a_reels",
    reelsBlurry = "vw_prop_casino_slot_02b_reels",
    sounds = "dlc_vw_casino_slot_machine_ir_player_sounds",
    announcer = "CAPA_AOAB",
    messageId = 2,
    maxBet = 125,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 6250,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 1250,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 1875,
        ShowUpReducer = 70
    }, {
        name = "Flash", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 125,
        ShowUpReducer = 80
    }, {
        name = "Face", -- fifth item of each machine is the jackpot one
        value = 25000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 625,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 2500,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[-430989390] = {
    name = "Space Rangers",
    bannerDict = "CasinoUI_Slots_Ranger",
    model = "vw_prop_casino_slot_03a",
    display = "machine_03a",
    reels = "vw_prop_casino_slot_03a_reels",
    reelsBlurry = "vw_prop_casino_slot_03b_reels",
    sounds = "dlc_vw_casino_slot_machine_rsr_player_sounds",
    announcer = "CAPA_APAB",
    messageId = 3,
    maxBet = 125,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 6250,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 1250,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 1675,
        ShowUpReducer = 70
    }, {
        name = "Bottle", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 125,
        ShowUpReducer = 80
    }, {
        name = "Medal", -- fifth item of each machine is the jackpot one
        value = 25000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 625,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 2500,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[654385216] = {
    name = "Fame or Shame",
    bannerDict = "CasinoUI_Slots_Fame",
    model = "vw_prop_casino_slot_04a",
    display = "machine_04a",
    reels = "vw_prop_casino_slot_04a_reels",
    reelsBlurry = "vw_prop_casino_slot_04b_reels",
    sounds = "dlc_vw_casino_slot_machine_fs_player_sounds",
    announcer = "CAPA_AQAB",
    messageId = 4,
    maxBet = 25,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 1250,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 250,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 375,
        ShowUpReducer = 70
    }, {
        name = "Microphone", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 25,
        ShowUpReducer = 80
    }, {
        name = "Text", -- fifth item of each machine is the jackpot one
        value = 5000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 125,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 500,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[161343630] = {
    name = "Deity of the Sun",
    bannerDict = "CasinoUI_Slots_Deity",
    model = "vw_prop_casino_slot_05a",
    display = "machine_05a",
    reels = "vw_prop_casino_slot_05a_reels",
    reelsBlurry = "vw_prop_casino_slot_05b_reels",
    sounds = "dlc_vw_casino_slot_machine_ds_player_sounds",
    announcer = "CAPA_AMAB",
    messageId = 5,
    maxBet = 2500,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 125000,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 25000,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 37500,
        ShowUpReducer = 70
    }, {
        name = "Anhk", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 2500,
        ShowUpReducer = 80
    }, {
        name = "Pharoh", -- fifth item of each machine is the jackpot one
        value = 500000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 12500,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 50000,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0 -- set to 0 for she same chance to hit (-)
    }}
}
machineModels[1096374064] = {
    name = "Twilight Knife",
    bannerDict = "CasinoUI_Slots_Knife",
    model = "vw_prop_casino_slot_06a",
    display = "machine_06a",
    reels = "vw_prop_casino_slot_06a_reels",
    reelsBlurry = "vw_prop_casino_slot_06b_reels",
    sounds = "dlc_vw_casino_slot_machine_kd_player_sounds",
    announcer = "CAPA_ARAB",
    messageId = 6,
    maxBet = 500,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 25000,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 5000,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 7500,
        ShowUpReducer = 70
    }, {
        name = "Knife", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 500,
        ShowUpReducer = 80
    }, {
        name = "Saw", -- fifth item of each machine is the jackpot one
        value = 100000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 2500,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 10000,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[207578973] = {
    name = "Diamond Miner",
    bannerDict = "CasinoUI_Slots_Diamond",
    model = "vw_prop_casino_slot_07a",
    display = "machine_07a",
    reels = "vw_prop_casino_slot_07a_reels",
    reelsBlurry = "vw_prop_casino_slot_07b_reels",
    sounds = "dlc_vw_casino_slot_machine_td_player_sounds",
    announcer = "CAPA_ALAB",
    messageId = 7,
    maxBet = 2500,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 125000,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 25000,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 37500,
        ShowUpReducer = 70
    }, {
        name = "Diamond", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 2500,
        ShowUpReducer = 80
    }, {
        name = "Diamonds", -- fifth item of each machine is the jackpot one
        value = 500000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 12500,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 50000,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}
machineModels[-487222358] = {
    name = "Evacuator",
    bannerDict = "CasinoUI_Slots_Evacuator",
    model = "vw_prop_casino_slot_08a",
    display = "machine_08a",
    reels = "vw_prop_casino_slot_08a_reels",
    reelsBlurry = "vw_prop_casino_slot_08b_reels",
    sounds = "dlc_vw_casino_slot_machine_hz_player_sounds",
    announcer = "CAPA_ASAB",
    messageId = 8,
    maxBet = 25,
    jackpotLimiter = 100, -- jackpot can be hit max. once per 100 spins
    unluckyFactor = 5, -- each 5th spin will hit 0 chips no matter what, set unluckyFactor = 2 for each second spin, set to 0 to disable
    items = {{
        name = "Seven",
        value = 1250,
        ShowUpReducer = 70 -- Seven will have 100% (same) chance to hit for first time, then (-70%), 30% chance to hit second time, then (-70%), 9% chance to hit third time
    }, {
        name = "Plum",
        value = 250,
        ShowUpReducer = 70
    }, {
        name = "Melon",
        value = 375,
        ShowUpReducer = 70
    }, {
        name = "Soldier", -- fourth item of each machine is the first one on the scores display (the one thats enough if you hit once to get some chips)
        value = 25,
        ShowUpReducer = 80
    }, {
        name = "Rocket", -- fifth item of each machine is the jackpot one
        value = 5000,
        ShowUpReducer = 80
    }, {
        name = "Cherry",
        value = 125,
        ShowUpReducer = 70
    }, {
        name = "Bell",
        value = 500,
        ShowUpReducer = 70
    }, {
        name = "-",
        value = 0,
        ShowUpReducer = 0
    }}
}

restrictedControls = {37, 157, 159, 160, 161, 162, 163, 164, 165, 158, 101, 337, 53, 54, 47, 140, 141, 263, 264, 142,
                      143, 24, 257, 44, 282, 283, 284, 285, 69, 70, 114, 99, 100, 102, 22, 74, 68, 25, 36, 345, 346,
                      347, 91, 92}



horsePresets = {{
    nameId = "A_TETHERED_END",
    colors = {15553363, 5474797, 9858144, 4671302},
    odds = 27
}, {
    nameId = "BAD_EGG",
    colors = {16724530, 3684408, 14807026, 16777215},
    odds = 29
}, {
    nameId = "BANANA_HAMMOCK",
    colors = {13560920, 15582764, 16770746, 7500402},
    odds = 16
}, {
    nameId = "BETTER_THAN_NOTHING",
    colors = {16558591, 5090807, 10446437, 7493977},
    odds = 15
}, {
    nameId = "BLACK_ROCK_ROOSTER",
    colors = {5090807, 16558591, 3815994, 9393493},
    odds = 18
}, {
    nameId = "BLEET_ME_BABY",
    colors = {16269415, 16767010, 10329501, 16777215},
    odds = 7
}, {
    nameId = "BLUE_DREAM",
    colors = {2263807, 16777215, 9086907, 3815994},
    odds = 2
}, {
    nameId = "BORROWED_SORROW",
    colors = {4879871, 16715535, 3815994, 16777215},
    odds = 12
}, {
    nameId = "BOUNCY_BLESSED",
    colors = {16777215, 2263807, 16769737, 15197642},
    odds = 5
}, {
    nameId = "CANCELLED_CHECK",
    colors = {16777215, 16559849, 5716493, 3815994},
    odds = 28
}, {
    nameId = "CANT_BE_WRONGER",
    colors = {16338779, 16777215, 11166563, 6974058},
    odds = 25
}, {
    nameId = "CLAPBACK_CHARLIE",
    colors = {16760644, 3387257, 16701597, 16777215},
    odds = 10
}, {
    nameId = "CONSTANT_BRAG",
    colors = {6538729, 2249420, 16777215, 3815994},
    odds = 3
}, {
    nameId = "COUNTRY_STUCK",
    colors = {15913534, 15913534, 16304787, 15985375},
    odds = 21
}, {
    nameId = "CRACKERS_AND_PLEASE",
    colors = {15655629, 16240452, 16760474, 13664854},
    odds = 3
}, {
    nameId = "CREEPY_DENTIST",
    colors = {16320263, 16777215, 14920312, 16773316},
    odds = 7
}, {
    nameId = "CROCK_JANLEY",
    colors = {7176404, 15138618, 6308658, 13664854},
    odds = 8
}, {
    nameId = "DANCIN_POLE",
    colors = {4879871, 8453903, 11382189, 15724527},
    odds = 9
}, {
    nameId = "DANCIN_SHOES",
    colors = {16777215, 16777215, 16754809, 16777215},
    odds = 5
}, {
    nameId = "DARLING_RICKI",
    colors = {16732497, 16732497, 3815994, 16777215},
    odds = 22
}, {
    nameId = "DEAD_FAM",
    colors = {5739220, 5739220, 11382189, 15724527},
    odds = 26
}, {
    nameId = "DEAD_HEAT_HATTIE",
    colors = {16712909, 6935639, 8742735, 3877137},
    odds = 17
}, {
    nameId = "DEXIE_RUNNER",
    colors = {2136867, 16777215, 16761488, 3877137},
    odds = 6
}, {
    nameId = "DIVORCED_DOCTOR",
    colors = {3118422, 10019244, 14932209, 6121086},
    odds = 7
}, {
    nameId = "DOOZY_FLOOZY",
    colors = {2136867, 10241979, 8081664, 3815994},
    odds = 13
}, {
    nameId = "DOWNTOWN_RENOWN",
    colors = {16769271, 13724403, 9852728, 14138263},
    odds = 4
}, {
    nameId = "DR_DEEZ_REINS",
    colors = {13724403, 16769271, 6444881, 14138263},
    odds = 5
}, {
    nameId = "DREAM_SHATTERER",
    colors = {10017279, 4291288, 16304787, 15985375},
    odds = 1
}, {
    nameId = "DRONE_WARNING",
    colors = {1071491, 4315247, 14935011, 6121086},
    odds = 8
}, {
    nameId = "DRUNKEN_BRANDEE",
    colors = {3861944, 16627705, 14932209, 6121086},
    odds = 14
}, {
    nameId = "DURBAN_POISON",
    colors = {15583546, 4671303, 11836798, 3090459},
    odds = 20
}, {
    nameId = "FEED_THE_TROLLS",
    colors = {15567418, 4671303, 9985296, 3815994},
    odds = 30
}, {
    nameId = "FIRE_HAZARDS",
    colors = {5701417, 16711680, 16771760, 6970713},
    odds = 24
}, {
    nameId = "FLIPPED_WIG",
    colors = {16760303, 5986951, 12353664, 15395562},
    odds = 12
}, {
    nameId = "FRIENDLY_FIRE",
    colors = {8907670, 2709022, 9475214, 4278081},
    odds = 9
}, {
    nameId = "GETTING_HAUGHTY",
    colors = {5429688, 6400829, 16777215, 16773316},
    odds = 3
}, {
    nameId = "GHOST_DANK",
    colors = {15138618, 5272210, 14920312, 16773316},
    odds = 10
}, {
    nameId = "GLASS_OR_TINA",
    colors = {10241979, 12396337, 14920312, 15395562},
    odds = 23
}, {
    nameId = "LOS_SANTOS_SAVIOR",
    colors = {16777215, 13481261, 13667152, 3815994},
    odds = 5
}, {
    nameId = "HARD_TIME_DONE",
    colors = {5077874, 16777215, 15444592, 7820105},
    odds = 18
}, {
    nameId = "HELL_FOR_WEATHER",
    colors = {10408040, 2960685, 7424036, 10129549},
    odds = 2
}, {
    nameId = "HENNIGANS_STEED",
    colors = {7754308, 16777215, 12944259, 3815994},
    odds = 4
}, {
    nameId = "HIPPIE_CRACK",
    colors = {16736955, 16106560, 16771760, 6970713},
    odds = 23
}, {
    nameId = "HOT_AND_BOTHERED",
    colors = {16106560, 16770224, 16767659, 15843765},
    odds = 2
}, {
    nameId = "INVADE_GRENADE",
    colors = {9573241, 14703194, 9789279, 3815994},
    odds = 13
}, {
    nameId = "ITS_A_TRAP",
    colors = {44799, 14703194, 10968156, 16777215},
    odds = 1
}, {
    nameId = "KRAFF_RUNNING",
    colors = {7143224, 16753956, 10975076, 4210752},
    odds = 14
}, {
    nameId = "LEAD_IS_OUT",
    colors = {7895160, 4013373, 5855577, 11645361},
    odds = 3
}, {
    nameId = "LIT_AS_TRUCK",
    colors = {16075595, 6869196, 13530742, 7105644},
    odds = 1
}, {
    nameId = "LONELY_STEPBROTHER",
    colors = {16090955, 6272992, 16777215, 16777215},
    odds = 3
}, {
    nameId = "LOVERS_SPEED",
    colors = {13313356, 13313356, 5849409, 11623516},
    odds = 2
}, {
    nameId = "MEASLES_SMEEZLES",
    colors = {13911070, 5583427, 14935011, 6121086},
    odds = 15
}, {
    nameId = "MICRO_AGGRESSION",
    colors = {8604661, 10408040, 12944259, 3815994},
    odds = 8
}, {
    nameId = "MINIMUM_WAGER",
    colors = {9716612, 2960685, 16767659, 6708313},
    odds = 26
}, {
    nameId = "MISS_MARY_JOHN",
    colors = {7806040, 16777215, 16765601, 14144436},
    odds = 22
}, {
    nameId = "MISS_TRIGGERED",
    colors = {15632075, 11221989, 16777215, 16770037},
    odds = 19
}, {
    nameId = "MISTER_REDACTED",
    colors = {1936722, 14654697, 16763851, 3815994},
    odds = 19
}, {
    nameId = "MISTER_SCISSORS",
    colors = {10377543, 3815994, 14807026, 16777215},
    odds = 7
}, {
    nameId = "MONEY_TO_BURN",
    colors = {16775067, 11067903, 16770746, 7500402},
    odds = 30
}, {
    nameId = "MOON_ROCKS",
    colors = {16741712, 8669718, 16777215, 16777215},
    odds = 4
}, {
    nameId = "MR_WORTHWHILE",
    colors = {16515280, 6318459, 3815994, 9393493},
    odds = 2
}, {
    nameId = "MUD_DRAGON",
    colors = {65526, 16515280, 10329501, 16777215},
    odds = 5
}, {
    nameId = "NIGHTTIME_MARE",
    colors = {16711680, 4783925, 3815994, 3815994},
    odds = 16
}, {
    nameId = "NORTHERN_LIGHTS",
    colors = {65532, 4783925, 16766671, 15197642},
    odds = 15
}, {
    nameId = "NUNS_ORDERS",
    colors = {16760303, 16760303, 3815994, 14207663},
    odds = 9
}, {
    nameId = "OL_SKAG",
    colors = {16770048, 16770048, 3815994, 3815994},
    odds = 28
}, {
    nameId = "OLD_ILL_WILL",
    colors = {16737792, 16737792, 11166563, 6974058},
    odds = 29
}, {
    nameId = "OMENS_AND_ICE",
    colors = {12773119, 12773119, 5716493, 3815994},
    odds = 3
}, {
    nameId = "PEDESTRIAN",
    colors = {16777215, 16763043, 16701597, 16777215},
    odds = 25
}, {
    nameId = "PRETTY_AS_A_PISTOL",
    colors = {6587161, 6587161, 16777215, 3815994},
    odds = 4
}, {
    nameId = "QUESTIONABLE_DIGNITY",
    colors = {6329328, 16749602, 3815994, 3815994},
    odds = 12
}, {
    nameId = "REACH_AROUND_TOWN",
    colors = {15793920, 16519679, 14920312, 15395562},
    odds = 6
}, {
    nameId = "ROBOCALL",
    colors = {15466636, 10724259, 16760474, 13664854},
    odds = 4
}, {
    nameId = "SALT_N_SAUCE",
    colors = {11563263, 327629, 6308658, 13664854},
    odds = 1
}, {
    nameId = "SALTY_AND_WOKE",
    colors = {58867, 16777215, 16754809, 8082236},
    odds = 17
}, {
    nameId = "SCRAWNY_NAG",
    colors = {4909311, 16777215, 5849409, 11623516},
    odds = 30
}, {
    nameId = "SIR_SCRAMBLED",
    colors = {3700643, 7602233, 9852728, 14138263},
    odds = 26
}, {
    nameId = "SIZZURP",
    colors = {16777215, 1017599, 8742735, 3877137},
    odds = 13
}, {
    nameId = "SNATCHED_YOUR_MAMA",
    colors = {16772022, 16772022, 16761488, 3877137},
    odds = 1
}, {
    nameId = "SOCIAL_MEDIA_WARRIOR",
    colors = {7849983, 5067443, 8081664, 3815994},
    odds = 27
}, {
    nameId = "SQUARE_TO_GO",
    colors = {15913534, 7602233, 6444881, 14138263},
    odds = 6
}, {
    nameId = "STUDY_BUDDY",
    colors = {12320733, 16775618, 11836798, 3090459},
    odds = 15
}, {
    nameId = "STUPID_MONEY",
    colors = {15240846, 16777215, 9985296, 3815994},
    odds = 30
}, {
    nameId = "SUMPTIN_SAUCY",
    colors = {14967137, 3702939, 3815994, 14207663},
    odds = 1
}, {
    nameId = "SWEET_RELEAF",
    colors = {6343571, 3702939, 12353664, 15395562},
    odds = 4
}, {
    nameId = "TAX_THE_POOR",
    colors = {16761374, 15018024, 9475214, 4278081},
    odds = 13
}, {
    nameId = "TEA_ACHE_SEA",
    colors = {16743936, 3756172, 16777215, 16773316},
    odds = 24
}, {
    nameId = "TENPENNY",
    colors = {2899345, 5393472, 16777215, 4210752},
    odds = 10
}, {
    nameId = "THERE_SHE_BLOWS",
    colors = {11645361, 16777215, 16771542, 10123632},
    odds = 2
}, {
    nameId = "THROWING_SHADY",
    colors = {3421236, 5958825, 16771542, 3815994},
    odds = 21
}, {
    nameId = "THUNDER_SKUNK",
    colors = {15851871, 5395026, 15444592, 7820105},
    odds = 20
}, {
    nameId = "TOTAL_BELTER",
    colors = {16777215, 9463517, 7424036, 10129549},
    odds = 1
}, {
    nameId = "TURNT_MOOD",
    colors = {16760556, 16733184, 16767659, 15843765},
    odds = 12
}, {
    nameId = "UPTOWN_RIDER",
    colors = {4781311, 15771930, 16765601, 14144436},
    odds = 14
}, {
    nameId = "WAGE_OF_CONSENT",
    colors = {16760556, 10287103, 16767659, 6708313},
    odds = 21
}, {
    nameId = "WEE_SCUNNER",
    colors = {13083490, 16777215, 9789279, 3815994},
    odds = 8
}, {
    nameId = "WORTH_A_KINGDOM",
    colors = {13810226, 9115524, 5855577, 11645361},
    odds = 2
}, {
    nameId = "YAY_YO_LETS_GO",
    colors = {14176336, 9115524, 13530742, 7105644},
    odds = 3
}, {
    nameId = "YELLOW_SUNSHINE",
    colors = {16770310, 16751169, 16772294, 16777215},
    odds = 5
}}

LuckyWheelItems = {}
LuckyWheelItems["Drinks"] = {
    rotation = {0.0, 73.0, 145.0, 217.0},
    posibility = 100, -- from 1% to 100%
    soundName = "Win_RP",
    animName = "win"
}

LuckyWheelItems["Money1"] = {
    rotation = 343.0,
    posibility = 100,
    soundName = "Win_Cash",
    animName = "win",
    moneyReward = 1000
}

LuckyWheelItems["Money2"] = {
    rotation = 271.0,
    posibility = 90,
    soundName = "Win_Cash",
    animName = "win",
    moneyReward = 1500
}

LuckyWheelItems["Money3"] = {
    rotation = 199.0,
    posibility = 80,
    soundName = "Win_Cash",
    animName = "win",
    moneyReward = 2500
}

LuckyWheelItems["Money4"] = {
    rotation = 127.0,
    posibility = 70,
    soundName = "Win_Cash",
    animName = "win",
    moneyReward = 4000
}

LuckyWheelItems["Money5"] = {
    rotation = 55.0,
    posibility = 60,
    soundName = "Win_Cash",
    animName = "win",
    moneyReward = 6000
}

LuckyWheelItems["Money6"] = {
    rotation = 325.0,
    posibility = 50,
    soundName = "Win_Cash",
    animName = "win_big",
    moneyReward = 8000
}

LuckyWheelItems["Money7"] = {
    rotation = 253.0,
    posibility = 40,
    soundName = "Win_Cash",
    animName = "win_big",
    moneyReward = 10000
}

LuckyWheelItems["Money8"] = {
    rotation = 109.0,
    posibility = 30,
    soundName = "Win_Cash",
    animName = "win_big",
    moneyReward = 15000
}

LuckyWheelItems["Money9"] = {
    rotation = 19.0,
    posibility = 20,
    soundName = "Win_Cash",
    animName = "win_big",
    moneyReward = 18000
}

LuckyWheelItems["Chips1"] = {
    rotation = 307.0,
    posibility = 100,
    soundName = "Win_Chips",
    animName = "win",
    chipsReward = 100
}

LuckyWheelItems["Chips2"] = {
    rotation = 235.0,
    posibility = 90,
    soundName = "Win_Chips",
    animName = "win",
    chipsReward = 500
}

LuckyWheelItems["Chips3"] = {
    rotation = 181.0,
    posibility = 80,
    soundName = "Win_Chips",
    animName = "win",
    chipsReward = 1000
}

LuckyWheelItems["Chips4"] = {
    rotation = 91.0,
    posibility = 70,
    soundName = "Win_Chips",
    animName = "win_big",
    chipsReward = 13000
}

LuckyWheelItems["Vehicle"] = {
    rotation = 37.0,
    posibility = 10,
    soundName = "Win_Car",
    animName = "win_huge"
}

LuckyWheelItems["Nothing"] = {
    rotation = 289.0,
    posibility = 100,
    soundName = nil,
    animName = "Nothing"
}

LuckyWheelItems["Random"] = {
    rotation = 163.0,
    posibility = 100,
    soundName = "Win_Mystery",
    animName = "win_big"
}

-- Adding own items is not supported for now.
-- Titles and prices can be adjusted

CasinoInventoryItems = {{
    key = "casino_beer",
    title = "Pisswasser",
    itemType = 2,
    price = 5,
    consumable = 1
}, {
    key = "casino_vodka",
    title = "Vodka Shot",
    itemType = 2,
    price = 10,
    luckyWheelAffected = true
}, {
    key = "casino_mountshot",
    title = "The Mount Whiskey Shot",
    itemType = 2,
    price = 55,
    luckyWheelAffected = true
}, {
    key = "casino_richardshot",
    title = "Richard's Whiskey Shot",
    itemType = 2,
    price = 190,
    luckyWheelAffected = true
}, {
    key = "casino_macbethshot",
    title = "Macbeth Whiskey Shot",
    itemType = 2,
    price = 350,
    luckyWheelAffected = true
}, {
    key = "casino_silverchamp",
    title = "Blêuter'd Champagne Silver",
    itemType = 2,
    price = 30000,
    vip = true
}, {
    key = "casino_goldchamp",
    title = "Blêuter'd Champagne Gold",
    itemType = 2,
    price = 50000,
    vip = true
}, {
    key = "casino_diamondchamp",
    title = "Blêuter'd Champagne Diamond",
    itemType = 2,
    price = 150000,
    vip = true
}, {
    key = "casino_beer",
    title = "Pisswasser",
    itemType = 1,
    price = 5,
    consumable = 1
}, {
    key = "casino_burger",
    title = "Burger",
    itemType = 1,
    price = 5,
    consumable = 2
}, {
    key = "casino_coke",
    title = "Kofola",
    itemType = 1,
    price = 5,
    consumable = 1
}, {
    key = "casino_sprite",
    title = "Sprite",
    itemType = 1,
    price = 5,
    consumable = 1
}, {
    key = "casino_luckypotion",
    title = "Lucky Potion",
    itemType = 1,
    price = 50,
    consumable = 1
}, {
    key = "casino_psqs",
    title = "P’s & Q’s",
    itemType = 1,
    price = 3,
    consumable = 2
}, {
    key = "casino_ego_chaser",
    title = "Ego Chaser",
    itemType = 1,
    price = 3,
    consumable = 2
}, {
    key = "casino_sandwitch",
    title = "Sandwitch",
    itemType = 1,
    price = 5,
    consumable = 2
}, {
    key = "casino_donut",
    title = "Donut",
    itemType = 1,
    price = 3,
    consumable = 2
}, {
    key = "casino_coffee",
    title = "Coffee",
    itemType = 1,
    price = 10,
    consumable = 1
}}

-- these are inventory items that players can win after spinning "Random" on the Lucky Wheel.
LuckyWheelRandomItems = {{
    inventoryName = "casino_burger", -- item (inventory) name/key, case sensitive
    title = "Casino's Burger", -- title for the Lucky Wheel reward message
    amount = {1, 10}, -- amount (random between 1 to 10)
    possibility = 20
}, {
    inventoryName = "casino_coke", -- item (inventory) name/key, case sensitive
    title = "Casino's Kofola", -- title for the Lucky Wheel reward message
    amount = 1, -- only 1
    possibility = 80
}}

PokerTableDatas = {}
PokerTableDatas[0] = {
    Banner = "casinoui_cards_three",
    Title = "Poker",
    PlaceBetsTime = 40,
    MinBetValueAntePlay = 10,
    MaxBetValueAntePlay = 5000,
    MinBetValuePairPlus = 10,
    MaxBetValuePairPlus = 500,
    UnluckyRound = 3 -- each 3rd round will be unlucky (high possibility that players get useless cards)
}

PokerTableDatas[2] = {
    Banner = "casinoui_cards_three_junior",
    Title = "Poker Junior",
    PlaceBetsTime = 15,
    MinBetValueAntePlay = 10,
    MaxBetValueAntePlay = 200,
    MinBetValuePairPlus = 10,
    MaxBetValuePairPlus = 50,
    UnluckyRound = 5 -- each 3rd round will be unlucky (high possibility that players get useless cards)
}

PokerTableDatas[3] = {
    Banner = "casinoui_cards_three_high",
    Title = "Poker High Stakes",
    PlaceBetsTime = 40,
    MinBetValueAntePlay = 1000,
    MaxBetValueAntePlay = 50000,
    MinBetValuePairPlus = 1000,
    MaxBetValuePairPlus = 5000,
    VIP = true,
    UnluckyRound = 2 -- each 3rd round will be unlucky (high possibility that players get useless cards)
}

BlackJackCardScores = {11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 2, 3,
                       4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10}

function BlackjackGetScoreFromCards(cards)
    local indexes = {}
    for k, v in pairs(cards) do
        table.insert(indexes, v.value)
    end
    return BlackjackCalculatePlayerHandScore(indexes)
end

-- calculate score from indexes
function BlackjackCalculatePlayerHandScore(cards)
    local total = 0
    local softHand = false

    for _, v in pairs(cards) do
        local s = BlackJackCardScores[v]
        if s == 11 then
            s = 1
            softHand = true
        end
        total = total + s
    end

    -- back from Ace *1* to Ace *11* to help the player
    if softHand and (total + 10) <= 21 then
        total = total + 10
    end

    if total == 21 and #(cards) == 2 then
        total = "blackjack"
    end

    return total, softHand
end

BlackjackTableDatas = {}

BlackjackTableDatas[0] = {
    Banner = "casinoui_cards_blackjack",
    Title = "Blackjack",
    PlaceBetsTime = 40,
    MinimumBet = 10,
    MaximumBet = 10000,
    DealerBlackjackPossibility = 20, -- 25% chance that dealer gets blackjack
    Dealer21Possibility = 25 -- 25% chance that dealer gets 21
}

BlackjackTableDatas[3] = {
    Banner = "casinoui_cards_blackjack_high",
    Title = "Blackjack High Stakes",
    PlaceBetsTime = 40,
    MinimumBet = 1000,
    MaximumBet = 50000,
    VIP = true,
    DealerBlackjackPossibility = 25, -- 25% chance that dealer gets blackjack
    Dealer21Possibility = 30 -- 25% chance that dealer gets 21
}

BlackjackTableDatas[2] = {
    Banner = "casinoui_cards_blackjack_junior",
    Title = "Blackjack Junior",
    PlaceBetsTime = 15,
    MinimumBet = 2,
    MaximumBet = 100,
    DealerBlackjackPossibility = 20, -- 25% chance that dealer gets blackjack
    Dealer21Possibility = 15 -- 25% chance that dealer gets 21
}

RouletteAnimationNumbers = {38, 19, 34, 15, 30, 11, 26, 7, 22, 3, 25, 6, 37, 18, 33, 14, 29, 10, 8, 27, 12, 31, 16, 35,
                            4, 23, 2, 21, 5, 24, 9, 28, 13, 32, 17, 36, 1, 20}

RouletteTableDatas = {}

RouletteTableDatas[0] = {
    Banner = "casinoui_roulette",
    Title = "Roulette",
    MaxBets = 10,
    MinBetValue = 10,
    MaxBetValue = 500,
    MaxBetValueOutside = 5000,
    MaxBetValueInside = 500,
    PlaceBetsTime = 40,
    SpinDelayMin = 5,
    SpinDelayMax = 12,
    UnluckyRound = 4, -- each 4th round spins to the unluckiest number and costs casino the least
    TriggerUnluckyRoundFrom = 500 -- always switch to unluckiest number if the spun number costs casino more than this
}

RouletteTableDatas[2] = {
    Banner = "casinoui_roulette_junior",
    Title = "Roulette Junior",
    MaxBets = 10,
    MinBetValue = 1,
    MaxBetValue = 1000,
    MaxBetValueOutside = 1000,
    MaxBetValueInside = 200,
    PlaceBetsTime = 15,
    SpinDelayMin = 1,
    SpinDelayMax = 1,
    UnluckyRound = 6, -- each 6th round spins to the unluckiest number and costs casino the least
    TriggerUnluckyRoundFrom = 2500 -- always switch to unluckiest number if the spun number costs casino more than this
}

RouletteTableDatas[3] = {
    Banner = "casinoui_roulette_high",
    Title = "Roulette High Stakes",
    MaxBets = 10,
    MinBetValue = 100,
    MaxBetValue = 5000,
    MaxBetValueOutside = 50000,
    MaxBetValueInside = 5000,
    PlaceBetsTime = 40,
    SpinDelayMin = 5,
    SpinDelayMax = 12,
    VIP = true,
    UnluckyRound = 3, -- each 3rd round spins to the unluckiest number and costs casino the least
    TriggerUnluckyRoundFrom = 25000 -- always switch to unluckiest number if the spun number costs casino more than this
}

RouletteMaleVoices = {"S_M_Y_Casino_01_WHITE_01", "S_M_Y_Casino_01_WHITE_02", "S_M_Y_Casino_01_ASIAN_01",
                      "S_M_Y_Casino_01_ASIAN_02"}
RouletteFemaleVoices = {"S_F_Y_Casino_01_ASIAN_01", "S_F_Y_Casino_01_ASIAN_02", "S_F_Y_Casino_01_LATINA_01",
                        "S_F_Y_Casino_01_LATINA_02"}

-- Poker
PokerLetterIndex = {"a", "b", "c"}

PokerCardModels = {
    [1] = 'vw_prop_vw_club_char_a_a',
    [2] = 'vw_prop_vw_club_char_02a',
    [3] = 'vw_prop_vw_club_char_03a',
    [4] = 'vw_prop_vw_club_char_04a',
    [5] = 'vw_prop_vw_club_char_05a',
    [6] = 'vw_prop_vw_club_char_06a',
    [7] = 'vw_prop_vw_club_char_07a',
    [8] = 'vw_prop_vw_club_char_08a',
    [9] = 'vw_prop_vw_club_char_09a',
    [10] = 'vw_prop_vw_club_char_10a',
    [11] = 'vw_prop_vw_club_char_j_a',
    [12] = 'vw_prop_vw_club_char_q_a',
    [13] = 'vw_prop_vw_club_char_k_a',
    [14] = 'vw_prop_vw_dia_char_a_a',
    [15] = 'vw_prop_vw_dia_char_02a',
    [16] = 'vw_prop_vw_dia_char_03a',
    [17] = 'vw_prop_vw_dia_char_04a',
    [18] = 'vw_prop_vw_dia_char_05a',
    [19] = 'vw_prop_vw_dia_char_06a',
    [20] = 'vw_prop_vw_dia_char_07a',
    [21] = 'vw_prop_vw_dia_char_08a',
    [22] = 'vw_prop_vw_dia_char_09a',
    [23] = 'vw_prop_vw_dia_char_10a',
    [24] = 'vw_prop_vw_dia_char_j_a',
    [25] = 'vw_prop_vw_dia_char_q_a',
    [26] = 'vw_prop_vw_dia_char_k_a',
    [27] = 'vw_prop_vw_hrt_char_a_a',
    [28] = 'vw_prop_vw_hrt_char_02a',
    [29] = 'vw_prop_vw_hrt_char_03a',
    [30] = 'vw_prop_vw_hrt_char_04a',
    [31] = 'vw_prop_vw_hrt_char_05a',
    [32] = 'vw_prop_vw_hrt_char_06a',
    [33] = 'vw_prop_vw_hrt_char_07a',
    [34] = 'vw_prop_vw_hrt_char_08a',
    [35] = 'vw_prop_vw_hrt_char_09a',
    [36] = 'vw_prop_vw_hrt_char_10a',
    [37] = 'vw_prop_vw_hrt_char_j_a',
    [38] = 'vw_prop_vw_hrt_char_q_a',
    [39] = 'vw_prop_vw_hrt_char_k_a',
    [40] = 'vw_prop_vw_spd_char_a_a',
    [41] = 'vw_prop_vw_spd_char_02a',
    [42] = 'vw_prop_vw_spd_char_03a',
    [43] = 'vw_prop_vw_spd_char_04a',
    [44] = 'vw_prop_vw_spd_char_05a',
    [45] = 'vw_prop_vw_spd_char_06a',
    [46] = 'vw_prop_vw_spd_char_07a',
    [47] = 'vw_prop_vw_spd_char_08a',
    [48] = 'vw_prop_vw_spd_char_09a',
    [49] = 'vw_prop_vw_spd_char_10a',
    [50] = 'vw_prop_vw_spd_char_j_a',
    [51] = 'vw_prop_vw_spd_char_q_a',
    [52] = 'vw_prop_vw_spd_char_k_a'
}

function GetPlayingCardType(index)
    if index >= 1 and index <= 13 then -- CLUBS
        return 0
    elseif index >= 14 and index <= 26 then -- DIAMOND
        return 1
    elseif index >= 26 and index <= 39 then -- HEARTS
        return 2
    elseif index >= 39 and index <= 52 then -- SPADES
        return 3
    end
end

function PokerGetPairMultiplier(handValue)
    if handValue > 500 then
        return 40
    elseif handValue > 400 then
        return 30
    elseif handValue > 300 then
        return 6
    elseif handValue > 200 then
        return 4
    elseif handValue > 100 then
        return 1
    end

    return 0
end

function PokerGetAnteMultiplier(handValue)
    if handValue > 500 then
        return 5
    elseif handValue > 400 then
        return 4
    elseif handValue > 300 then
        return 1
    end
    return 0
end

function PokerGetChipModel(amount)
    if amount <= 10 then
        return GetHashKey('vw_prop_chip_10dollar_x1'), 0
    elseif amount > 10 and amount < 50 then
        return GetHashKey('vw_prop_chip_10dollar_st'), 10
    elseif amount >= 50 and amount < 100 then
        return GetHashKey('vw_prop_chip_50dollar_x1'), 0
    elseif amount >= 100 and amount < 200 then
        return GetHashKey('vw_prop_chip_100dollar_x1'), 0
    elseif amount >= 200 and amount < 500 then
        return GetHashKey('vw_prop_chip_100dollar_st'), 100
    elseif amount == 500 then
        return GetHashKey('vw_prop_chip_500dollar_x1'), 0
    elseif amount > 500 and amount < 1000 then
        return GetHashKey('vw_prop_chip_500dollar_st'), 500
    elseif amount == 1000 then
        return GetHashKey('vw_prop_chip_1kdollar_x1'), 0
    elseif amount > 1000 and amount < 5000 then
        return GetHashKey('vw_prop_chip_1kdollar_st'), 1000
    elseif amount == 5000 then
        return GetHashKey('vw_prop_plaq_5kdollar_x1'), 0
    elseif amount > 5000 and amount < 10000 then
        return GetHashKey('vw_prop_plaq_5kdollar_st'), 5000
    elseif amount == 10000 then
        return GetHashKey('vw_prop_plaq_10kdollar_x1'), 0
    elseif amount > 10000 then
        return GetHashKey('vw_prop_plaq_10kdollar_st'), 10000
    end
end

function GetPlayingCardValue(index)
    local vals = {
        -- 2
        [2] = 2,
        [15] = 2,
        [28] = 2,
        [41] = 2,
        -- 3
        [3] = 3,
        [16] = 3,
        [29] = 3,
        [42] = 3,
        -- 4
        [4] = 4,
        [17] = 4,
        [30] = 4,
        [43] = 4,
        -- 5
        [5] = 5,
        [18] = 5,
        [31] = 5,
        [44] = 5,
        -- 6
        [6] = 6,
        [19] = 6,
        [32] = 6,
        [45] = 6,
        -- 7
        [7] = 7,
        [20] = 7,
        [33] = 7,
        [46] = 7,
        -- 8
        [8] = 8,
        [21] = 8,
        [34] = 8,
        [47] = 8,
        -- 9
        [9] = 9,
        [22] = 9,
        [35] = 9,
        [48] = 9,
        -- 10
        [10] = 10,
        [23] = 10,
        [36] = 10,
        [49] = 10,
        -- JACK
        [11] = 11,
        [24] = 11,
        [37] = 11,
        [50] = 11,
        -- QUEEN
        [12] = 12,
        [25] = 12,
        [38] = 12,
        [51] = 12,
        -- KING
        [13] = 13,
        [26] = 13,
        [39] = 13,
        [52] = 13,
        -- ACE
        [1] = 14,
        [14] = 14,
        [27] = 14,
        [40] = 14
    }

    if vals[index] then
        return vals[index]
    else
        return 0
    end
end

PokerGetAllHandValues = function(handTable, bool_1, bool_2)
    if type(handTable) == 'table' then
        local c1, c2, c3 = GetPlayingCardValue(handTable[1]), GetPlayingCardValue(handTable[2]),
            GetPlayingCardValue(handTable[3])

        local handValue = 0

        -- FIRST CHECK
        if (c1 ~= c2 and c1 ~= c3) and c2 ~= c3 then
            local Flush = false

            handValue = c1 + c2 + c3

            if handValue == 19 then
                if (c1 == 14 or c1 == 2 or c1 == 3) and (c2 == 14 or c2 == 2 or c2 == 3) and
                    (c3 == 14 or c3 == 2 or c3 == 3) then
                    Flush = true
                end
            elseif handValue == 9 then
                if (c1 == 2 or c1 == 3 or c1 == 4) and (c2 == 2 or c2 == 3 or c2 == 4) and
                    (c3 == 2 or c3 == 3 or c3 == 4) then
                    Flush = true
                end
            elseif handValue == 12 then
                if (c1 == 3 or c1 == 4 or c1 == 5) and (c2 == 3 or c2 == 4 or c2 == 5) and
                    (c3 == 3 or c3 == 4 or c3 == 5) then
                    Flush = true
                end
            elseif handValue == 15 then
                if (c1 == 4 or c1 == 5 or c1 == 6) and (c2 == 4 or c2 == 5 or c2 == 6) and
                    (c3 == 4 or c3 == 5 or c3 == 6) then
                    Flush = true
                end
            elseif handValue == 18 then
                if (c1 == 5 or c1 == 6 or c1 == 7) and (c2 == 5 or c2 == 6 or c2 == 7) and
                    (c3 == 5 or c3 == 6 or c3 == 7) then
                    Flush = true
                end
            elseif handValue == 21 then
                if (c1 == 6 or c1 == 7 or c1 == 8) and (c2 == 6 or c2 == 7 or c2 == 8) and
                    (c3 == 6 or c3 == 7 or c3 == 8) then
                    Flush = true
                end
            elseif handValue == 24 then
                if (c1 == 7 or c1 == 8 or c1 == 9) and (c2 == 7 or c2 == 8 or c2 == 9) and
                    (c3 == 7 or c3 == 8 or c3 == 9) then
                    Flush = true
                end
            elseif handValue == 27 then
                if (c1 == 8 or c1 == 9 or c1 == 10) and (c2 == 8 or c2 == 9 or c2 == 10) and
                    (c3 == 8 or c3 == 9 or c3 == 10) then
                    Flush = true
                end
            elseif handValue == 30 then
                if (c1 == 9 or c1 == 10 or c1 == 11) and (c2 == 9 or c2 == 10 or c2 == 11) and
                    (c3 == 9 or c3 == 10 or c3 == 11) then
                    Flush = true
                end
            elseif handValue == 33 then
                if (c1 == 10 or c1 == 11 or c1 == 12) and (c2 == 10 or c2 == 11 or c2 == 12) and
                    (c3 == 10 or c3 == 11 or c3 == 12) then
                    Flush = true
                end
            elseif handValue == 36 then
                if (c1 == 11 or c1 == 12 or c1 == 13) and (c2 == 11 or c2 == 12 or c2 == 13) and
                    (c3 == 11 or c3 == 12 or c3 == 13) then
                    -- something true
                    Flush = true
                end
            elseif handValue == 39 then
                if (c1 == 12 or c1 == 13 or c1 == 14) and (c2 == 12 or c2 == 13 or c2 == 14) and
                    (c3 == 12 or c3 == 13 or c3 == 14) then
                    -- something true
                    Flush = true
                end
            end

            if Flush then
                if handValue == 19 then
                    handValue = 6
                end

                if GetPlayingCardType(handTable[1]) == GetPlayingCardType(handTable[2]) and
                    GetPlayingCardType(handTable[1]) == GetPlayingCardType(handTable[3]) then
                    return handValue + 500
                end

                return handValue + 300
            end
        end

        handValue = 0

        -- SECOND CHECK
        if (c1 == c2) and c1 ~= c3 then -- pairs
            if not bool_1 and not bool_2 then
                return (c1 + c2) + 100
            else
                return c3
            end
        elseif (c2 == c3) and c2 ~= c1 then -- pairs
            if not bool_1 and not bool_2 then
                return (c2 + c3) + 100
            else
                return c1
            end
        elseif (c3 == c1) and c3 ~= c2 then -- pairs
            if not bool_1 and not bool_2 then
                return (c1 + c3) + 100
            else
                return c2
            end
        elseif c1 == c2 and c1 == c3 then -- 3 of a kind
            return c1 + c2 + c3 + 400
        elseif GetPlayingCardType(handTable[1]) == GetPlayingCardType(handTable[2]) and GetPlayingCardType(handTable[1]) ==
            GetPlayingCardType(handTable[3]) then
            handValue = 200
        end

        -- third check if it runs here

        if c1 > c2 and c1 > c3 then
            if bool_1 then
                if c2 > c3 then
                    return handValue + c2
                else
                    return handValue + c3
                end
            elseif bool_2 then
                if c2 > c3 then
                    return handValue + c3
                else
                    return handValue + c2
                end
            end

            return handValue + c1
        elseif c2 > c1 and c2 > c3 then
            if bool_1 then
                if c1 > c3 then
                    return handValue + c1
                else
                    return handValue + c3
                end
            elseif bool_2 then
                if c1 > c3 then
                    return handValue + c3
                else
                    return handValue + c1
                end
            end

            return handValue + c2
        elseif c3 > c1 and c3 > c2 then
            if bool_1 then
                if c1 > c2 then
                    return handValue + c1
                else
                    return handValue + c2
                end
            elseif bool_2 then
                if c1 > c2 then
                    return handValue + c2
                else
                    return handValue + c1
                end
            end

            return handValue + c3
        end

        return handValue
    else
        return 0
    end
end

PokerHandValueCode = function(handValue)
    if handValue > 500 then
        return "STRAIGHT_FLUSH"
    elseif handValue > 400 then
        return "THREE_OF_A_KIND"
    elseif handValue > 300 then
        return "STRAIGHT"
    elseif handValue > 200 then
        return "FLUSH"
    elseif handValue > 100 then
        if handValue == 128 then
            return "PAIR_OF_ACES"
        elseif handValue == 104 then
            return "PAIR_OF_2"
        elseif handValue == 106 then
            return "PAIR_OF_3"
        elseif handValue == 108 then
            return "PAIR_OF_4"
        elseif handValue == 110 then
            return "PAIR_OF_5"
        elseif handValue == 112 then
            return "PAIR_OF_6"
        elseif handValue == 114 then
            return "PAIR_OF_7"
        elseif handValue == 116 then
            return "PAIR_OF_8"
        elseif handValue == 118 then
            return "PAIR_OF_9"
        elseif handValue == 120 then
            return "PAIR_OF_10"
        elseif handValue == 122 then
            return "PAIR_OF_JACKS"
        elseif handValue == 124 then
            return "PAIR_OF_QUEENS"
        elseif handValue == 126 then
            return "PAIR_OF_KINGS"
        end
    elseif handValue == 2 then
        return "CARD_2_HIGH"
    elseif handValue == 3 then
        return "CARD_3_HIGH"
    elseif handValue == 4 then
        return "CARD_4_HIGH"
    elseif handValue == 5 then
        return "CARD_5_HIGH"
    elseif handValue == 6 then
        return "CARD_6_HIGH"
    elseif handValue == 7 then
        return "CARD_7_HIGH"
    elseif handValue == 8 then
        return "CARD_8_HIGH"
    elseif handValue == 9 then
        return "CARD_9_HIGH"
    elseif handValue == 10 then
        return "CARD_10_HIGH"
    elseif handValue == 11 then
        return "CARD_JACK_HIGH"
    elseif handValue == 12 then
        return "CARD_QUEEN_HIGH"
    elseif handValue == 13 then
        return "CARD_KING_HIGH"
    else
        return "CARD_ACE_HIGH"
    end

    return ''
end

AMBIENT_TABLES_PED_SKINS = {"a_f_m_bevhills_01", "a_m_m_bevhills_01", "a_m_m_fatlatin_01", "a_f_y_beach_01",
                            "a_f_y_fitness_01", "a_f_y_smartcaspat_01", "a_m_m_mexlabor_01", "a_m_m_tennis_01",
                            "a_m_y_beachvesp_01", "a_f_y_vinewood_04", "a_f_y_hipster_02", "a_f_y_hippie_01",
                            "a_f_y_eastsa_01", "a_f_o_soucent_01", "a_f_m_tramp_01"}
CasinoBlips = {}
MissionBlips = {}
CASINO_IPLS = {"hei_dlc_windows_casino", "hei_dlc_casino_aircon", "vw_dlc_casino_door", "hei_dlc_casino_door"}

Society = {
    AutoChoose = 0,
    QbBanking = 1,
    QbBossMenu = 2,
    QbManagement = 3,
    RenewedBanking = 4,
    OkokBanking = 5,
    Management710 = 6,
    FdBanking = 7,
    EsxAddonAccount = 8,
    SnipeBanking = 9,
}

Inventory = {
    AutoChoose = 0,
    OX = 1,
    LJ = 2,
    MF = 3,
    PS = 4,
    QS = 5,
    Framework = 6,
}

SocietyResourceName = {
    [Society.QbBanking] = "qb-banking",
    [Society.QbBossMenu] = "qb-bossmenu",
    [Society.QbManagement] = "qb-management",
    [Society.RenewedBanking] = "Renewed-Banking",
    [Society.OkokBanking] = "okokBanking",
    [Society.Management710] = "710-Management",
    [Society.FdBanking] = "fd-banking",
    [Society.EsxAddonAccount] = "esx_addonaccount",
    [Society.SnipeBanking] = "snipe-banking",
}

InventoryResourceName = {
    [Inventory.OX] = "ox_inventory",
    [Inventory.LJ] = "lj_inventory",
    [Inventory.MF] = "mf_inventory",
    [Inventory.PS] = "ps_inventory",
    [Inventory.QS] = "qs-inventory",
    [Inventory.Framework] = "framework",
}

function IsResourceStarted(resourceName)
    local s = GetResourceState(resourceName)
    return s == "started" or s == "starting"
end

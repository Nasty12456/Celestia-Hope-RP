--[[	
		    Advanced Parkour/Freerunning
					By Bodhix

				  Configurations...
--]]

-- Check Controls References here: https://docs.fivem.net/docs/game-references/controls/#c
-- Support & Feedback: https://discord.gg/PjN7AWqkpF

--IMPORTANT
--I HIGHLY Recommend STAY with Default  Keys / Controls, SPECIALLY if you play on Controler.
--My PERSONAL Suggestion its change only if your Key is Cross with other Script.
--Also LOGIC Options are meant to be this Value, there is no reason to modify but i put the option.

--Bodhix

config = {

JumpsHeight       = 8,          -- How High Character can jump on Tricks (8.0 By Default I do not recommend change this Value).
VaultsHeight      = 8,          -- How High Character can jump on Vaults (8.0 By Default I do not recommend change this Value).
HighTricksHeight  = 7,          -- How High Character can jump on High Tricks (7.0 By Default I do not recommend change this Value).
WallrunHeight     = 4,          -- How High Character can jump on Wallruns (4.0 By Default I do not recommend change this Value).
CanSlowmo         = false,       -- Toggle (true/false) if you want that Client can perform Slow Motion Ability (Key Q / RB).
HelpOption        = true,       -- Toggle (true/false) if you want to Enable/Disable the Controls/Help Button option.
SpotTeleport      = false,      -- Toggle (true/false) if you want to Save your Spot Coords and teleport for fast clips (Keys Congigurables in Game Settings).
InfiniteWallrun   = false,      -- Toggle (true/false) if you want a realistic wallrun.
ActiveWhitelist   = false,      -- Toggle (true/false) if you want active Whitelist function (Modify in Whitelist.lua).
ActiveExport      = false,      -- Toggle (true/false) if you want active Export function (PKExportCall.dll).
Korean            = false,      -- Toggle (true/false) if you to switch to Korean lenguage.
HelpKey           = 27,         -- UP ARROW / PAD UP (This is the Button/Key you need to hold for activate).
HoldKey           = 137,        -- Caps / A (This is the Button/Key you need to hold for activate).
ActiveKey         = 19,         -- ALT / PAD DOWN (This is the Button/Key you need to Press while ur Holding "HoldKey" for activate).
Alternative       = 327,        -- F5 (This is an Alternatve Key for activate specially for Keyboard).
PassiveKey        = 22,         -- SPACE / X (This is the Button/Key you need to hold for Front / Side / Gainer / Cork).
Frontflip         = 32,         -- W / JOYSTCIK UP (This is the Button/Key you need to Press / Move for activate).
Sideflip          = 34,         -- A / JOYSTCIK LEFT (This is the Button/Key you need to Press / Move for activate).
Gainer            = 35,         -- D / JOYSTCIK RIGHT (This is the Button/Key you need to Press / Move for activate).
Cork              = 33,         -- S / JOYSTCIK DOWN (This is the Button/Key you need to Press / Move for activate).
HighTricks        = 25,         -- RIGHT CLICK / LT (This is the Button/Key you need to Press / Hold for activate).
Tricking          = 23,         -- F / Y (This is the Button/Key you need to Press for Tricking also this is the same key for Arabian/Double Arabian).
Fly               = 140,        -- R / B (This is the Button/Key you need to Press for Task While Tricking).
BackFull          = 22,         -- SPACE / X (This is the Button/Key you need to Press for Task While Tricking also this is the same key for Full to Back).
BackStep          = 73,         -- LSHIFT / A (This is the Button/Key you need to Press for Task While Tricking).
Parkour           = 24,         -- LEFT CLICK / RT (This is the Button/Key you need to hold for Vaults / Wallruns).
LandRoll          = 140,        -- R / B (This is the Button/Key you need to Press for Roll).
WallFlips         = 38,         -- E / LB (This is the Button/Key you need to Press to Task WallFlip).
TicTac            = 38          -- E / LB (This is the Button/Key you need to Press Before "Parkour Key" for TicTacs / Side Wallruns).
}

TriggerEvent("ConfigPK", config)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()

        -- Check conditions for Active Parkour Mode.
        if not IsEntityPlayingAnim(playerPed, "mp_arrest_paired", "cop_p2_back_right", 3) then
            -- Check the control conditions.
            if IsControlPressed(0, config.HoldKey) and IsControlJustPressed(0, config.ActiveKey) or IsControlJustPressed(0, config.Alternative) then
                -- Start Parkour Mode.
                TriggerEvent("ActiveParkour") -- Replace with your actual event name
            end
        else
            -- Check the conditions that make Parkour Mode off.
            if IsEntityPlayingAnim(playerPed, "mp_arrest_paired", "cop_p2_back_right", 3) then
                -- Turn Off Parkour Mode.
                TriggerEvent("EndParkour")
            end
        end
    end
end)

-- HOW TO PARKOUR

--To Active or Deactive Your Mod Press:
--A + DPad Down / Caps + Alt or F5
--Slow Motion = RB / Q
--Save Coords: 5
--Teleport to Coords: 4

-- FREERUNNING

--Frontflip = X / Space + Up
--Frontflip Pike = RT / Left Click (Hold) + X / Space + Up
--SidefLip = X / Space + Left
--Sideflip Double Leg = RT / Left Click (Hold) + X / Space + Left
--Gainer = X / Space + Right
--Gainer Pike = RT / Left Click (Hold) + X / Space + Right
--(You can perform this tricks wherever you want and if got height enough and hold his respective +Button you can do doubles or more flips variations)
--Cork = X / Space + Down
--Double Cork = RT / Left Click (Hold) + X / Space + Down
--Triple Cork = X / Space + Down
--(Only if you have High Enough)
--(All Tricks have a Variation if youre Running or Standing but Cork Tricks It is very noticeable Scout or TD Raiz)
--High Tricks = LT / Right Click (Hold)
--(Superman, Overbah, Gainer 360, Vortex, Illusion Flip, Front 540)
--(You can perform this Tricks if you have enough height also this trick are performed randomly)
--WallFlips = LB / E
--(You can do WallFlips if you have a Wall Forward)
--Jump = X / Space + LB / E
--Jump 360 = RT / Left Click (Hold) + X / Space + LB / E

--PARKOUR

--Wallrun = RT / Left Click
--(Only when you have High Walls forward)
--Vaults = RT / Left Click
--(Only when you have Low Walls / Objects / Vehicles, youll randomly perform a Parkour Vault and if you have High Enough you can add a Flip to
--to selected Vaults by Holding RT / Left Click)
--Fast Climb = RT / Left Click
--(Only when you have a Medium Wall)
--Cat / Ledge Idle = RT / Left Click
--(Only if your close to a Ledge while Wallrunning or If youre falling / trying to jump to another Build and get close to a Ledge)
--(Youll been into Ledge / Climb Idle Position, Just Press A / Left Shift to Climb the Wall)
--TicTacs = RT / Left Click (Hold) + LB / E
--(Only when you have a Low Wall at Left / Right)
--Lateral Wallrun = RT / Left Click (Hold) + LB / E
--(Only when you have a High Wall at Left / Right)
--Accuracy = Left Stick / Ctrl
--(Press While your performing your Trick animation and before it ends to Land Accurately)
--Trick Impulse / Distance = LB / E
--(While your performing your Trick animation and before it ends Hold the Key according to the distance you want)
--Slides = Right Stick / C
--(Only when youre Running / Sprinting)
--Crounch = Right Stick / C
--Roll = B / R
--(You can perform the Roll wherever you want and if youre falling it will perform automatly at least that you Start Tricking
--after a Trick or Active the Accuracy Landing)
--Hold Wall = RT / Left Click
--(Only if youre Falling and have a Wall in Front you can Hold the Wall for a Few Seconds or Perfom a Cat to Cat)
--Cat to Cat = X / SPACE (Hold)
--(Only if youre Holding a Wall or on Climb Legde Idle Press the Button / Key to Jump Backwards and if there is another Wall
--just Hold the Wall and Hold the Button / Key to Jump, you can do this over and over again until you get to the Ledge)

--LEDGE TRICKS

--(Only when youre on Climb/Cat Idle position)
--Palm Drop = LB / E
--Open Back = B / R
--Cat Front = Y / F
--Jump = X / SPACE
--Climb = A / Left Shift
--Cancel = DPAD LEFT / G

--TRICKING

--You will always start your combos with:
--Carl Wheel = Y / F 
--Once you start your trick you can select your next trick by holding his respective button:
--Fly = B / R 
--Carl Wheel/Arabian = Y / F 
--(If you got hight enough you can perform a Double Arabian)
--Back Step = A / Shift 
--(If you got hight enough you can perform a Double Layout)
--Back Full = X / Space 
--(If you got hight enough you can perform a Full to Back)
--180 Back = RT / Left Click (Hold) + X / Space 
--(If you got hight enough you can perform a 180 Double Back)
--For finish your combo your released the buttons.


Config = {}
---------------
---------  CONFIGS GANGS
-----

-- Pounts Amount
Config.RespectAddLV1 = math.random(10,30)

Config.RespectAddLV2 = math.random(50,120)

Config.RespectAddLV3 = math.random(150,220)

-- Gangs
Config.Gang1 = "ballas"

Config.Gang2 = "families"

Config.Gang3 = "vagos"

Config.Gang4 = "lostmc"

Config.Gang5 = "mafias"


-----
--------
-------------

------------------------------------------------------------------------------

---------------
---------  CONFIGS COCAINE MISIONS SELL 
-----

Config.itemquitar_misioncocaina = "cokebrick" -- Items
Config.Cantidaditemquitar_misioncocaina = 15  -- Amount Item Eliminated

Config.FormaRecompensa_MisionCocaina = "cash" -- "bank" -- "Crypto"
Config.CantidadRecompensa_MisionCocaina = math.random(4111, 12321) -- Reward Amount

Config['gangsystem'] = {
    ['cocaine-mision'] = { -- Coords Start Cutscene.
        buyerPos1 = vector3(-3051.15, 139.47, 11.58)
    },
}

-----
--------
-------------




    -- TriggerServerEvent("qb-gangsystem:RespectAddLV1")
	
	-- TriggerServerEvent("qb-gangsystem:conteo")
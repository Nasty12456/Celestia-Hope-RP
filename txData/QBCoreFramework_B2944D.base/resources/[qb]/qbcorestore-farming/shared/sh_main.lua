QBCore = exports['qb-core']:GetCoreObject()
MainShared = {
    UseKeyFunction = true,
    NeedCloth = true, -- Set true if you want to force start working with outfit.

    Inventory = 'qb', -- ['qb' / 'ox']

    BlipSprite = 272,
    BlipColour = 11,
    BlipScale = 0.5,
    ShopPed = 'a_m_m_hillbilly_01',
    ShopLocations = {
        vector4(2936.69, 4628.94, 48.72, 56.3),
        vector4(2535.49, 4661.53, 34.08, 313.82),
        vector4(2313.78, 4888.23, 41.81, 42.97)
    },

    Notify = function(text, typee)
        lib.notify({
            description = text,
            type = typee
        })
    end,
    
    ServerNotify = function(src, text, type)
        --not using right now..
    end,
    
    -- this function can be used if UseKeyFunction true.
    AddVehicleKey = function(veh) 
        local plate = GetVehicleNumberPlateText(veh)
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end,

    HelpNotifyType = 'GTA-O', -- ['GTA-O' / 'Modern-Draw-Text']

    HelpNotify = function(txt, t, c)
        if t == 'GTA-O' then
            AddTextEntry('HelpNotification', txt)
            BeginTextCommandDisplayHelp('HelpNotification')
            EndTextCommandDisplayHelp(0, false, true, -1)
        elseif t == 'Modern-Draw-Text' then
            AddTextEntry('FloatingHelpNotification', txt)
            SetFloatingHelpTextWorldPosition(1, c.x, c.y, c.z+.8)
            SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
            BeginTextCommandDisplayHelp('FloatingHelpNotification')
            EndTextCommandDisplayHelp(2, false, true, -1)
        end
    end,

    PlayAnimation = function(ped, animDict, animName, duration, bilmem)
        if bilmem == nil then bilmem = 49 end
        if duration == nil then duration = -1 end
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do 
          Wait(0) 
        end
        TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, duration, bilmem, 1, false, false, false)
        RemoveAnimDict(animDict)
    end,

    JobClothe = function()
        local model = GetEntityModel(PlayerPedId())
		if model == 1885233650 then
			local data = {
                ["outfitName"] =  'JOBCLOTHE',
                ["outfitData"] = {
                    ["pants"]       = { item = 0, texture = 0},
                    ["arms"]        = { item = 11, texture = 0},  
                    ["t-shirt"]     = { item = 15, texture = 0},  
                    ["vest"]        = { item = 154, texture = 5},  
                    ["torso2"]      = { item = 154, texture = 0},  
                    ["shoes"]       = { item = 2, texture = 0},  
                    ["decals"]      = { item = -1, texture = 0},  
                    ["accessory"]   = { item = -1, texture = 0},  
                    ["bag"]         = { item = -1, texture = 0},  
                    ["hat"]         = { item = -1, texture = 0},
                    ["glass"]       = { item = -1, texture = 0},  
                    ["ear"]         = { item = -1, texture = 0},  
                    ["mask"]        = { item = -1, texture = 0},
                    ["watch"]       = { item = -1, texture = 0}, 
                    ["bracelet"]    = { item = -1, texture = 0},  
                }
			}
			TriggerEvent("illenium-appearance:client:loadOutfit", data)
		elseif model == -1667301416 then
			local data = {
				["outfitName"] = 'JOBCLOTHE',
				["outfitData"] = {
					["pants"]       = { item = 0, texture = 0},
					["arms"]        = { item = 15, texture = 0},  
					["t-shirt"]     = { item = 15, texture = 0},  
					["vest"]        = { item = 43, texture = 4},  
					["torso2"]      = { item = 139, texture = 5}, 
					["shoes"]       = { item = 9, texture = 0}, 
					["decals"]      = { item = 0, texture = 0},  
					["accessory"]   = { item = -1, texture = 0},  
					["bag"]         = { item = 0, texture = 0},  
					["hat"]         = { item = -1, texture = 0},  
					["glass"]       = { item = -1, texture = 0},  
					["ear"]         = { item = -1, texture = 0},  
					["mask"]        = { item = 0, texture = 0},  
					["watch"]       = { item = -1, texture = 0},  
					["bracelet"]    = { item = -1, texture = 0},  
				}
			}
			TriggerEvent("illenium-appearance:client:loadOutfit", data)
		end
    end,

    ResetClothe = function()
        ExecuteCommand("yenile")
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
    end,

    HayBaleProp = {
        ["animDict"] = "anim@heists@box_carry@",
        ["animName"] = "idle",
        ["model"] = "prop_haybale_01",
        ["bone"] = 28422,
        ["x"] = 0.01,
        ["y"] = -0.02,
        ["z"] = -0.12,
        ["xR"] = 0.0,
        ["yR"] = 0.0,
        ["zR"] = 90.0,
    },

    ChurnProp = {
        ["animDict"] = "anim@heists@narcotics@trash",
        ["animName"] = "idle",
        ["model"] = "prop_old_churn_01",
        ["bone"] = 28422,
        ["x"] = 0.2,
        ["y"] = -0.15,
        ["z"] = -0.90,
        ["xR"] = 0.0,
        ["yR"] = 0.0,
        ["zR"] = 80.0
    },

    MelonProp = {
        ["animDict"] = "anim@heists@box_carry@",
        ["animName"] = "idle",
        ["model"] = "prop_veg_crop_03_cab",
        ["bone"] = 28422,
        ["x"] = -0.01,
        ["y"] = -0.1,
        ["z"] = -0.25,
        ["xR"] = 0.0,
        ["yR"] = 0.0,
        ["zR"] = 0.0,
    },
}
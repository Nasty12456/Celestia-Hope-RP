Config = {
    ["Wheat"] = {
        [1] = {
            header = "Wheat Field #1",
            description = "Click here to start job",  
            bool = false
        },
        [2] = {
            header = "Wheat Field #2",
            description = "Click here to start job",  
            bool = false
        },
        [3] = {
            header = "Wheat Field #3",
            description = "Click here to start job",  
            bool = false
        },
        [4] = {
            header = "Wheat Field #4",
            description = "Click here to start job",  
            bool = false
        },
        [5] = {
            header = "Wheat Field #5",
            description = "Click here to start job",  
            bool = false
        },
        [6] = {
            header = "Wheat Field #6",
            description = "Click here to start job",  
            bool = false
        },
        [7] = {
            header = "Wheat Field #7",
            description = "Click here to start job",  
            bool = false
        }
    },
    ["Cow"] = {
        [1] = {
            header = "Cow Field #1",
            description = "Click here to start job",  
            bool = false
        },
        [2] = {
            header = "Cow Field #2",
            description = "Click here to start job",  
            bool = false
        },
        [3] = {
            header = "Cow Field #3",
            description = "Click here to start job",  
            bool = false
        },
        [4] = {
            header = "Cow Field #4",
            description = "Click here to start job",  
            bool = false
        },
        [5] = {
            header = "Cow Field #5",
            description = "Click here to start job",  
            bool = false
        },
        [6] = {
            header = "Cow Field #6",
            description = "Click here to start job",  
            bool = false
        },
        [7] = {
            header = "Cow Field #7",
            description = "Click here to start job",  
            bool = false
        },
        [8] = {
            header = "Cow Field #8",
            description = "Click here to start job",  
            bool = false
        }
    },
    ["Melon"] = {
        [1] = {
            header = "Melon Field #1",
            description = "Click here to start job",  
            bool = false
        },
        [2] = {
            header = "Melon Field #2",
            description = "Click here to start job",  
            bool = false
        },
        [3] = {
            header = "Melon Field #3",
            description = "Click here to start job",  
            bool = false
        },
        [4] = {
            header = "Melon Field #4",
            description = "Click here to start job",  
            bool = false
        },
        [5] = {
            header = "Melon Field #5",
            description = "Click here to start job",  
            bool = false
        },
        [6] = {
            header = "Melon Field #6",
            description = "Click here to start job",  
            bool = false
        }
    },
    ["Pumpkin"] = {
        [1] = {
            header = "Pumpkin Field #1",
            description = "Click here to start job",  
            bool = false
        },
        [2] = {
            header = "Pumpkin Field #2",
            description = "Click here to start job",  
            bool = false
        },
        [3] = {
            header = "Pumpkin Field #3",
            description = "Click here to start job",  
            bool = false
        },
        [4] = {
            header = "Pumpkin Field #4",
            description = "Click here to start job",  
            bool = false
        },
        [5] = {
            header = "Pumpkin Field #5",
            description = "Click here to start job",  
            bool = false
        },
        [6] = {
            header = "Pumpkin Field #6",
            description = "Click here to start job",  
            bool = false
        }
    },
    ["Shop"] = {
        [1] = {
            ItemName = 'Wheat Seed',
            ItemCode = 'wheatseed',
            ItemImage = 'wheatseed',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [2] = {
            ItemName = 'Melon Seed',
            ItemCode = 'melonseed',
            ItemImage = 'melonseed',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [3] = {
            ItemName = 'Pumpkin Seed',
            ItemCode = 'pumpkinseed',
            ItemImage = 'pumpkinseed',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [4] = {
            ItemName = 'Milk Churn',
            ItemCode = 'churn',
            ItemImage = 'churn',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [5] = {
            ItemName = 'Raker',
            ItemCode = 'raker',
            ItemImage = 'raker',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [6] = {
            ItemName = 'Garden Shovel',
            ItemCode = 'shovel',
            ItemImage = 'shovel',
            Price = 10,
            BuyLabel = 'Buy'
        },
        [7] = {
            ItemName = 'Watering Can',
            ItemCode = 'full_watering_can',
            ItemImage = 'wateringcan',
            Price = 10,
            BuyLabel = 'Buy'
        },
    },
    ['Sell'] = {
        [1] = {
            ItemName = 'Cutted Melon',
            ItemCode = 'melon',
            ItemImage = 'melon',
            Price = 100,
            BuyLabel = 'Sell'
        },
        [2] = {
            ItemName = 'Wheat',
            ItemCode = 'wheat',
            ItemImage = 'wheat',
            Price = 100,
            BuyLabel = 'Sell'
        },
        [3] = {
            ItemName = 'Cutted Pumpkin',
            ItemCode = 'Pumpkin',
            ItemImage = 'pumpkin',
            Price = 100,
            BuyLabel = 'Sell'
        },
        [4] = {
            ItemName = 'Milk Bottle',
            ItemCode = 'milkbottle',
            ItemImage = 'milkbottle',
            Price = 100,
            BuyLabel = 'Sell'
        },
    }
}

MainShared = {
    UseKeyFunction = true,

    Notify = function(text, type, length)
        QBCore.Functions.Notify(text, type, length)
    end,
    
    ServerNotify = function(src, text, type, length)
        QBCore.Functions.Notify(src, text, type, length)
    end,
    
    AddVehicleKey = function(veh) 
        local plate = GetVehicleNumberPlateText(veh)
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    end,

    ShowHelpNotification = function(msg, beep, duration)
        if beep == nil then
            beep = true
        end
        AddTextEntry('HelpNotification', msg)
        BeginTextCommandDisplayHelp('HelpNotification')
        EndTextCommandDisplayHelp(0, false, beep, duration or -1)
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
}
CodeStudio = {}

-------FRAMEWORK SETTINGS-------

CodeStudio.ServerType = 'QB'  ---Server: QB/ESX

---QB Settings---
CodeStudio.QBCoreGetCoreObject = 'qb-core'          --ONLY EDIT IF YOU ARE USING QB IF NOT LEAVE THIS


---ESX Settings---
CodeStudio.ESXGetSharedObject = 'es_extended'       --ONLY EDIT IF YOU ARE USING ESX IF NOT LEAVE THIS



CodeStudio.HQBlip = true
CodeStudio.TargetPedLoc = vector4(930.41, -1499.04, 30.35, 356.04)
CodeStudio.TargetPed = "s_m_y_strvend_01"
CodeStudio.EnemyPed = true
CodeStudio.EnemyPeds = 'g_m_y_mexgoon_01' --Model name of enemy ped
CodeStudio.EnemyAmount = 4  --How many enemy peds to protect the contract vehicle?
CodeStudio.EnemyWeapon = "weapon_bat" --Weapon used by the enemy ped
CodeStudio.notifyType = false ---phone/chat/false  (*false will give you notification) (*If phone then configure accordingly default: qb-phone)
CodeStudio.Menu = 'qb-menu'  ---qb-menu/nh-context/esx
CodeStudio.Target = 'qb-target'  ---QB or OX Target
CodeStudio.EnableCooldown = false --Enable/Disable Global Cooldown
CodeStudio.Cooldown = 15      --Global Cooldown In Minutes


CodeStudio.HackDevice = "nitroradio" --Devive to hack the tracker
CodeStudio.DealerCurrency = "nitrocash" --Reward and Shop Currency 


CodeStudio.items = {  --Exclusive Dealer Shop 
  {label = 'Tuner Chip', name = 'tunerlaptop', price = 7000},
  {label = 'Nitro Radio', name = 'nitroradio', price = 1000},
  {label = 'Metal Scrap', name = 'metalscrap', price = 50},
  {label = 'Plastic', name = 'plastic', price = 45},
  {label = 'Copper', name = 'copper', price = 50},
  {label = 'Aluminum', name = 'aluminum', price = 50},
  {label = 'Iron', name = 'iron', price = 50},
}    


CodeStudio.List = {
    ['1'] = {  --Level
        [1]= {model = 'tailgater', name = 'Tailgater', price = 250, reps = 5},  ---price = reward nito money,  reps = how much XP u want to give 100XP = 1 Reputation
        [2]= {model = 'intruder', name = 'Intruder', price = 250, reps = 5},
        [3]= {model = 'comet', name = 'Comet', price = 100, reps = 5},
        [4]= {model = 'sultan', name = 'Sultan', price = 150, reps = 5},
        [5]= {model = 'rapidgt', name = 'RapidGT', price = 150, reps = 5},
        [6]= {model = 'tornado', name = 'Tornado', price = 100, reps = 5},
    },
  ['2'] = {  --Level
        [1]= {model = 'tailgater', name = 'Tailgater', price = 1000, reps = 5},
        [2]= {model = 'sultan', name = 'Sultan', price = 1000, reps = 5},
        [3]= {model = 'burrito', name = 'Burrito', price = 1500, reps = 10},
        [4]= {model = 'sultanrs', name = 'SultanRS', price = 1750, reps = 10},
        [5]= {model = 'rapidgt', name = 'RapidGT', price = 1000, reps = 5},
        [6]= {model = 'cognoscenti', name = 'Cognoscenti', price = 1500, reps = 5},
    },
  ['3'] = {  --Level
        [1]= {model = 'emperor', name = 'Emperor', price = 1750, reps = 5},
        [2]= {model = 'intruder', name = 'Intruder', price = 1750, reps = 5},
        [3]= {model = 'burrito', name = 'burrito', price = 2000, reps = 10},
        [4]= {model = 'sultanrs', name = 'SultanRS', price = 2250, reps = 10},
        [5]= {model = 'oracle', name = 'Oracle', price = 1750, reps = 5},
        [6]= {model = 'cognoscenti', name = 'Cognoscenti', price = 2000, reps = 5},
    },
    ['4'] = {  --Level
        [1]= {model = 'emperor', name = 'Emperor', price = 2000, reps = 5},
        [2]= {model = 'intruder', name = 'Intruder', price = 2000, reps = 5},
        [3]= {model = 'panto', name = 'Panto', price = 2000, reps = 5},
        [4]= {model = 'picador', name = 'Picador', price = 2750, reps = 15},
        [5]= {model = 'oracle', name = 'Oracle', price = 2000, reps = 5},
        [6]= {model = 'vigero', name = 'Vigero', price = 2000, reps = 10},
    },
      ['5'] = {  --Level
        [1]= {model = 'bison', name = 'Bison', price = 2500, reps = 5},
        [2]= {model = 'buffalo', name = 'Buffalo', price = 3000, reps = 15},
        [3]= {model = 'panto', name = 'Panto', price = 2250, reps = 5},
        [4]= {model = 'picador', name = 'Picador', price = 3250, reps = 15},
        [5]= {model = 'feltzer', name = 'Feltzer', price = 4000, reps = 10},
        [6]= {model = 'vigero', name = 'Vigero', price = 2500, reps = 10},
    },
      ['6'] = {  --Level
        [1]= {model = 'bison', name = 'Bison', price = 2750, reps = 5},
        [2]= {model = 'buffalo', name = 'Buffalo', price = 3500, reps = 15},
        [3]= {model = 'faggio', name = 'Faggio', price = 1000, reps = 5},
        [4]= {model = 'bati', name = 'Bati', price = 2500, reps = 5},
        [5]= {model = 'feltzer', name = 'Feltzer', price = 4500, reps = 10},
        [6]= {model = 'sanchez', name = 'Sanchez', price = 1750, reps = 5},
    },
      ['7'] = {  --Level
        [1]= {model = 'rebel', name = 'Rebel', price = 3500, reps = 5},
        [2]= {model = 'bifta', name = 'Bifta', price = 4000, reps = 15},
        [3]= {model = 'faggio', name = 'Faggio', price = 1500, reps = 5},
        [4]= {model = 'bati', name = 'Bati', price = 3000, reps = 5},
        [5]= {model = 'blazer', name = 'Blazer', price = 3500, reps = 10},
        [6]= {model = 'sanchez', name = 'Sanchez', price = 2250, reps = 5},
    },
      ['8'] = {  --Level
        [1]= {model = 'rebel', name = 'Rebel', price = 4000, reps = 5},
        [2]= {model = 'bifta', name = 'Bifta', price = 4500, reps = 15},
        [3]= {model = 'stingergt', name = 'StingerGT', price = 5000, reps = 10},
        [4]= {model = 'banshee', name = 'Banshee', price = 5500, reps = 10},
        [5]= {model = 'blazer', name = 'Blazer', price = 4250, reps = 10},
        [6]= {model = 'carbonizzare', name = 'Carbonizzare', price = 5500, reps = 10},
    },
      ['9'] = {  --Level
        [1]= {model = 'entityxf', name = 'EntityXF', price = 7500, reps = 15},
        [2]= {model = 'fmj', name = 'FMJ', price = 8000, reps = 10},
        [3]= {model = 'stingergt', name = 'StingerGT', price = 6000, reps = 10},
        [4]= {model = 'banshee', name = 'Banshee', price = 6500, reps = 10},
        [5]= {model = 'infernus', name = 'Infernus', price = 7500, reps = 15},
        [6]= {model = 'carbonizzare', name = 'Carbonizzare', price = 6500, reps = 10},
    },
      ['10'] = {  --Level
        [1]= {model = 'entityxf', name = 'EntityXF', price = 8000, reps = 15},
        [2]= {model = 'fmj', name = 'FMJ', price = 8500, reps = 10},
        [3]= {model = 'turismor', name = 'TurismoR', price = 9500, reps = 10},
        [4]= {model = 'zentorno', name = 'Zentorno', price = 9000, reps = 20},
        [5]= {model = 'infernus', name = 'Infernus', price = 8000, reps = 15},
        [6]= {model = 'vacca', name = 'Vacca', price = 8500, reps = 15},
    },
  ['11'] = {  --Level
        [1]= {model = 'adder', name = 'adder', price = 12500, reps = 15},
        [2]= {model = 'voltic', name = 'Voltic', price = 14000, reps = 10},
        [3]= {model = 'turismor', name = 'TurismoR', price = 13000, reps = 10},
        [4]= {model = 'zentorno', name = 'Zentorno', price = 14500, reps = 20},
        [5]= {model = 't20', name = 'T20', price = 15000, reps = 15},
        [6]= {model = 'vacca', name = 'Vacca', price = 12500, reps = 15},
    },
    ['12'] = {  --Level
        [1]= {model = 'adder', name = 'adder', price = 25000, reps = 15},
        [2]= {model = 'voltic', name = 'Voltic', price = 22500, reps = 10},
        [3]= {model = 'italigtb', name = 'ItaliGTB', price = 32500, reps = 15},
        [1]= {model = 'osiris', name = 'Osiris', price = 40000, reps = 15},
        [2]= {model = 't20', name = 'T20', price = 25000, reps = 15},
        [3]= {model = 'nero', name = 'Nero', price = 37500, reps = 10},
    },
    ['13'] = {  --Level
        [1]= {model = 'bullet', name = 'Bullet', price = 42500, reps = 10},
        [2]= {model = 'pfister811', name = 'Pfister811', price = 47500, reps = 10},
        [3]= {model = 'italigtb', name = 'ItaliGTB', price = 45000, reps = 15},
        [1]= {model = 'osiris', name = 'Osiris', price = 50000, reps = 15},
        [2]= {model = 'tempesta', name = 'Tempesta', price = 40000, reps = 10},
        [3]= {model = 'nero', name = 'Nero', price = 42500, reps = 10},
    },
      ['14'] = {  --Level
        [1]= {model = 'bullet', name = 'Bullet', price = 75000, reps = 10},
        [2]= {model = 'pfister811', name = 'Pfister811', price = 60000, reps = 10},
        [3]= {model = 'cyclone', name = 'Cyclone', price = 65000, reps = 15},
        [4]= {model = 'reaper', name = 'Reaper', price = 55000, reps = 10},
        [5]= {model = 'tempesta', name = 'Tempesta', price = 52500, reps = 10},
        [6]= {model = 'nero', name = 'Nero', price = 52500, reps = 10},
    },
      ['15'] = {  --Level
        [1]= {model = 'xa21', name = ' XA21', price = 75000, reps = 15},
        [2]= {model = 'emerus', name = 'Emerus', price = 80000, reps = 15},
        [3]= {model = 'cyclone', name = 'Cyclone', price = 70000, reps = 15},
        [4]= {model = 'reaper', name = 'Reaper', price = 65000, reps = 10},
        [5]= {model = 'krieger', name = 'Krieger', price = 87500, reps = 20},
        [6]= {model = 'bmws1', name = 'bmwS1', price = 90000, reps = 20},
    },
}
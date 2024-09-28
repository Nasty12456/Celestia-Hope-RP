zr_config = {}
zr_config.zr_translation = {}
zr_trans = zr_config.zr_translation

-- We support the following frameworks: 'QB' / 'ESX'
zr_config.framework = 'QB'
zr_config.QB = 'qb-core'
zr_config.ESX = 'es_extended'

zr_config.OnlyLastLocation = false
zr_config.SpawnAnimation = false
zr_config.SpawnAnimationDuration = 1000 -- 1000s before the animation starts, if your player loads slower and you fall under map increase this 'Wait' value.

zr_trans.last = "Last Location."
zr_trans.lastinfo = "You will spawn in your last location"

zr_trans.spawn = "Spawn here."
zr_trans.spawnlast = "Spawn at last location"

zr_config.zr_locations = {

    { 
        name = "cityhall", 
        label = "City Hall", 
        description = "Government hub for city operations and decision-making.",
        spawn = vector4(-536.2222, -226.3347, 37.666244, 212.51023),
        image = "./zr-assets/cityhall.webp"
    },
    {
        name = "unicorn", 
        label = "Vanilla Unicorn", 
        description = "Premier strip club with music, exotic performances, and a lively atmosphere.",
        spawn = vector4(155.4, -1303.31, 29.2, 105.84),
        image = "./zr-assets/unicorn.webp"
    },
    { 
        name = "pinkcage", 
        label = "Pink Cage Motel", 
        description = "Colorful motel, rent a room, meet travelers, experience unique charm.",
        spawn = vector4(313.76745, -230.6358, 53.990818, 153.79005),
        image = "./zr-assets/motel.webp"
    },
    { 
        name = "park", 
        label = "Pleasure Park", 
        description = "Entertainment hub with rides and games. Lively atmosphere for fun with friends.",
        spawn = vector4(-1850.43, -1232.158, 13.01728, 141.12789),
        image = "./zr-assets/park.webp"
    },
    { 
        name = "vehicleshop", 
        label = "Premium Deluxe Autos", 
        description = "High-end vehicle shop. Browse and purchase stylish rides.",
        spawn = vector4(-42.1563, -1108.702, 26.438091, 162.17939),
        image = "./zr-assets/pdm.webp"
    },
    { 
        name = "Legion Square", 
        label = "Legion Square", 
        description = "The description of Art to Art states that the square is the heart of old downtown.",
        spawn = vector4(246.91, -879.03, 30.6, 301.66), 
        image = "./zr-assets/legion.webp"
    },
    { 
        name = "Sandy Shores", 
        label = "Sandy Shores", 
        description = "We were bored with the old, destroyed Sandy Shores, so we decided to restore it.",
        spawn = vector4(1636.95, 3865.49, 35.01, 230.13), 
        image = "./zr-assets/sandy.webp"
    },
    { 
         name = "Los Santos International Airport", 
        label = "Los Santos International Airport", 
        description = " Los Santos International Airport.",
        spawn = vector4(-1020.53, -2701.21, 13.76, 147.77), 
        image = "./zr-assets/airport.webp"   
    },    
    { 
        name = "Plaeto Bay", 
        label = "Plaeto Bay", 
        description = "Sitting at the base of the massive Mount Chiliad, Paleto Bay is a coastal town.",
        spawn = vector4(-81.62, 6329.17, 31.49, 225.22), 
        image = "./zr-assets/paleto.webp"
    },
    { 
        name = "Mirror Park", 
        label = "Mirror Park", 
        description = " Mirror Park is a suburban neighborhood located in East Los Santos.",
        spawn = vector4(1135.79, -482.46, 65.94, 203.57), 
        image = "./zr-assets/mirror.webp"
    },
    {
        name = "prison",
        label = "Prison", 
        description = "High-security prison for the city's most notorious criminals.",
        job = "police", 
        spawn = vector4(1847.7116, 2585.9758, 45.67237, 100.0),
        image = "./zr-assets/prison.webp"
    },
    {
        name = "pd",
        label = "Police Department", 
        description = "Police HQ, coordinating law enforcement and holding cells.",
        job = "police", 
        spawn = vector4(411.24, -974.0, 29.42, 80.92),
        image = "./zr-assets/pd.webp"
    },
    {
        name = "hospital", 
        label = "Hospital", 
        description = "Essential healthcare hub with emergency services.",
        job = "ambulance", 
        spawn = vector4(299.64801, -575.1514, 43.260845, 76.685317),
        image = "./zr-assets/hospital.webp"
    },
}

zr_config.zr_last_location = { 
    name = "lastlocation", 
    label = "Last Location", 
    description = "Taxi ready to take you to your last location. Reconnect and resume from where you left off.",
    spawn = vector4(-536.2222, -226.3347, 37.666244, 212.51023),
    image = "./zr-assets/taxi.webp"
}
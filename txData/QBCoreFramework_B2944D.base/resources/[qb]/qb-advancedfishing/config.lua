-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx


Config = {}

Config.Framework = "qb" -- "qb" / "oldqb" : qb = export system , oldqb = triggerevent system
Config.sql = "oxmysql" -- dont forget to change fxmanifest.lua! |ghmattimysql - oxmysql - mysql-async

Config.Settings = {
    ["canOpenWithCommand"] = true, -- MENÜ KOMUT İLE AÇILABİLİR Mİ?
    ["menuOpenCommand"] = "fishmenu", 
    ["addXP"] = {min = 20, max = 100}, -- Balık avından sonra verilecek xp miktarı
    ["addxpafterXcatch"] = 3, -- Tecrübe ödülünden sonra kaç tane başarılı av verilecek
    ["needxpforlevelup"] = 500, -- Seviye atlamak için kaç xp gerekli
    ["addTrashWithoutBait"] = 1, -- BALIK YEMİ OLMADAN DAHA KAÇ ÇÖP EŞYA GÖRÜNÜR
    ["rodBrokeChanceWhenUpgrade"] = 20, -- SEVİYE YÜKSELTME SIRASINDA OLTA KIRILMA ŞANSI NE KADARDIR?
    ["eatBaitChance"] = 20, -- BALIK TUTULDUKTAN SONRA YEMİN KAYBOLMA ŞANSI YÜZDE KAÇTIR
    ["illegalBaitName"] = "illegal", -- YASA DIŞI BALIK YAKALAMAK İÇİN GEREKLİ YEM TÜRÜ
    ["tasksResetDay"] = 3, -- GÖREV ALINDIKTAN KAÇ GÜN SONRA SIFIRLANACAKTIR (1 GÖREV ALINSA DA YAZILI GÜNDEN SONRA TÜM GÖREVLER SİLİNİR)
}

Config.Language = {
    ["eatBaitText"] = "You lost your fish feed.",
    ["catchFish"] = "You caught the fish.",
    ["youCantFishHere"] = "You can't fish here!",
    ["somethingStoppingFish"] = "Something keeps you from fishing",
    ["movementOnRod"] = "There is movement in your fishing line!",
    ["missedFish"] = "You missed the fish",
    ["noLeftBait"] = "There is no feed left at the end of the fishing line!",
    ["fishingHBStopped"] = "Fishing Stopped",
    ["illegalCant"] = "You cannot catch illegal fish in this region!",
    ["useBaitNotFishing"] = "You must have a fishing rod to feed the bait!",
    ["youDontHaveItemUPGRADE"] = "You do not have the necessary item for upgrade!",
    ["upgradedRod"] = "Your fishing line has been upgraded to the next level!",
    ["brokenRod"] = "Your fishing rod is broken!",
    ["youDontHave"] = "You don't have it!",
    ["youDontHaveMoney"] = "You don't have enough money!",
    ["youDontHaveEnoughSpace"] = "You don't have enough space to move the item!",
    ["youDontHaveWantSell"] = "You don't have the product you want to sell!",
    ["succesBuy"] = "You bought it",
    ["succesSold"] = "You sold",
}

Config.Customize = {
    title = "Town is good luckow",
    fishAreaTitle = "Fishes",
    taskAreaTitle = "Your duties",
    currentXP = "Available xp",
    requiredXP = "Required DP",
}

Config.FishLevels = { -- OLTA TUTMA SİSTEMİNDE BAĞLANABİLİR TÜM BALIKLAR VE BALIK SEVİYELERİ (BU ALAN, KAĞIT SEVİYESİ DEĞİLDİR) (BÜTÜN BALIKLAR BAĞLANMALIDIR)
    ["anchovy"] = 1,
    ["smallbluefish"] = 2,
    ["bluefish"] = 5,
    ["bonitosfish"] = 9,
    ["garfish"] = 11,
    ["perch"] = 13,
    ["carettacaretta"] = 15,
    ["pantfish"] = 18,
    ["sharkfish"] = 20,
    ["whitepearl"] = 1,
    ["bluepearl"] = 1,
    ["redpearl"] = 1,
    ["greenpearl"] = 1,
    ["yellowpearl"] = 1,
}

Config.fishingRods = { -- OLTA KABLOLARI, ÖĞE İSİMLERİ VE SEVİYELERİ
    {itemName = "fishingrod", level = 1},
    {itemName = "fishingrod2", level = 2},
    {itemName = "fishingrod3", level = 3},
    {itemName = "fishingrod4", level = 4},
    {itemName = "fishingrod5", level = 5},
}

Config.fishBaits = { -- BALIK YEMİ VE YEM ÇEŞİTLERİ
    {itemName = "fishbait", baitType = "fish", label = "Fish Bait"},
    {itemName = "illegalfishbait", baitType = "illegal", label = "Illegal Fish Bait"},
}

-- TABLO 1 İLE BAŞLAMALIDIR - TABLO 1 GERÇEKTEN SEVİYE 2 OLTA İLE İLGİLİDİR
Config.upgradeRodPrices = { -- OLTA YÜKSELTME FİYAT LİSTESİ
    [1] = 500, -- LEVEL 2 
    [2] = 1000, -- LEVEL 3
    [3] = 1500, -- LEVEL 4 
    [4] = 2000, -- LEVEL 5
}

Config.fishMenuArea = { -- YANINA GİDİN VE /BALIK MENÜSÜNÜ AÇMAK İÇİN E BASIN
    {
        pedName = "Town", 
        pedHash = 0x0B881AEE, 
        pedCoord = vector3(-1833.3, -1263.34, 7.62),
        drawText = "[E] - Fisherman",
        h = 54,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipName = "Fisherman",
            blipIcon = 68,
            blipColour = 3,
        },
    }
}

Config.upgradeRodArea = { -- ÇUBUK SEVİYESİ YÜKSELTME ALANLARI
    {
        pedName = "Town", 
        pedHash = 0x1EEC7BDC, 
        pedCoord = vector3(-1837.69, -1259.62, 7.62), 
        drawText = "[E] - Upgrade bar",
        h = 54,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = true,
            blipName = "Fishing",
            blipIcon = 68,
            blipColour = 3,
        },
    }
}

Config.marketArea = { -- PAZAR ALANLARI (ALIM VE SATIM)
    {
        pedName = "Town", 
        pedHash = 0xAE5BE23A, 
        pedCoord = vector3(-1840.34, -1256.88, 7.62), 
        drawText = "[E] - Fisherman Marketi",
        h = 54,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipName = "Fisherman Marketi",
            blipIcon = 68,
            blipColour = 3,
        },
    }
}

Config.buyMarketItems = { -- BALIK PAZARINDA SATILAN ÜRÜN LİSTESİ (SATIN ALMA MENÜSÜ)
    {itemId = 1, itemName = "fishingrod", itemLabel = "Fishingrod 1Lv.", itemPrice = 50, image = './css/imgs/fishingrod.png'},
    {itemId = 2, itemName = "fishbait", itemLabel = "Fish Bait", itemPrice = 5, image = './css/imgs/fishbait.png'},
    {itemId = 3, itemName = "illegalfishbait", itemLabel = "Illegal Fish Bait", itemPrice = 30, image = './css/imgs/illegalfishbait.png'},
}

Config.Zones = { -- BALIK ALANLARI
    { -- Motel
        coords = vector3(-1857.24, -1225.67, 13.017), -- BALIKÇILIK ALANI KOORDİNATLARI
        radius = 150, -- YUKARIDAKİ KOORDİNATIN YARIÇAP SEVİYESİ 
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipAlpha = true,
            blipName = "Fish area",
            blipIcon = 68,
            blipColour = 3,
            blipAlphaColour = 2,
        },
        trashChance = 15, -- BU KOORDİNATTA BALIKÇILIK YAPARKEN ÇÖP MADDELERİN YÜZDE KAÇTA VERİLECEĞİ
        rareChance = 5, -- BU KOORDİNATTA BALIKÇILIK YAPARKEN DEĞERLİ EŞYALARIN YÜZDE KAÇI VERİLECEK
        illegal = false, -- BU KOORDİNATTA YASA DIŞI BİR MADDE TUTULUR MU?
        items = { -- BU KOORDİNASYONDA BALIK TUTARKEN GÖRÜNECEK ÖĞELER
            trashItems = {"fishbait", "fish"}, -- ÇÖP EŞYALAR
            rare = { -- NADİR EŞYALAR
                rodLevel = {
                    [1] = {"whitepearl"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"whitepearl", "bluepearl"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR
                    [3] = {"whitepearl", "bluepearl","redpearl"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"whitepearl", "bluepearl","redpearl","yellowpearl"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"whitepearl", "bluepearl","redpearl","yellowpearl","greenpearl"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
            normal = { -- NORMAL ÖĞELER 
                rodLevel = {
                    [1] = {"anchovy"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"anchovy", "smallbluefish"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR 
                    [3] = {"anchovy", "smallbluefish", "bluefish","bonitosfish"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"anchovy", "smallbluefish", "bluefish","bonitosfish","garfish"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"anchovy", "smallbluefish", "bluefish","bonitosfish","garfish","perch"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
            illegal = { -- YASAL ÖĞELER
                rodLevel = {
                    [1] = {"anchovy"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"anchovy", "smallbluefish"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR
                    [3] = {"anchovy", "smallbluefish", "bluefish","bonitosfish"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"carettacaretta", "pantolobaligi"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"carettacaretta", "pantolobaligi","sharkfish"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
        },
    }, 

    { -- ILLEGAL BÖLGE
        coords = vector3(-3747.00, -1919.14, -0.234), -- BALIKÇILIK ALANI KOORDİNATLARI
        radius = 300, -- YUKARIDAKİ KOORDİNATIN YARIÇAP SEVİYESİ
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = true,
            blipAlpha = true,
            blipName = "Illegal Fish area",
            blipIcon = 68,
            blipColour = 3,
            blipAlphaColour = 49,
        },
        trashChance = 70, -- BU KOORDİNATTA BALIKÇILIK YAPARKEN ÇÖP MADDELERİN YÜZDE KAÇTA VERİLECEĞİ
        rareChance = 15, -- BU KOORDİNATTA BALIKÇILIK YAPARKEN DEĞERLİ EŞYALARIN YÜZDE KAÇI VERİLECEK
        illegal = true, -- BU KOORDİNATTA YASA DIŞI BİR MADDE TUTULUR MU?
        items = { -- BU KOORDİNASYONDA BALIK TUTARKEN GÖRÜNECEK ÖĞELER
            trashItems = {"illegalfishbait","fish"}, -- ÇÖP EŞYALAR
            rare = { -- NADİR EŞYALAR
                rodLevel = {
                    [1] = {"whitepearl"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"whitepearl", "bluepearl"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR
                    [3] = {"whitepearl", "bluepearl","redpearl"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"whitepearl", "bluepearl","redpearl","yellowpearl"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"whitepearl", "bluepearl","redpearl","yellowpearl","greenpearl"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
            normal = { -- NORMAL ÖĞELER 
                rodLevel = {
                    [1] = {"anchovy"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"anchovy", "smallbluefish"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR
                    [3] = {"anchovy", "smallbluefish", "bluefish","bonitosfish"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"anchovy", "smallbluefish", "bluefish","bonitosfish","garfish"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"anchovy", "smallbluefish", "bluefish","bonitosfish","garfish","perch"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
            illegal = { -- YASAL ÖĞELER
                rodLevel = {
                    [1] = {"anchovy"}, -- 1 KATLI OLTA İLE NELER YAKALANABİLİR
                    [2] = {"anchovy", "smallbluefish"}, -- 2 KATLI OLTA İLE NELER YAKALANABİLİR
                    [3] = {"anchovy", "smallbluefish", "bluefish","bonitosfish"}, -- 3 KATLI OLTA İLE NELER YAKALANABİLİR
                    [4] = {"carettacaretta", "pantolobaligi"}, -- 4 KATLI OLTA İLE NELER YAKALANABİLİR
                    [5] = {"carettacaretta", "pantolobaligi","sharkfish"}, -- 5 KATLI OLTA İLE NELER YAKALANABİLİR
                },
            },
        },
    },
}

Config.Tasks = { -- BALIK MENÜSÜNDE GÖRÜNEN GÖREVLER
    {
        taskId = 1, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 40 Small Bluefish", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "smallbluefish", -- GÖREV KONUSU
        moneyRewards = 2000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 40, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
    {
        taskId = 2, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 30 Bluefish", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "bluefish", -- GÖREV KONUSU
        moneyRewards = 3000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 30, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
    {
        taskId = 3, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 20 Bonitos", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "bonitosfish", -- GÖREV KONUSU
        moneyRewards = 4000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 20, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
    {
        taskId = 4, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 15 Garfish", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "garfish", -- GÖREV KONUSU
        moneyRewards = 5000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 15, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
    {
        taskId = 5, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 10 Perch", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "perch", -- GÖREV KONUSU
        moneyRewards = 6000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 10, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
    {
        taskId = 6, -- GÖREV NUMARASI (TÜM GÖREVLER FARKLI VE SIRALI OLARAK NUMARALANDIRILMALIDIR)
        taskName = "Catch 20 Shark", -- MENÜDE GÖRÜNDÜĞÜ GİBİ GÖREVİN ADI
        itemName = "sharkfish", -- GÖREV KONUSU
        moneyRewards = 15000, -- GÖREVİN ÖDÜLÜ PARA
        xpRewards = 500, -- GÖREV DP ÖDÜLÜ
        requiredCount = 20, -- GÖREVİ TAMAMLAMAK İÇİN GEREKLİ YAKALANAN BALIK SAYISI
        taskDescription = "After successfully completing the task, get your prize.",
    },
}

Config.Fishes = { -- /FISH BALIK MENÜSÜ AYARLARI
    {
        id = 1, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Anchovy", -- BALIĞIN GÖRÜNEN ADI
        itemName = "anchovy", -- ÖĞE ADI BALIK
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 1, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/anchovyMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can keep this fish on the pier, you need a 1st level or higher fishing rod to catch the fish!"
    },
    {
        id = 2, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Small Bluefish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "smallbluefish", -- ÖĞE ADI BALIK
        requiredLevel = 2, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 2, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/smallbluefishMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish on the pier, you need a fishing rod of level 2 or higher to catch the fish!"
    },
    {
        id = 3, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Bluefish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "bluefish", -- ÖĞE ADI BALIK
        requiredLevel = 5, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 3, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/bluefishMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish on the pier, you need a fishing rod of level 3 or higher to catch the fish!"
    },
    {
        id = 4, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Bonitos", -- BALIĞIN GÖRÜNEN ADI
        itemName = "bonitosfish", -- ÖĞE ADI BALIK
        requiredLevel = 9, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 3, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/bonitosfishMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish on the pier, you need a fishing rod of level 3 or higher to catch the fish!"
    },
    {
        id = 5, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Garfish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "garfish", -- ÖĞE ADI BALIK
        requiredLevel = 11, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 4, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/garfishMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish on the pier, you need a fishing rod of level 4 or higher to catch the fish!"
    },
    {
        id = 6, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Perch", -- BALIĞIN GÖRÜNEN ADI
        itemName = "perch", -- ÖĞE ADI BALIK
        requiredLevel = 13, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 5, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Legal", -- BALIK TÜRÜ
        image = "./css/imgs/perchMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish on the pier, you need a fishing rod of level 5 or higher to catch the fish!"
    },
    {
        id = 7, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Caretta Caretta", -- BALIĞIN GÖRÜNEN ADI
        itemName = "carettacaretta", -- ÖĞE ADI BALIK
        requiredLevel = 15, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 4, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Illegal", -- BALIK TÜRÜ
        image = "./css/imgs/carettaMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish offshore, to catch this fish you need a fishing rod of level 4 and above!"
    },
    {
        id = 8, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Pant Fish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "pantfish", -- ÖĞE ADI BALIK
        requiredLevel = 18, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 4, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Illegal", -- BALIK TÜRÜ
        image = "./css/imgs/pantfishMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish offshore, to catch this fish you need a fishing rod of level 4 and above!"
    },
    {
        id = 9, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        fishName = "Shark", -- BALIĞIN GÖRÜNEN ADI
        itemName = "sharkfish", -- ÖĞE ADI BALIK
        requiredLevel = 20, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        requiredRodLvl = 5, -- BALIK YAKALAMAK İÇİN KULLANILMASI GEREKEN OLTA SEVİYESİ VE ÜZERİNDEKİLER
        fishPrice = 10, -- BALIK SATIŞ FİYATI
        onFishMenu = true, -- /FISH MENÜDE GÖRÜNÜYOR VEYA GÖRÜNMÜYOR - DOĞRU: GÖRÜNÜYOR _ YANLIŞ: GÖRÜNMÜYOR
        fishType = "Illegal", -- BALIK TÜRÜ
        image = "./css/imgs/sharkMiddle.png", -- BALIK MENÜSÜNDEKİ BALIK RESMİ
        description = "You can catch this fish offshore, to catch this fish you need a fishing rod of level 5 and above!"
    },      
}

Config.sellMenuItems = { -- BALIK SATIŞ MENÜSÜNDEKİ BALIK
    {
        id = 1, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Tiny Fish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "fish", -- ÖĞE ADI BALIK
        fishPrice = 40, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/fish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 2, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Anchovy", -- BALIĞIN GÖRÜNEN ADI
        itemName = "anchovy", -- ÖĞE ADI BALIK
        fishPrice = 60, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/anchovy.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 3, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 2, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Small Bluefish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "smallbluefish", -- ÖĞE ADI BALIK
        fishPrice = 80, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/smallbluefish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 4, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 5, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Bluefish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "bluefish", -- ÖĞE ADI BALIK
        fishPrice = 100, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/bluefish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 5, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 9, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Bonitos", -- BALIĞIN GÖRÜNEN ADI
        itemName = "bonitosfish", -- ÖĞE ADI BALIK
        fishPrice = 120, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/bonitosfish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 6, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 11, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Garfish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "garfish", -- ÖĞE ADI BALIK
        fishPrice = 140, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/garfish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 7, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 13, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Perch", -- BALIĞIN GÖRÜNEN ADI
        itemName = "perch", -- ÖĞE ADI BALIK
        fishPrice = 160, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/perch.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 8, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 15, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Caretta Caretta", -- BALIĞIN GÖRÜNEN ADI
        itemName = "carettacaretta", -- ÖĞE ADI BALIK
        fishPrice = 220, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/carettacaretta.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 9, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 18, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Pant Fish", -- BALIĞIN GÖRÜNEN ADI
        itemName = "pantfish", -- ÖĞE ADI BALIK
        fishPrice = 250, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/pantfish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 10, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 20, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Shark", -- BALIĞIN GÖRÜNEN ADI
        itemName = "sharkfish", -- ÖĞE ADI BALIK
        fishPrice = 300, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/sharkfish.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 11, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "White Pearl", -- BALIĞIN GÖRÜNEN ADI
        itemName = "whitepearl", -- ÖĞE ADI BALIK
        fishPrice = 200, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/whitepearl.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },    
    {
        id = 12, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Blue Pearl", -- BALIĞIN GÖRÜNEN ADI
        itemName = "bluepearl", -- ÖĞE ADI BALIK
        fishPrice = 270, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/bluepearl.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },   
    {
        id = 13, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Red Pearl", -- BALIĞIN GÖRÜNEN ADI
        itemName = "redpearl", -- ÖĞE ADI BALIK
        fishPrice = 340, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/redpearl.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },   
    {
        id = 14, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ)
        fishName = "Yellow Pearl", -- BALIĞIN GÖRÜNEN ADI
        itemName = "yellowpearl", -- ÖĞE ADI BALIK
        fishPrice = 410, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/yellowpearl.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    },
    {
        id = 15, -- BALIK KİMLİĞİ (BÜTÜN BALIKLARIN KİMLİĞİ FARKLI VE SIRALI OLMALIDIR)
        requiredLevel = 1, -- BALIK TUTMAK İÇİN İSTENİLEN SEVİYE (Config.FishLevels'den DEĞİŞTİRMEYİ UNUTMAYINIZ))
        fishName = "Green Pearl", -- BALIĞIN GÖRÜNEN ADI
        itemName = "greenpearl", -- ÖĞE ADI BALIK
        fishPrice = 480, -- BALIK SATIŞ FİYATI
        shopImage = "./css/imgs/greenpearl.png", -- SATIŞ MENÜSÜNDEKİ BALIK RESMİ
    }, 
}
C = {}

C.Levels = {
    [1] = {
        requiredCalls = 0,
        CostPerMile = 250,
        randomBonus = false,
    },
    [2] = {
        requiredCalls = 0, -- Number of Minimum Valet Usage required before you can 
        CostPerMile = 250, -- Cost per Mile of Valet Travel
        randomBonus = false, -- if false, other variables like chance are not required
    },
    [3] = {
        requiredCalls = 10,
        CostPerMile = 400,

        randomBonus = true, -- Enable Random Discounts 
        bonusChance = 50, -- from 1 - 100
        bonusPerc = 15, -- percentage of total amount that will be discounted
    },
}

C.ClientCooldownTime = 2

C.MinimumDisforLevel = 300

C.StepChangeSpeed = 20.0

C.DriverNames = {
    "Daniel Cody", 
    "Tay Swizzle", 
    "Arlen Baumer", 
    "Barton Foreman", 
    "Nigel Mom",
    "Manuel Rockey", 
    "Grady Santora", 
    "Lupe Cypert", 
    "Nathanael Albrecht", 
    "Michal Truesdale", 
    "Hosea Mangione", 
    "Leonard Mattix", 
    "Clay Manson", 
    "Royce Sasson", 
    "Wes Erben", 
    "Lonnie Wendler", 
    "Dana Hornbuckle", 
    "Wally Byas", 
    "Hiram Hood", 
    "Lloyd Ledford", 
}
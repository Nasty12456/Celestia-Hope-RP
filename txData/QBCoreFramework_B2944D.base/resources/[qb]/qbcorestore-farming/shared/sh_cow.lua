CowShared = {
    StartPed = {
        name = "a_m_m_farmer_01",
        hash = GetHashKey("a_m_m_farmer_01"),
        coords = vector4(2310.53, 4884.83, 41.81, 48.09)
    },
    BlipSprite = 177,
    BlipColour = 0,
    BlipScale = 0.6,
    PerMilking = 4,
    MilkBottle = 5,

    Fields = {
        [1] = vector4(2264.78, 4895.07, 40.89, 120.62),
        [2] = vector4(2256.84, 4902.98, 40.78, 314.02),
        [3] = vector4(2249.41, 4910.73, 40.74, 44.81),
        [4] = vector4(2241.14, 4919.12, 40.78, 35.01),
        [5] = vector4(2232.96, 4927.01, 40.82, 34.74),
        [6] = vector4(2225.18, 4935.47, 40.91, 176.15),
        [7] = vector4(2243.35, 4872.68, 40.8, 312.97),
        [8] = vector4(2236.19, 4882.08, 40.96, 29.72),
        [9] = vector4(2227.93, 4889.65, 40.69, 222.84),
        [10] = vector4(2219.02, 4898.61, 40.75, 223.19),
        [11] = vector4(2212.12, 4905.61, 40.8, 37.88),
        [12] = vector4(2203.29, 4914.89, 40.6, 47.66)
    },

    -- Fields For Truck
    Fields2 = {
        [1] = vector4(2260.34, 4888.05, 40.9, 44.93),
        [2] = vector4(2251.32, 4897.09, 40.84, 45.04),
        [3] = vector4(2243.37, 4904.97, 40.69, 45.3),
        [4] = vector4(2235.63, 4912.64, 40.62, 45.28),
        [5] = vector4(2227.37, 4920.81, 40.75, 46.72),
        [6] = vector4(2218.91, 4928.95, 40.8, 45.67),
        [7] = vector4(2249.92, 4879.68, 40.89, 41.42),
        [8] = vector4(2243.04, 4887.46, 40.93, 43.64),
        [9] = vector4(2234.43, 4895.89, 40.64, 47.84),
        [10] = vector4(2226.07, 4903.61, 40.63, 47.16),
        [11] = vector4(2217.85, 4911.4, 40.69, 46.76),
        [12] = vector4(2207.89, 4922.27, 40.71, 53.29)
    },
    
    HayBaleCoords = vector3(2280.07, 4890.63, 41.58),
    ChurnLoc = vector3(2304.37, 4879.4, 41.81),
    CarLoc = vector4(2338.61, 4907.06, 41.98, 52.44),
    SellMilkCoord = vector3(1816.08, 4588.07, 36.51),
    VehicleReturnLoc = vector3(2330.96, 4912.8, 41.93),
    Vehicle = 'mule3',

    FinishMoney = math.random(2000, 2500),

    PaymentFunction = function(xPlayer, money)
        xPlayer.Functions.AddMoney('bank', money)
    end
}
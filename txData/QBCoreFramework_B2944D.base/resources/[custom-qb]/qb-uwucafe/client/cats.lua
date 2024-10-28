local function CreateCafeCats()
    for _, catData in pairs(Config.CatSpawns) do
        RequestModel(Config.CatModel)
        while not HasModelLoaded(Config.CatModel) do
            Wait(0)
        end
        
        local cat = CreatePed(28, Config.CatModel, catData.coords.x, catData.coords.y, catData.coords.z, catData.coords.w, false, false)
        SetEntityAsMissionEntity(cat, true, true)
        SetBlockingOfNonTemporaryEvents(cat, true)
        
        TaskStartScenarioInPlace(cat, catData.scenario, 0, true)
    end
end

CreateThread(function()
    CreateCafeCats()
end)

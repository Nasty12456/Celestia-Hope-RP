Config = Config or {}

-- Here you can set the framework that you are using
-- The framework that you are using will be detected automatically
Config.Framework = {
    -- You can set your EXACT framework script name here.
    -- For example, if you're using QBCore, you need to set this to "qb-core" (if you haven't changed the name of the script)
    -- Or, if you're using ESX, you need to set this to "es_extended" (if you haven't changed the name of the script)
    resourceName = "",

    -- List of events that will be triggered from s1n_lib
    esx          = {
        events = {
            getSharedObject = "esx:getSharedObject",
            addonAccount    = {
                getSharedAccount = "esx_addonaccount:getSharedAccount",
            },
            playerLoaded    = "esx:playerLoaded",
            setJob          = "esx:setJob",
        }
    },
    qbCore       = {
        events = {
            onPlayerLoaded = "QBCore:Client:OnPlayerLoaded",
            onJobUpdate    = "QBCore:Client:OnJobUpdate",
            qbVehicleKeys = {
                acquireVehicleKeys = "qb-vehiclekeys:server:GiveVehicleKeys",
            },
        }
    }
}
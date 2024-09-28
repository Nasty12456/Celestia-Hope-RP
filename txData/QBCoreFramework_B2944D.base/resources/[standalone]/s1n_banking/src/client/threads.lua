local canOpenBankUI = false
local isTargetScriptUsed = Config.UseOxTarget or Config.UseQBTarget

CreateThread(function()
    -- Handle bank locations
    for key, location in pairs(Config.BankLocations) do
        if location.Blip.Active then
            exports[Config.ExportNames.s1nLib]:createBlip({
                position   = location.Position,
                sprite     = location.Blip.Sprite,
                scale      = location.Blip.Scale,
                color      = location.Blip.Color,
                shortRange = location.Blip.ShortRange,
                label      = location.Blip.Label
            })
        end

        if Config.UseOxTarget then
            if location.Ped.Active then
                RequestModel(location.Ped.Model)

                while not HasModelLoaded(location.Ped.Model) do
                    Wait(100)
                end

                local ped = CreatePed(0, location.Ped.Model, location.Ped.Position, location.Ped.Heading, false, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)

                exports[Config.ExportNames.oxTarget]:addLocalEntity(ped, {
                    {
                        name     = 'bank-' .. key,
                        icon     = 'fa-solid fa-arrow-right-to-bracket',
                        label    = Config.Translation.TARGET_TEXT_OPEN_BANK,
                        onSelect = function()
                            Functions:CheckOpenUI()
                        end
                    }
                })
            else
                exports[Config.ExportNames.oxTarget]:addBoxZone({
                    coords  = location.Position,
                    size    = vector3(1, 1, 1),
                    options = {
                        {
                            name     = 'bank-' .. key,
                            icon     = 'fa-solid fa-arrow-right-to-bracket',
                            label    = Config.Translation.TARGET_TEXT_OPEN_BANK,
                            onSelect = function()
                                Functions:CheckOpenUI()
                            end
                        }
                    }
                })
            end
        elseif Config.UseQBTarget then
            if location.Ped.Active then
                RequestModel(location.Ped.Model)

                while not HasModelLoaded(location.Ped.Model) do
                    Wait(100)
                end

                local ped = CreatePed(4, location.Ped.Model, location.Ped.Position, location.Ped.Heading, false, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                SetBlockingOfNonTemporaryEvents(ped, true)

                exports[Config.ExportNames.qbTarget]:AddTargetEntity(ped, {
                    options = {
                        {
                            icon   = 'fa-solid fa-arrow-right-to-bracket',
                            label  = Config.Translation.TARGET_TEXT_OPEN_BANK,
                            action = function()
                                Functions:CheckOpenUI()
                            end
                        }
                    }
                })
            else
                exports[Config.ExportNames.qbTarget]:AddBoxZone(
                        'bank-' .. key,
                        location.Position,
                        1.0,
                        1.0,
                        {
                            name      = 'bank-' .. key,
                            heading   = 0,
                            debugPoly = false,
                            minZ      = 36.0,
                            maxZ      = 38.0
                        }, {
                            options  = {
                                {
                                    icon   = 'fa-solid fa-arrow-right-to-bracket',
                                    label  = Config.Translation.TARGET_TEXT_OPEN_BANK,
                                    action = function()
                                        Functions:CheckOpenUI()
                                    end
                                }
                            },
                            distance = 2.5
                        }
                )
            end

        end
    end

    -- Handle ATMs
    if Config.UseOxTarget then
        exports[Config.ExportNames.oxTarget]:addModel(Config.AtmModels, {
            {
                name     = 'openbankatm',
                icon     = 'fa-solid fa-arrow-right-to-bracket',
                label    = Config.Translation.TARGET_TEXT_USE_ATM,
                onSelect = function()
                    Functions:CheckOpenUI()
                end
            }
        })
    elseif Config.UseQBTarget then
        exports[Config.ExportNames.qbTarget]:AddTargetModel(Config.AtmModels, {
            options = {
                {
                    icon   = 'fa-solid fa-arrow-right-to-bracket',
                    label  = Config.Translation.TARGET_TEXT_USE_ATM,
                    action = function()
                        Functions:CheckOpenUI()
                    end
                }
            }
        })
    else
        if exports[Config.ExportNames.s1nLib]:addKeyMapping({
            key         = Config.Keys.OpenUI.Key,
            description = Config.Translation.OPEN_UI_KEY_DESCRIPTION,
            canPress    = function()
                return canOpenBankUI
            end,
            onPressed   = function()
                Functions:CheckOpenUI()
            end,
        }) then
            Utils:Debug("Key mapping added")
        end
    end
end)

local function startNearBankLoop()
    Utils:Debug("Starting near bank loop")

    CreateThread(function()
        while canOpenBankUI do
            for _, location in pairs(Config.BankLocations) do
                if location.Marker.Active then
                    if #(GetEntityCoords(PlayerPedId()) - location.Position) < (location.Marker.Active and location.Marker.Distance or Config.Keys.OpenUI.UseDistance) then
                        DrawMarker(location.Marker.Type, location.Position, 0.0, 0.0, 0.0, location.Marker.Rotation[1], location.Marker.Rotation[2], location.Marker.Rotation[3], location.Marker.Scale, location.Marker.Scale, location.Marker.Scale, location.Marker.Color.R, location.Marker.Color.G, location.Marker.Color.B, location.Marker.Color.A, location.Marker.BobUpAndDown, location.Marker.FaceCamera, 2, nil, nil, false)
                    end
                end
            end

            if not isTargetScriptUsed then
                exports[Config.ExportNames.s1nLib]:drawHelpText(Config.Translation.OPEN_UI_HELP_TEXT:format(Config.Keys.OpenUI.Key))
            end

            Wait(0)
        end
    end)
end

CreateThread(function()
    while true do
        local isNearBank = false

        for _, location in pairs(Config.BankLocations) do
            if #(GetEntityCoords(PlayerPedId()) - location.Position) < (location.Marker.Active and location.Marker.Distance or Config.Keys.OpenUI.UseDistance) then
                isNearBank = true
            end
        end

        if not isTargetScriptUsed and not isNearBank then
            for _, model in pairs(Config.AtmModels) do
                local atm = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), Config.Keys.OpenUI.UseDistance, GetHashKey(model), false, false, false)

                if atm ~= 0 then
                    isNearBank = true
                end
            end
        end

        if isNearBank and not canOpenBankUI then
            canOpenBankUI = true

            startNearBankLoop()
        elseif not isNearBank and canOpenBankUI then
            canOpenBankUI = false
        end

        Wait(600)
    end
end)
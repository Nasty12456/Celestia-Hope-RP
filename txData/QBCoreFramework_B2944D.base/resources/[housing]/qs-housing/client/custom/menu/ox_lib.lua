function OpenGiveKeyMenu(players)
    local data = {}
    for k, v in pairs(players) do
        table.insert(data, {
            title = Lang('HOUSING_MENU_PLAYER') .. ' ' .. v.name.firstname .. ' ' .. v.name.lastname,
            onSelect = function()
                TriggerServerEvent('qb-houses:server:giveHouseKey', v.id, CurrentHouse)
            end
        })
    end

    lib.registerContext({
        id = 'give_key_menu',
        title = Lang('HOUSING_MENU_GIVE_KEY_TITLE'),
        options = data
    })

    lib.showContext('give_key_menu')
end

function OpenTakeKeyMenu()
    local data = {}

    TriggerServerCallback('qb-houses:server:getHouseKeyHolders', function(holders)
        if holders == nil or next(holders) == nil then
            SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_PERMITS'), 'inform')
            return
        else
            for k, v in pairs(holders) do
                table.insert(data, {
                    title = Lang('HOUSING_MENU_PLAYER') .. ' ' .. v.firstname .. ' ' .. v.lastname,
                    onSelect = function()
                        TriggerServerEvent('qb-houses:server:removeHouseKey', CurrentHouse, v)
                    end
                })
            end
        end

        lib.registerContext({
            id = 'take_key_menu',
            title = Lang('HOUSING_MENU_TAKE_KEY_TITLE'),
            options = data
        })
        lib.showContext('take_key_menu')
    end, CurrentHouse)
end

function InsideInteractionsMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_DECORATE_TITLE'),
            description = Lang('HOUSING_MENU_DECORATE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:decorate')
            end
        },
        {
            title = Lang('HOUSING_MENU_WARDROBE_TITLE'),
            description = Lang('HOUSING_MENU_WARDROBE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:setLocation', { id = 'setoutfit' })
            end
        },
        {
            title = Lang('HOUSING_MENU_STASH_TITLE'),
            description = Lang('HOUSING_MENU_STASH_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:setLocation', { id = 'setstash' })
            end
        },
        -- {
        --     title = 'Set Tv Location',
        --     description = 'Set Tv Location',
        --     onSelect = function(args)
        --         TriggerEvent('qb-houses:client:setLocation', { id = 'setTv' })
        --     end
        -- },
        -- {
        --     title = 'Set Sit Location',
        --     description = 'Set Sit Location',
        --     onSelect = function(args)
        --         TriggerEvent('qb-houses:client:setLocation', { id = 'setSit' })
        --     end
        -- },
    }
    if GetResourceState('houses') == 'started' then
        table.insert(data, {
            title = Lang('HOUSING_MENU_CHARGE_TITLE'),
            description = Lang('HOUSING_MENU_CHARGE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:setLocation', { id = 'setCharge' })
            end
        })
    end
    if Config.Houses[CurrentHouse].ipl then
        table.insert(data, {
            title = Lang('HOUSING_MENU_TYPE_TITLE'),
            description = Lang('HOUSING_MENU_TYPE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:changeHouseType')
            end
        })
    end

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openHouseMenu()
        end
    })

    lib.registerContext({
        id = 'inside_interactions',
        title = Lang('HOUSING_MENU_GENERAL_INSIDE_TITLE'),
        options = data
    })

    lib.showContext('inside_interactions')
end

function OwnerInteractionsMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_RENTS_TITLE'),
            description = Lang('HOUSING_MENU_RENTS_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:showRents')
            end,
            disabled = not Config.EnableRentable
        },
        {
            title = Lang('HOUSING_MENU_LEAVE_TITLE'),
            description = Lang('HOUSING_MENU_LEAVE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:leaseHouse')
            end,
            disabled = not Config.EnableRentable
        },
        {
            title = Lang('HOUSING_MENU_DISSAPOSSES_TITLE'),
            description = Lang('HOUSING_MENU_DISSAPOSSES_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:disspossesHouse')
            end,
            disabled = not Config.EnableRentable
        },
        {
            title = Lang('HOUSING_MENU_SELL_TITLE'),
            description = Lang('HOUSING_MENU_SELL_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:sellInteractionMenu')
            end
        },
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openHouseMenu()
        end
    })

    lib.registerContext({
        id = 'owner_interactions',
        title = Lang('HOUSING_MENU_GENERAL_OWNER_TITLE'),
        options = data
    })

    lib.showContext('owner_interactions')
end

function sellInteractionMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_SELL_PLAYER_TITLE'),
            description = Lang('HOUSING_MENU_SELL_PLAYER_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:sellHouseToPlayer')
            end
        },
        {
            title = Lang('HOUSING_MENU_SELL_BANK_TITLE'),
            description = Lang('HOUSING_MENU_SELL_BANK_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:sellHouse')
            end
        },
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            TriggerEvent('qb-houses:ownerInteractionsMenu')
        end
    })

    if CurrentHouseData.purchasable then
        table.insert(data, {
            title = Lang('HOUSING_MENU_CANCEL_TITLE'),
            description = Lang('HOUSING_MENU_CANCEL_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:cancelSellHouse')
            end
        })
    end

    lib.registerContext({
        id = 'sell_house',
        title = Lang('HOUSING_MENU_GENERAL_SELL_TITLE'),
        options = data
    })

    lib.showContext('sell_house')
end

RegisterNetEvent('qb-houses:insideInteractionsMenu', InsideInteractionsMenu)
RegisterNetEvent('qb-houses:ownerInteractionsMenu', OwnerInteractionsMenu)
RegisterNetEvent('qb-houses:sellInteractionMenu', sellInteractionMenu)

function openHouseMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_INTERACTIONS_TITLE'),
            description = Lang('HOUSING_MENU_INTERACTIONS_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:insideInteractionsMenu')
            end
        },
        {
            title = Lang('HOUSING_MENU_KEYS_TITLE'),
            description = Lang('HOUSING_MENU_KEYS_OPTION'),
            onSelect = function(args)
                giveKeysMenu()
            end
        },
        {
            title = Lang('HOUSING_MENU_DOOR_TITLE'),
            description = Lang('HOUSING_MENU_DOOR_OPTION'),
            onSelect = function(args)
                doorsMenu()
            end
        },
    }
    if not CurrentHouseData.isOfficialOwner then
        table.insert(data, {
            title = Lang('HOUSING_MENU_LEAVE_RENT_TITLE'),
            description = Lang('HOUSING_MENU_LEAVE_RENT_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:leftHouse')
            end
        })
    end
    if CurrentHouseData.isOfficialOwner then
        table.insert(data, {
            title = Lang('HOUSING_MENU_ADVANCED_TITLE'),
            description = Lang('HOUSING_MENU_ADVANCED_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:ownerInteractionsMenu')
            end
        })
    end
    lib.registerContext({
        id = 'house_menu',
        title = Lang('HOUSING_MENU_GENERAL_HOUSE_TITLE'),
        options = data
    })
    lib.showContext('house_menu')
end

function giveKeysMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_GIVE_KEYS_TITLE'),
            description = Lang('HOUSING_MENU_GIVE_KEYS_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:giveHouseKey')
            end
        },
        {
            title = Lang('HOUSING_MENU_TAKE_KEYS_TITLE'),
            description = Lang('HOUSING_MENU_TAKE_KEYS_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:removeHouseKey')
            end
        },
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openHouseMenu()
        end
    })

    lib.registerContext({
        id = 'give_keys_option',
        title = Lang('HOUSING_MENU_KEYS_TITLE'),
        options = data
    })
    lib.showContext('give_keys_option')
end

function doorsMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_BLOCK_DOOR_TITLE'),
            description = Lang('HOUSING_MENU_BLOCK_DOOR_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:toggleDoorlock')
            end
        },
        {
            title = Lang('HOUSING_MENU_FIX_DOOR_TITLE'),
            description = Lang('HOUSING_MENU_FIX_DOOR_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:ResetHouse')
            end
        },
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openHouseMenu()
        end
    })

    lib.registerContext({
        id = 'give_keys_option',
        title = Lang('HOUSING_MENU_DOOR_TITLE'),
        options = data
    })
    lib.showContext('give_keys_option')
end

RegisterNetEvent('qb-houses:client:showRents', function()
    local house = CurrentHouse
    if not house then
        return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSE'), 'error')
    end

    TriggerServerCallback('qb-houses:getHouseRents', function(rents)
        if #rents == 0 then
            return SendTextMessage(Lang('HOUSING_NOTIFICATION_RENT_NOT_PAY'), 'inform')
        end

        local data = {}
        for k, v in pairs(rents) do
            local text = string.format([[
                %s %s<br>
                %s %s
            ]],
                Lang('HOUSING_MENU_GET_RENT_NAME'), v.name,
                Lang('HOUSING_MENU_GET_RENT_PLAYER'), v.payed == 1 and '<span style="color:green">' .. Lang('HOUSING_MENU_YES') .. '</span>' or '<span style="color:red">' .. Lang('HOUSING_MENU_NO') .. '</span>'
            )
            table.insert(data, {
                title = Lang('HOUSING_MENU_RENT') .. ' #' .. k,
                context = text
            })
        end

        -- Back button
        table.insert(data, {
            title = Lang('HOUSING_MENU_BACK'),
            onSelect = function(args)
                TriggerEvent('qb-houses:ownerInteractionsMenu')
            end
        })

        lib.registerContext({
            id = 'show_rents_menu',
            title = Lang('HOUSING_MENU_RENT'),
            options = data
        })

        lib.showContext('show_rents_menu')
    end, house)
end)


RegisterNetEvent('qb-houses:leaseHouse', function()
    local house = CurrentHouse
    if not house then
        return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSE'), 'error')
    end

    local input = lib.inputDialog(Lang('HOUSING_MENU_SELECT_PRICE'), {
        { type = 'number', label = Lang('HOUSING_MENU_PRICE'), description = Lang('HOUSING_MENU_PRICE_NUMBERS') },
    })
    if not input then
        return
    end

    local price = tonumber(input[1])
    if not price then
        return
    end

    TriggerServerEvent('qb-houses:leaseHouse', house, price)
end)


RegisterNetEvent('qb-houses:leftHouse', function()
    local house = CurrentHouse
    if not house then return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSE'), 'error') end
    TriggerServerEvent('qb-houses:leftHouse', house)
end)

RegisterNetEvent('qb-houses:sellHouseToPlayer', function()
    local house = CurrentHouse
    if not house then
        return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSE'), 'error')
    end

    local input = lib.inputDialog(Lang('HOUSING_MENU_SELECT_PRICE'), {
        { type = 'number', label = Lang('HOUSING_MENU_PRICE'), description = Lang('HOUSING_MENU_PRICE_NUMBERS') },
    })
    if not input then
        return
    end

    local price = tonumber(input[1])
    if not price then
        return
    end

    TriggerServerEvent('qb-houses:sellHouseToPlayer', house, price)
end)


function openRealeStateMenu()
    local data = {
        {
            title = Lang('HOUSING_MENU_CREATE_HOUSE_TITLE'),
            description = Lang('HOUSING_MENU_CREATE_HOUSE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createHouseMenu')
            end
        },
        {
            title = Lang('HOUSING_MENU_CREATE_OBJECT_TITLE'),
            description = Lang('HOUSING_MENU_CREATE_OBJECT_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createObjects')
            end
        },
        {
            title = Lang('HOUSING_MENU_EDIT_HOUSES_TITLE'),
            description = Lang('HOUSING_MENU_EDIT_HOUSES_OPTION'),
            onSelect = function(args)
                editCreatedHouse()
            end
        },
    }

    if Config.Garage ~= 'standalone' then
        table.insert(data, {
            title = Lang('HOUSING_MENU_CREATE_GARAGE_TITLE'),
            description = Lang('HOUSING_MENU_CREATE_GARAGE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:addGarage')
            end
        })
    end

    lib.registerContext({
        id = 'create_menu',
        title = Lang('HOUSING_MENU_REALESTATE_MENU'),
        options = data
    })
    lib.showContext('create_menu')
end

function editCreatedHouse()
    local house = CurrentHouse or Lang('HOUSING_MENU_NONE')
    local data = {
        {
            title = Lang('HOUSING_MENU_EXTERIOR_TITLE'),
            description = Lang('HOUSING_MENU_EXTERIOR_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:client:setPolyZone')
            end
        },
        {
            title = Lang('HOUSING_MENU_EDIT_TITLE'),
            description = Lang('HOUSING_MENU_EDIT_OPTION'),
            onSelect = function(args)
                TriggerEvent('housing:editMLO')
            end
        },
        {
            title = Lang('HOUSING_MENU_TEST_TITLE'),
            description = Lang('HOUSING_MENU_TEST_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:setTestCoords')
            end
        },
        {
            title = Lang('HOUSING_MENU_REMOVE_TITLE'),
            description = Lang('HOUSING_MENU_REMOVE_OPTION') .. ' ' .. house,
            onSelect = function(args)
                TriggerEvent('qb-houses:deleteClosestHouse')
            end
        },
        {
            title = Lang('HOUSING_MENU_DELETE_OBJECT_TITLE'),
            description = Lang('HOUSING_MENU_DELETE_OBJECT_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:deleteClosestHouseObject')
            end
        }
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openRealeStateMenu()
        end
    })

    lib.registerContext({
        id = 'edit_created_house',
        title = Lang('HOUSING_MENU_EDIT_HOUSES_TITLE'),
        options = data
    })
    lib.showContext('edit_created_house')
end

RegisterNetEvent('qb-houses:createIslandObject', function()
    local tier, coords = RayCastSelector('customHouse', {
        isIsland = true,
        camOffset = 20.0
    })
    if not tier then return print('Canceled') end
    local model = Config.Islands[tier].model
    TriggerServerEvent('qb-houses:server:createHouseObject', coords, model)
end)

RegisterNetEvent('qb-houses:createObjects', function()
    local data = {
        {
            title = Lang('HOUSING_MENU_CREATE_OBJECT_HOUSE'),
            description = Lang('HOUSING_MENU_CREATE_OBJECT_HOUSE_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createHouseObject')
            end
        },
        {
            title = Lang('HOUSING_MENU_CREATE_OBJECT_ISLAND'),
            description = Lang('HOUSING_MENU_CREATE_OBJECT_ISLAND_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createIslandObject')
            end
        }
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openRealeStateMenu()
        end
    })

    lib.registerContext({
        id = 'create_object',
        title = Lang('HOUSING_MENU_CREATE_OBJECT_MENU_TITLE'),
        options = data
    })
    lib.showContext('create_object')
end)

RegisterNetEvent('qb-houses:createHouseMenu', function()
    local data = {
        {
            title = Lang('HOUSING_MENU_SHELL_TITLE'),
            description = Lang('HOUSING_MENU_SHELL_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createHouse', 'shell')
            end
        },
        {
            title = Lang('HOUSING_MENU_IPL_TITLE'),
            description = Lang('HOUSING_MENU_IPL_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createHouse', 'ipl')
            end
        },
        {
            title = Lang('HOUSING_MENU_MLO_TITLE'),
            description = Lang('HOUSING_MENU_MLO_OPTION'),
            onSelect = function(args)
                TriggerEvent('qb-houses:createHouse', 'mlo')
            end
        },
    }

    -- Back button
    table.insert(data, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            openRealeStateMenu()
        end
    })

    lib.registerContext({
        id = 'create_house',
        title = Lang('HOUSING_MENU_CREATE_HOUSES'),
        options = data
    })
    lib.showContext('create_house')
end)

RegisterNetEvent('qb-houses:createHouse', function(type)
    local input = lib.inputDialog(Lang('HOUSING_MENU_SELECT_PRICE'), {
        { type = 'number', label = Lang('HOUSING_MENU_PRICE'), description = Lang('HOUSING_MENU_PRICE_NUMBERS') },
    })

    if not input then return end
    local price = tonumber(input[1])
    TriggerEvent('qb-houses:client:createHouses', tonumber(price), type)
end)

function changeHouseType()
    if not EnteredHouse then return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_INSIDE'), 'error') end
    local iplData = Config.Houses[EnteredHouse].ipl
    local interiorId = iplData.theme.interiorId
    local interiorData = Config.IplData[iplData.houseName]
    if not interiorData then return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_THEMES'), 'error') end
    local ipl = interiorData.export()
    local menuThemes = table.deepclone(interiorData.themes)
    for k, v in pairs(menuThemes) do
        v.label = v.label .. ' $' .. v.price
        local themeInteriorId = ipl.Style.Theme[v.value].interiorId
        if themeInteriorId == interiorId then
            v.label = v.label .. ' - ' .. Lang('HOUSING_MENU_CURRENTLY')
        end
        v.onSelect = function(args)
            TriggerServerCallback('qb-houses:getDecoratePrice', function(payed)
                if not payed then return SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_MONEY'), 'error') end
                local theme = ipl.Style.Theme[v.value]
                TriggerServerEvent('qb-houses:UpdateIplTheme', theme, EnteredHouse)
            end, v.price)
        end
        v.title = v.label
    end

    -- Back button
    table.insert(menuThemes, {
        title = Lang('HOUSING_MENU_BACK'),
        onSelect = function(args)
            InsideInteractionsMenu()
        end
    })

    lib.registerContext({
        id = 'house_ipl_menu',
        title = Lang('HOUSING_MENU_IPL_MENU'),
        options = menuThemes
    })
    lib.showContext('house_ipl_menu')
end

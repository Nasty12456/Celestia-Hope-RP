Framework = Framework or {}

-- Get the jobs depending on the framework
-- @return table The jobs
function Framework:GetJobs()
    if self.currentFramework == "esx" then
        return self.object.Jobs
    elseif self.currentFramework == "qbcore" then
        return self.object.Shared.Jobs
    end

    return false
end

exports("getJobs", function()
    return Framework:GetJobs()
end)

-- Get the closestPlayers to a baseCoords within a maxDistance
-- @param options table The options (baseCoords: vector3, maxDistance: number, ignoreSources: table)
-- @return table The closest players
function Framework:GetClosestPlayers(options)
    if not options.maxDistance then
        options.maxDistance = 10.0
    end

    if not options.ignoreSources then
        options.ignoreSources = {}
    end

    local players = GetPlayers()
    local closestPlayers = {}

    for _, playerSource in ipairs(players) do
        -- Server ID is a string, convert it to a number to be able to use it in the GetPlayer functions from the frameworks (ESX, QBCore...)
        playerSource = tonumber(playerSource)

        if options.ignoreSources[playerSource] then
            goto continue
        end

        local playerPed = GetPlayerPed(playerSource)
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(options.baseCoords - playerCoords)

        if distance <= options.maxDistance then
            closestPlayers[#closestPlayers + 1] = {
                playerSource  = playerSource,
                frameworkName = self:GetPlayerFullName(playerSource),
                identifier   = self:GetPlayerIdentifier(playerSource),
            }
        end

        :: continue ::
    end

    return closestPlayers
end
exports("getClosestPlayers", function(baseCoords, maxDistance)
    return Framework:GetClosestPlayers(baseCoords, maxDistance)
end)
EventManager:registerEvent("getClosestPlayers", function(source, callback, options)
    if not options.ignoreSources then
        options.ignoreSources = {}
    end

    options.ignoreSources[source] = true

    local players = Framework:GetClosestPlayers(options)

    callback(players)
end)

-- Get the online players
-- @param options table The options (filterData: table)
-- @return table The online players according to the options passed
function Framework:GetOnlinePlayers(options)
    local players = GetPlayers()
    local onlinePlayers = {}

    for _, playerSource in ipairs(players) do
        playerSource = tonumber(playerSource)

        if options.filterData then
            local filterData = options.filterData

            if filterData.jobName then
                local job = self:GetPlayerJob(playerSource, {
                    mapData = {
                        name = true,
                    },
                })

                if job.name ~= filterData.jobName then
                    goto continue
                end
            end
        end

        onlinePlayers[#onlinePlayers + 1] = {
            playerSource  = playerSource,
        }

        :: continue ::
    end

    return onlinePlayers
end
exports("getOnlinePlayers", function(...)
    return Framework:GetOnlinePlayers(...)
end)
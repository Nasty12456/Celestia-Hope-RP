Framework = Framework or {}

-- Get the player job table depending on the framework
-- @return table|boolean The player job table or false if the framework is not found
function Framework:GetPlayerJob(options)
    if self.currentFramework == "esx" then
        local playerData = self.object.PlayerData

        if options then
            if options.lowercaseJobName then
                playerData.job.name = string.lower(playerData.job.name)
            end

            if options.lowercaseJobGradeName then
                playerData.job.grade_name = string.lower(playerData.job.grade_name)
            end

            -- Map the data if needed
            if options.mapData then
                local mappedData = {}

                for key, value in pairs(playerData.job) do
                    mappedData[key] = value
                end

                if options.mapData.grade then
                    mappedData.grade = {}

                    if options.mapData.grade.name then
                        mappedData.grade.name = playerData.job.grade_name
                    end
                end

                return mappedData
            end
        end

        return playerData.job
    elseif self.currentFramework == "qbcore" then
        local playerData = self.object.PlayerData

        if options then
            if options.lowercaseJobName then
                playerData.job.name = string.lower(playerData.job.name)
            end

            if options.lowercaseJobGradeName then
                playerData.job.grade.name = string.lower(playerData.job.grade.name)
            end

            -- Map the data if needed
            if options.mapData then
                local mappedData = {}

                for key, value in pairs(playerData.job) do
                    if options.mapData[key] then
                        mappedData[key] = value
                    end
                end

                if options.mapData.grade then
                    mappedData.grade = {}

                    if options.mapData.grade.name then
                        mappedData.grade.name = playerData.job.grade.name
                    end
                end

                return mappedData
            end
        end

        return playerData.job
    end

    Logger:error("Framework:GetPlayerJob() - Framework not found.")

    return false
end
exports("getPlayerJob", function(...)
    return Framework:GetPlayerJob(...)
end)

-- Get the player full name
-- @return string The player full name
function Framework:GetPlayerFullName()
    local fullName = EventManager:awaitTriggerServerEvent("getPlayerFullName")

    return fullName
end
exports("getPlayerFullName", function(...)
    return Framework:GetPlayerFullName(...)
end)
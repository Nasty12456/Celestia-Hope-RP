local YourWebhook = 'YOUR-WEBHOOK'  -- help: https://docs.brutalscripts.com/site/others/discord-webhook

function GetWebhook()
    return YourWebhook
end

RESCB("brutal_gangs:server:StaffCheck",function(source,cb,groups)
    local src = source

    cb(StaffCheck(src, groups))
end)

function StaffCheck(source, AdminGroups)
    local staff = false

    if Config.Core:upper() == 'ESX'then
        local player = Core.GetPlayerFromId(source)
        local playerGroup = player.getGroup()

        for i, Group in ipairs(AdminGroups) do
            if playerGroup == Group then
                staff = true
                break
            end
        end
    elseif Config.Core:upper() == 'QBCORE' then
        local player = Core.Functions.GetPlayer(source)

        for i, Group in ipairs(AdminGroups) do
            if Core.Functions.HasPermission(source, Group) or IsPlayerAceAllowed(source, Group) then
                staff = true
                break
            end
        end
    end

    return staff
end
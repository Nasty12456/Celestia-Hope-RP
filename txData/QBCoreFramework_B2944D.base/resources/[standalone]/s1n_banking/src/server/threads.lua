local TIME_BETWEEN_CREDIT_CHECKS = 3600000 -- 1 hour

CreateThread(function()
    while true do
        local activeCredits = Functions:GetActiveCredits()

        Utils:Debug("Checking for active credits")

        for _, credit in pairs(activeCredits) do
            local days = credit.duration / 86400
            local timePassed = math.ceil(exports[Config.ExportNames.s1nLib]:getTimeDifferenceWithNow(credit.date) / 86400)

            -- If the amount is not paid, check if it's time to remove the money
            if credit.amount ~= credit.paid then
                -- If the credit is weekly or monthly
                if (days <= 7 and timePassed == 7) or
                        (days > 7 and days < 30 and timePassed % 7 == 0)
                        or (days == 30 and timePassed == 30)
                        or (days > 30 and timePassed % 30 == 0) then
                    Functions:RemoveCreditMoney(credit)
                end
            end
        end

        Wait(TIME_BETWEEN_CREDIT_CHECKS)
    end
end)
Threads = {}

local TIME_BETWEEN_CREDIT_CHECKS = 3600000 -- 1 hour

function Threads:StartCheckCreditsLoop()
    CreateThread(function()
        while true do
            local activeCredits = Functions:GetActiveCredits()
            local currentTime = os.time()

            Utils:Debug(("Checking for active credits... (%s credits) "):format(#activeCredits))

            for _, credit in pairs(activeCredits) do
                -- If the amount is not paid, check if it's time to remove the money
                if credit.amount ~= credit.paid then
                    local paymentsOverdue, totalAmountDue = Functions:GetPaymentsOverdue(credit, currentTime)

                    if paymentsOverdue > 0 then
                        local success = Functions:RemoveCreditMoney(credit, totalAmountDue)
                        if success then
                            Utils:Debug(("Credit %s: %s payments processed, total %s/%s paid"):format(
                                credit.id, paymentsOverdue, credit.paid + totalAmountDue, credit.amount))
                        else
                            Utils:Debug(("Failed to process %s payments for credit %s"):format(paymentsOverdue, credit.id))
                        end
                    else
                        local nextPaymentDate = Functions:GetNextPaymentDate(credit, currentTime)
                        local daysUntilNextPayment = math.ceil((nextPaymentDate - currentTime) / 86400)
                        local durationInDays = credit.duration / 86400

                        Utils:Debug(("Credit %s is not due yet (next payment in %s days) (total duration %s days) (amount $%s) (paid $%s)"):format(
                            credit.id, daysUntilNextPayment, durationInDays, credit.amount, credit.paid
                        ))
                    end
                end
            end

            Utils:Debug("Credit checks done")

            Wait(TIME_BETWEEN_CREDIT_CHECKS)
        end
    end)
end

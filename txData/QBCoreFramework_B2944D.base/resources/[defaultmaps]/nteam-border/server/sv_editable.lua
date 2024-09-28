if Config.Framework == 'CUSTOM' then
    RegisterServerEvent('NTeam-border:server-pay')
    AddEventHandler('NTeam-border:server-pay',function(fast)
        if Config.Payment then
            -- insert here your logic for payment method
            -- fast is variable that comes from client presenting is driver going over speedlimit or not 
            -- we were using Config.NormalSpeed when speed is false and Config.FastSpeed when speed if true
        end
    end)

    if Config.debug then
        RegisterCommand("border",function(source)
            -- insert here your logic for command
            TriggerClientEvent('BorderControl',source)
        end)
    end
end
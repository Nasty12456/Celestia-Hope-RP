if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

PlayerJob = false
CreateThread(function()
    while not GetPlayerData() or not GetPlayerData().job do
        Wait(100)
    end
    PlayerJob = GetPlayerData().job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerJob = job.name
end)

function TriggerServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

function GetPlayerData()
    return ESX.GetPlayerData()
end

function GetJobName()
    return GetPlayerData()?.job?.name
end

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ProgressBar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if lib.progressCircle({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = {
                car = disableControls,
            },
            anim = {
                dict = animation.animDict,
                clip = animation.anim,
                flag = animation?.flag
            },
            prop = prop
        }) then
        onFinish()
    else
        onCancel()
    end
end

function SendTextMessage(msg, type)
    if type == 'inform' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'inform'
        })
    end
    if type == 'error' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'error'
        })
    end
    if type == 'success' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'success'
        })
    end
end

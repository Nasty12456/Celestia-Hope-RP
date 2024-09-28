local zr_menu_enabled = true

RegisterKeyMapping("zr-pausemenu:show", "", "keyboard", "ESCAPE")
RegisterCommand('zr-pausemenu:show', function ()
	if not IsPauseMenuActive() and not IsNuiFocused() then
		if not IsEntityDead(GetPlayerPed(-1)) then
			if (zr_menu_enabled) then
				zr_pausemenu_show()
			end
		end
	end
end)

RegisterKeyMapping("zr-pausemenu:openmap", "", "keyboard", "P")
RegisterCommand('zr-pausemenu:openmap', function ()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
end)

function zr_pausemenu_hide()
    StopScreenEffect(zr_config.zr_blur)
    DisableIdleCamera(false)
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	SendNUIMessage({
		type = "zr-pausemenu:hide",
		toggle = false,
	});
	DisplayRadar(true)
end

RegisterNetEvent('zr-pausemenu:hide')
AddEventHandler('zr-pausemenu:hide', function()
	zr_pausemenu_hide()
end)

RegisterNetEvent('zr-pausemenu:disable')
AddEventHandler('zr-pausemenu:disable', function()
	zr_menu_enabled = false
end)

RegisterNetEvent('zr-pausemenu:enable')
AddEventHandler('zr-pausemenu:enable', function()
	zr_menu_enabled = true
end)

function zr_call_logout()
	TriggerEvent('zr-multicharacter:start')
end
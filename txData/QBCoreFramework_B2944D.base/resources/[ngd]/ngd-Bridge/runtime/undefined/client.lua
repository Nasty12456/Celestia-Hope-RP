local Cache = {}
local Bridge = GetCurrentResourceName()

Cache.Set = function(key, value)
    if value ~= Cache[key] then
		TriggerEvent(('%s:Cache:%s'):format(Bridge, key), value, Cache[key])
		Cache[key] = value
		return true
	end
end

exports('Cache', function(key)
    return Cache[key]
end)

CreateThread(function()
    Cache.PlayerId = PlayerId()
    Cache.ServerId = GetPlayerServerId(Cache.PlayerId)

	while true do
		local Ped = PlayerPedId()

        Cache.Set('Ped', Ped)

        local Vehicle = GetVehiclePedIsIn(Ped, false)

        Cache.Set('Vehicle', Vehicle > 0 and Vehicle or false)

        local hasWeapon, CurrentWeapon = GetCurrentPedWeapon(Ped, true)
        Cache.Set('Weapon', hasWeapon and CurrentWeapon or false)

		Wait(100)
	end
end)
Config = nil

CreateThread(function()
	local config = lib.callback.await('chrp_discord:getConfig', 100)
	Config = config
	while Config == nil do
		Wait(5)
	end
	if Config.DiscordQueue.enabled then
		players, connectInfo = {}, {}
		local firstSpawn = true
		AddEventHandler("playerSpawned", function()
			if firstSpawn then
				TriggerServerEvent('chrp_discord:removeFromQueue')
				firstSpawn = false
			end
		end)
	end
end)
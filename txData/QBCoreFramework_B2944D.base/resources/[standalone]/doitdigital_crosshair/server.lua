RegisterCommand(Config.CrosshairMenuCommand, function(source, args)
	local player = source
	TriggerClientEvent('crosshair:useCommand', player)
end)
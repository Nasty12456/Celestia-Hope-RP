Config = {}

Config.Command = 'battlepass'			--Command to open the battlepass
Config.EnableLog = false				--Send discord logs? Check server_functions.lua to enter your discod webhook
Config.EnableWhitelist = false			--If true everyone can use battlepass, false if you want to be whitelisted
Config.IsEveryoneCriminal = false		--If true everyone can use the criminal battlepass, false if you want specific players [Check server_functions.lua function IsPlayerCriminal(player)]
Config.ShowNotificationMaxXp = true		--If true a notification will be shown if max xp is reached
Config.ImagePath = 'https://cfx-nui-'..GetCurrentResourceName()..'/html/images/items/'	--Path of images of items [image must be .png]

Config.BattlepassAccess = {		--Which type of admins can use the battlepass admin commands
	['superadmin']	= true,
	['admin']		= true
}

Config.CivilianXpPerMinute = 10			--How many civilian XP the player gets per minute
Config.MaxCivilianXpPerLevel = 1000		--Max civilian XP per level
Config.CivilianTimer = 60				--Interval in seconds to update the player's civilian XP

Config.CriminalXpPerMinute = 20			--How many criminal XP the player gets per minute
Config.MaxCriminalXpPerLevel = 1200		--Max criminal XP per level
Config.CriminalTimer = 60				--Interval in seconds to update the player's criminal XP

Config.Prices = {
	['civilian'] = {
		LevelPrice = 1000,				--Price to buy a civilian level
		resetPrice = 10000				--Price reset civilian battlepass
	},
	
	['criminal'] = {
		LevelPrice = 1000,				--Price to buy a criminal level
		resetPrice = 10000				--Price reset criminal battlepass
	},
}

--title:	The title
--item:		The spawnname of item (bread, water, etc...), weapon (WEAPON_PISTOL, WEAPON_CARBINERIFLE, etc...), money name (money, black_money etc...)
--amount:	Amount of item to give, money to give, weapon bullets to give
--type:		Available types: item, money, weapon
--desc:		The description

Config.CivilianLevelRewards = {
	{title = 'MONEY',					item = 'money',					amount = 500,		type = 'money',			desc = 'WIN 500$'},
	{title = 'WATER',					item = 'water',					amount = 5,			type = 'item',			desc = 'WIN X5 WATER'},
	{title = 'BREAD',					item = 'bread',					amount = 8,			type = 'item',			desc = 'WIN X8 BREAD'},
	{title = 'COPPER',					item = 'copper',				amount = 2,			type = 'item',			desc = 'WIN X2 COPPER'},
	{title = 'BANDAGE',					item = 'bandage',				amount = 1,			type = 'item',			desc = 'WIN X1 BANDAGE'},
	{title = 'MONEY',					item = 'money',					amount = 500,		type = 'money',			desc = 'WIN 500$'},
	{title = 'WATER',					item = 'water',					amount = 5,			type = 'item',			desc = 'WIN X5 WATER'},
	{title = 'BREAD',					item = 'bread',					amount = 8,			type = 'item',			desc = 'WIN X8 BREAD'},
	{title = 'COPPER',					item = 'copper',				amount = 2,			type = 'item',			desc = 'WIN X2 COPPER'},
	{title = 'BANDAGE',					item = 'bandage',				amount = 1,			type = 'item',			desc = 'WIN X1 BANDAGE'},
}

Config.CriminalLevelRewards = {
	{title = 'BLACK MONEY',				item = 'black_money',			amount = 1000,		type = 'money',			desc = 'WIN 1000 BLACK MONEY'},
	{title = 'CANNABIS',				item = 'cannabis',				amount = 5,			type = 'item',			desc = 'WIN X5 CANNABIS'},
	{title = 'MARIJUANA',				item = 'marijuana',				amount = 1,			type = 'item',			desc = 'WIN X5 MARIJUANA'},
	{title = 'PISTOL',					item = 'WEAPON_PISTOL',			amount = 100,		type = 'weapon',		desc = 'WIN A PISTOL WITH 100 BULLETS'},
	{title = 'CARBINE RIFLE',			item = 'WEAPON_CARBINERIFLE',	amount = 300,		type = 'weapon',		desc = 'WIN A CARBINE RIFLE WITH 300 BULLETS'},
	{title = 'BLACK MONEY',				item = 'black_money',			amount = 1000,		type = 'money',			desc = 'WIN 1000 BLACK MONEY'},
	{title = 'CANNABIS',				item = 'cannabis',				amount = 5,			type = 'item',			desc = 'WIN X5 CANNABIS'},
	{title = 'MARIJUANA',				item = 'marijuana',				amount = 1,			type = 'item',			desc = 'WIN X5 MARIJUANA'},
	{title = 'PISTOL',					item = 'WEAPON_PISTOL',			amount = 100,		type = 'weapon',		desc = 'WIN A PISTOL WITH 100 BULLETS'},
	{title = 'CARBINE RIFLE',			item = 'WEAPON_CARBINERIFLE',	amount = 300,		type = 'weapon',		desc = 'WIN A CARBINE RIFLE WITH 300 BULLETS'},
}

ESX = nil

if IsDuplicityVersion() then	--server-side
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	
	--ESX = exports['es_extended']:getSharedObject()
else							--client-side
	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Wait(0)
		end
	end)
	
	--ESX = exports['es_extended']:getSharedObject()
end
--############ REQUEST FRAMEWORK ############--

Framework = nil

if Config.Framework == "qb" then
	Framework = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "oldqb" then
	TriggerEvent('QBCore:GetObject', function(obj) Framework = obj end)
elseif Config.Framework == "esx" then
	Framework = exports['es_extended']:getSharedObject()
elseif Config.Framework == "oldesx" then
	TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
end

--############ FUNCTIONS ############--

function playerIdentifier(src)
    local identifier  = false

	for k,v in pairs(GetPlayerIdentifiers(src))do
		if string.sub(v, 1, string.len(Config.Identifier)) == Config.Identifier then
			return v
		end
	end

	return false
end

function isAdmin(identifier)
	for _, dc in pairs(Config.Admins) do
		if identifier == dc then
			return true
		end
	end

	return false
end

function registerServerCallback(...)
	if Config.Framework == "qb" or Config.Framework == "oldqb" then
		Framework.Functions.CreateCallback(...)
	else
		Framework.RegisterServerCallback(...)
	end
end

function IsPlayer(src)
	for _, player in pairs(players) do
		if player == src then
			return true
		end
	end

	return false
end

function getXPlayer(src)
	Wait(10)
	if Config.Framework == "qb"then
		return Framework.Functions.GetPlayer(src)
	elseif Config.Framework == "oldqb" then
		return Framework.Functions.GetPlayer(src)
	elseif Config.Framework == "esx" then
		return Framework.GetPlayerFromId(src)
	else
		return Framework.GetPlayerFromId(src)
	end
end

function getName(src)
	local xPlayer = getXPlayer(src)
	local fullname

	if Config.Framework == "esx" or Config.Framework == "oldesx" then
		fullname = xPlayer.getName()
	else
		local firstname = xPlayer.PlayerData.charinfo.firstname
		local lastname = xPlayer.PlayerData.charinfo.lastname
		fullname = firstname.." "..lastname
	end

	return fullname
end

function GetWinners()
	local maxWinners = tonumber(gift.winners)
	local allPlayers = GetPlayers() 

	if #allPlayers < maxWinners then
		maxWinners = #allPlayers
	end

	if #winnerss < maxWinners then
		if #players == 0 then
			return winnerss
		else
			local random = math.random(1, #players)
			if GetPlayerPed(random) == -1 then
				table.remove(players, random)
				return GetWinners()
			else
				table.insert(winnerss, {name = getName(players[random]), src = players[random]})
				table.remove(players, random)
				return GetWinners()
			end
		end
	else
		return winnerss
	end
end

function HasMoney(src)
	local joinCoss = tonumber(gift.joinCoss)
    local xPlayer = getXPlayer(src)

	if Config.Framework == "qb" or Config.Framework == "oldqb" then
        local money = xPlayer.PlayerData.money["cash"]

        if money >= joinCoss then
            xPlayer.Functions.RemoveMoney(Config.JoinMoneyType, joinCoss, "Join Coss")
			return true
        end
    else
        local money = xPlayer.getAccount('money').money

        if money >= joinCoss then
            xPlayer.removeAccountMoney(Config.JoinMoneyType == "cash" and "money" or "bank", joinCoss)
			return true
        end
    end

	return false
end

function mysqlQuery(query, params)
	if Config.MySQL == "oxmysql" then
		return exports["oxmysql"]:query_async(query, params)
	elseif Config.MySQL == "mysql-async" then
		local p = promise.new()

		exports['mysql-async']:mysql_execute(query, params, function(result)
			p:resolve(result)
		end)

		return Citizen.Await(p)
	elseif Config.MySQL == "ghmattimysql" then
		return exports['ghmattimysql']:executeSync(query, params)
	end
end

function table_size(tbl)
	local size = 0

	for k, v in pairs(tbl) do
		size = size + 1
	end

	return size
end

--############ CREATE PLATE ############--

local Charset = {}
local NumberCharset = {}

for i = 65, 90 do
	table.insert(Charset, string.char(i))
end
for i = 97, 122 do
	table.insert(Charset, string.char(i))
end
for i = 48, 57 do
	table.insert(NumberCharset, string.char(i))
end

function GeneratePlate()
	math.randomseed(GetGameTimer())

	local plate = string.upper(GetRandomNumber(1) .. GetRandomLetter(3) .. GetRandomLetter(3))

	local data = "player_vehicles"

	if Config.Framework == "qb" or Config.Framework == "oldqb" then
		data = "player_vehicles"
	else
		data = "owned_vehicles"
	end

	local isTaken = mysqlQuery(
		'SELECT plate FROM ' .. data
		.. ' WHERE plate = ?', {
			plate
		})[1]

	if isTaken then
		return GeneratePlate()
	end

	return plate:upper()
end

function GetRandomNumber(length)
	return length > 0 and GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)] or ''
end

function GetRandomLetter(length)
	return length > 0 and GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)] or ''
end

AddEventHandler('playerDropped', function (reason)
	local src = source

	for l, player in pairs(players) do
		if src == player then
			table.remove(players, k)
			local onlineplayers = GetPlayers()
			for _, onlineplayer in pairs(onlineplayers) do
				local onlineplayer = tonumber(onlineplayer)
				Wait(1)
				TriggerClientEvent("izzy_giveaway:refresh", onlineplayer, #players)
			end
		end
	end
end)
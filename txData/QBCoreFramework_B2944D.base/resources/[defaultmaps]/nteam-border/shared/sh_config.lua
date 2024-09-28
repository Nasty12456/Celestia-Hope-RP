Config = {
	Framework = 'ESX', -- (QB,ESX)
	-- don't touch it if you have default resource ( if you use QB change it to qb-core)
	FrameworkResource = 'es_extended', -- (es_extended, qb-core and if you have changed your qb-core or es_extended to something just insert it here )

	--[[
		If you want to use custom framework or any framework we dont support set Framework to CUSTOM, and FrameworkResource you can leave or make it empty
	]]

	debug = true, -- set this to false, when you are ready to use resource ( when it's enabled you can use command border to control borders )

	Target = 'none', -- if you don't want to use target set it to 'none' , supported targets (ox_target,qb-target) ( If you want to use custom target set it to 'CUSTOM' and configure it in cl_open.lua )
	ControlRooms = { -- insert as many as you want
		[1] = { coords = vector4(1705.7788, 1454.9409, 85.4949, 206.1096) },
	},

	-- jobs that can control border ( [job] = grade ( minimum grade that can control border) )
	Jobs = {
		['police'] = 2,
		['sheriff'] = 2,
	},

	IgnoreJobs = { -- for this jobs wont be charged when they cross border
		'police',
		'sheriff',
		'ambulance'
	},
	DispatchHighSpeed = false, -- If you want to enable dispatch notification set it to true
	DispatchLocked = false, -- If you want to enable dispatch ( if someone pass through border when its locked )
	Payment = true,	-- enable/disable payment
	-- amount of money to pay when going through border with normal speed and when you drive by very fast
	NormalSpeed = 100,
	FastSpeed = 1000,

	Speed = 60, -- speed in KPH or MPH
	KPH = true,

	policePedModel = 's_m_y_cop_01',
	policeVehicle = 'police',
	-- TRANSLATION
	Translate = {
		BorderControl = 'Border Control',
		ControlRoom = 'Control Border Gate',
		Fine = 'You have been charged $ ',
		Locked = 'Locked 🔒',
		Unlocked = 'Unlocked 🔓',
		NoAccess = 'You don\'t have access to this command',
	},
	-- set Tunnel on true if you are using our Tunnel map
	Tunnel = true,
	-- Set this to true if you are using only Tunnel map
	OnlyTunnel = false,
	--[[ VEHICLE CLASSES
		0: Compacts  
		1: Sedans  
		2: SUVs  
		3: Coupes  
		4: Muscle  
		5: Sports Classics  
		6: Sports  
		7: Super  
		8: Motorcycles  
		9: Off-road  
		10: Industrial  
		11: Utility  
		12: Vans  
		13: Cycles  
		14: Boats  
		15: Helicopters  
		16: Planes  
		17: Service  
		18: Emergency  
		19: Military  
		20: Commercial  
		21: Trains  
		22: Open Wheel
	]]
	VehicleClass = { -- set vehicle class to true if you dont want that class to pay when crossing border
		[0] = false,
		[1] = false,
		[2] = false,
		[3] = false,
		[4] = false,
		[5] = false,
		[6] = false,
		[7] = false,
		[8] = false,
		[9] = false,
		[10] = false,
		[11] = false,
		[12] = false,
		[13] = false,
		[14] = false,
		[15] = false,
		[16] = false,
		[17] = false,
		[18] = false,
		[19] = false,
		[20] = false,
		[21] = false,
		[22] = false,
	},
	-- New Feature ( If you want to lock all borders at ones leave it to true, and if you want to control each border separately set it to false )
	LockAll = true,
}

DispatchHighSpeed = function()
	-- insert here your custom dispatch event or export
end

DispatchLocked = function()
	-- insert here your custom dispatch event or export
end

ServerNotify = function(src,msg,type,duration)
	-- You can configure your notification here ( types are from ox_lib notifications )
	local data = {
		description = msg,
		type = type,
		duration = duration
	}
	TriggerClientEvent('ox_lib:notify', src, data)
end

--==================================================
--				BUSINESS PAYMENT
--==================================================

--[[	If you want money from border cross to go to any business account add here your function * ALSO IF YOU NEED HELP WITH FUNCTION OPEN TICKET * ]]

BusinessPayment = function(amount)
	-- add here your server event so money can goes to business account
	-- if you dont wanna use this option just leave function empty
end 
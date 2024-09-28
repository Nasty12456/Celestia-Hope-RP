Config = {}

Config.DefaultCrosshair = './images/crosshairs/1.png'

Config.DefaultSettings = {
	['type']			= 'custom',		--Crosshair types: custom, default, none [Be sure that this type of crosshair is true in Config.EnabledTypes]
	['showalways']		= false,		--If true custom crosshair will always be on
	['showcrossfps']	= true,			--If true crosshair will be shown while aiming first person
	['size']			= 50,			--The crosshair size [5-100]
	['alpha']			= 100			--The crosshair alpha [5-100]
}

Config.EnabledTypes = {
	['custom']	= true,					--If true custom crosshair will be available
	['default']	= true,					--If true default crosshair will be available
}

Config.CrosshairMenuCommand = 'crosshair'
Config.ResetCrosshairCommand = 'crosshair_reset'

Config.SniperRifles = {
	[`WEAPON_SNIPERRIFLE`]			= true,
	[`WEAPON_HEAVYSNIPER`]			= true,
	[`WEAPON_HEAVYSNIPER_MK2`]		= true,
	[`WEAPON_MARKSMANRIFLE`]		= true,
	[`WEAPON_MARKSMANRIFLE_MK2`]	= true,
	[`WEAPON_PRECISIONRIFLE`]		= true
}
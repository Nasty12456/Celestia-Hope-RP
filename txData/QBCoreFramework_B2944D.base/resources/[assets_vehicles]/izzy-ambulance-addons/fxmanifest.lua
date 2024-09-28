fx_version 'cerulean'
this_is_a_map "yes"
games {'gta5'}

author 'TTModz'
description 'TTModz'
version '3.1'

files {
	'carvariations.meta',
	'handling.meta',
	'vehicles.meta',

	'data/*.meta'
}

	data_file 'HANDLING_FILE'			'handling.meta'
	data_file 'VEHICLE_METADATA_FILE'	'vehicles.meta'
	data_file 'VEHICLE_VARIATION_FILE'	'carvariations.meta'

	data_file 'HANDLING_FILE'			'data/handling.meta'
	data_file 'VEHICLE_METADATA_FILE'	'data/vehicles.meta'
	data_file 'VEHICLE_VARIATION_FILE'	'data/carvariations.meta'
	

client_script 'vehicle_names.lua'

escrow_ignore {
    'vehicle_names.lua',
}

lua54 'yes'
dependency '/assetpacks'
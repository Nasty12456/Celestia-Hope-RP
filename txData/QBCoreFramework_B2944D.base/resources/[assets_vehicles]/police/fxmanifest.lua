fx_version 'cerulean'
game 'gta5'
 
name 'NASTY'
description 'POLICE CARS'
author 'Nasty'
version '1.0.1'
 
 
files {
    'audioconfig/*.dat151.rel',
	'audioconfig/*.dat54.rel',
	'audioconfig/*.dat10.rel',
	'sfx/**/*.awc',
    'data/**/*.meta'
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'

data_file 'AUDIO_SYNTHDATA' 'audioconfig/cvpiv8_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/cvpiv8_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/cvpiv8_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_cvpiv8'

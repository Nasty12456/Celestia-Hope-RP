fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'Kyros'
version '5.0.0'
description 'Made By Kyros | discord.gg/kyro'

dependencies { 
    'kyros-weapon-pack-v5', -- ⚠️PLEASE READ⚠️; Requires [kyros-weapon-pack-v5] to work properly.
}

files{
	'metas/**/*.meta'
}

data_file 'WEAPONCOMPONENTSINFO_FILE' 'metas/**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' 'metas/**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'metas/**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' 'metas/**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' 'metas/**/weapons.meta'


shared_scripts { 'versionconfig.lua' }

client_script { 'cl_weaponNames.lua' }

server_scripts { 'updater.lua' }


escrow_ignore {
    'cl_weaponNames.lua',  
    'versionconfig.lua',
}
dependency '/assetpacks'
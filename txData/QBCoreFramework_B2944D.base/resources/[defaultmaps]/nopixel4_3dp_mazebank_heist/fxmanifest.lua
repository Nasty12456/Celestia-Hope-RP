fx_version 'adamant'
games { 'gta5' }

author 'Denis3D, Synced3D and sanhje'
description 'Heist Maze Bank'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

files {
'3dp_mazebank_timecycles.xml'
}

data_file 'TIMECYCLEMOD_FILE' '3dp_mazebank_timecycles.xml'

escrow_ignore {
    'stream/**/*.ytd',
}
dependency '/assetpacks'
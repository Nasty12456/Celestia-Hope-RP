fx_version 'adamant'
game 'gta5'

author 'Denis3D, Synced3D and sanhje'
description 'Heist Art Gallery'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

escrow_ignore {
    'stream/**/*.ytd',
}

files {
    '3dp_gallery_timecycles.xml'
}

data_file 'TIMECYCLEMOD_FILE' '3dp_gallery_timecycles.xml'
dependency '/assetpacks'
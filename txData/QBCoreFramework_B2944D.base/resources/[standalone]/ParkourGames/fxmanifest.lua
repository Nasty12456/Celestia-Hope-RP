fx_version 'cerulean'
game 'gta5'

name 'ParkourGanmes'
description 'Complement of Parkour By Bodhix'
author 'Bodhix'
version '1.0.0'

lua54 'yes'

client_scripts {
    'Client/Activities.lua',
}

server_scripts {
    'server/games_sv.lua',
}

dependencies {
    'BodhixPK'
}






dependency '/assetpacks'
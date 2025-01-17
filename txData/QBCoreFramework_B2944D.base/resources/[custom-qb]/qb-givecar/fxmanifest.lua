fx_version 'cerulean'

game 'gta5'

author 'Giana - github.com/Giana'
description 'qb-givecar'
version '1.1.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

dependencies {
    'qb-core'
}

lua54 'yes'

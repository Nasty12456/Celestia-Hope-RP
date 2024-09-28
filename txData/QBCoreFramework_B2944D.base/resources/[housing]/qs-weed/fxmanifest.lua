fx_version 'cerulean'

games { 'gta5' }

lua54 'yes'

shared_script {
    '@ox_lib/init.lua',
    'shared/*.lua',
    'locales/*.lua'
}

client_scripts {
    'client/**/**/**.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/**/**/**.lua'
}

dependencies {
    'ox_lib'
}

escrow_ignore {
    'shared/config.lua',
    'locales/*.lua',
    'client/custom/**/**.lua',
    'server/custom/**/**.lua'
}

dependency '/assetpacks'
fx_version 'adamant'

game 'gta5'

author "gener4l"

lua54 'yes'

description 'izzy.tebex.io'

ui_page "html/index.html"

files {
    'html/**/**.**'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    "notify.lua"
}

client_script { 
    "main/client.lua",
}

server_script { 
    '@mysql-async/lib/MySQL.lua',
    "main/server.lua",
}

escrow_ignore {
    'config.lua',
    "main/*.lua",
}

dependencies {
    'ox_lib'
}

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
dependency '/assetpacks'
fx_version "cerulean"
game "gta5"
author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



shared_scripts {
	"@ox_lib/init.lua",
	"config.lua",
	"locales/locale.lua",
    "locales/translations/*.lua",
    "core/shared.lua"
}

client_scripts {
	"bridge/**/client.lua",
	"modules/**/client.lua",
    "core/client.lua"
}

server_scripts {
	"bridge/**/server.lua",
	"modules/**/server.lua",
}

lua54 'yes'

escrow_ignore {
	"locales/**/*.*",
	"config.lua"
}
dependency '/assetpacks'
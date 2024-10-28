fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Celestia Hope Roleplay Discord Bot inspired by Wasabi Scripts'
version '1.0.0'
author 'Stardawg'

client_scripts {
  'client/*.lua'
}

server_scripts {
  'config.lua',
  'server/*.lua'
}

shared_script '@ox_lib/init.lua'

dependencies {
  'ox_lib'
}
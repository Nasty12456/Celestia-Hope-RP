fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'NTeam Dev'
version '1.0.1'

shared_script {
  '@ox_lib/init.lua',
  'shared/sh_*.lua',
}

client_scripts {
   "client/cl_*.lua"
}

server_scripts {
   "server/sv_*.lua"
}

escrow_ignore {
   'shared/sh_*.lua',
   'client/cl_open.lua',
   'server/sv_editable.lua'
}
dependency '/assetpacks'
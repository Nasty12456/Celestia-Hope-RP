fx_version "cerulean"
game "gta5"
lua54 'yes'
shared_script "config.lua"
client_scripts {
    "editable_client.lua",
    "client.lua",
}
server_scripts {
    "editable_server.lua",
    "server.lua",
    -- "@mysql-async/lib/MySQL.lua",
    "@oxmysql/lib/MySQL.lua",
     -- if you are using oxmysql
}
ui_page "ui/index.html"
files {"ui/**", "data/*.meta", "stream/vehicle_paint_ramps.ytd"}
data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file "FIVEM_LOVES_YOU_447B37BE29496FA0" "data/carmodcols.ymt"
escrow_ignore {
    "*.*"
}
dependency '/assetpacks'
dependency '/assetpacks'
Thank you for purchasing rtx_themepark_dlc we're grateful for your support. If you'd ever have a question and / or need our help, please reach out to us by sending an email or go ahead and create a ticket on our discord: https://discord.gg/P6KdaDpgAk


Install instructions (Standalone):
1. Put rtx_themepark_dlc and rtx_themepark_dlc_objects folder to your resources
2. Open config.lua file
3. Configure your config.lua to your preferences
4. Upload sql sql.sql file to your mysql database. (if you want to use theme park management)
5. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
6. Put rtx_themepark_dlc and rtx_themepark_dlc_objects to the server.cfg

Install instructions (QBCore):
1. Put rtx_themepark_dlc and rtx_themepark_dlc_objects folder to your resources
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "qbcore"
4. Configure your config.lua to your preferences
5. Upload sql sql.sql file to your mysql database. (if you want to use theme park management)
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/LWaYxz7.png) remove -- from line 11, or replace line 11 with '@oxmysql/lib/MySQL.lua',
7. Put rtx_themepark_dlc and rtx_themepark_dlc_objects to the server.cfg

Install instructions (ESX):
1. Put rtx_themepark_dlc and rtx_themepark_dlc_objects folder to your resources.
2. Open config.lua file
3. Replace Config.Framework = "standalone" with Config.Framework = "esx"
4. Configure your config.lua to your preferences
5. Upload sql sql.sql file to your mysql database. (if you want to use theme park management)
6. Open fxmanifest.lua and edit it same like on this screenshot (https://i.imgur.com/yoULcX4.png) remove -- from line 10, or replace line 10 with '@mysql-async/lib/MySQL.lua',
7. Put rtx_themepark_dlc and rtx_themepark_dlc_objects to the server.cfg

Common issues:

-----------------------------
2 Ferris wheels in Theme Park:

If you see 2 Ferris Wheel, it is because you have some IPL loader on the server that loads the old wheel, you need to disable this IPL, here is an example how to disable the old Ferris Wheel in bob74_ipl

In bob74_ipl/gtav/base.lua at bottom remove RequestIpl("ferris_finale_anim")

From:
https://i.imgur.com/G8EGoYd.png

To:
https://i.imgur.com/yM7uJbW.png

-----------------------------
Need a key to start bumper cars:

You need to add to your script with vehicle keys, the whitelist for our vehicle, the vehicle name is: rtxbumper

-----------------------------
Object names for whitelist to anticheat:

prop_cs_hotdog_02
prop_cs_burger_01
prop_plastic_cup_02
sempre_delperropier_popcorn_box
sempre_delperropier_candycotton_prop
sempre_delperropier_balloon_b
sempre_delperropier_balloon_g
sempre_delperropier_balloon_p
sempre_delperropier_balloon_r
sempre_delperropier_bus_blue_screen
sempre_delperropier_bus_red_screen
sempre_delperropier_bus_target


License agreement / Terms of Service
1. Any purchase is non-refundable.
2. Each product is to be used on a singular server, with the exception of a test server.
3. Any form of redistribution of our content is considered copyright infringement.
4. If any of these rules are broken, legal actions can be taken.
© 2024 RTX Development, all rights reserved.
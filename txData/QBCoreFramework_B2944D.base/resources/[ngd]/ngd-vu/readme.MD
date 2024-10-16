# ███╗   ██╗ ██████╗ ██████╗       ██╗   ██╗██╗   ██╗
# ████╗  ██║██╔════╝ ██╔══██╗      ██║   ██║██║   ██║
# ██╔██╗ ██║██║  ███╗██║  ██║█████╗██║   ██║██║   ██║
# ██║╚██╗██║██║   ██║██║  ██║╚════╝╚██╗ ██╔╝██║   ██║
# ██║ ╚████║╚██████╔╝██████╔╝       ╚████╔╝ ╚██████╔╝
# ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝         ╚═══╝   ╚═════╝ 

# To install script:
#  -- Put ngd-Bridge into your resources folder and ensure it in your server.cfg. This script MUST BE STARTED AFTER all of your core resources such as inventory, target and framework.
#  -- Put ngd-vu into your resources folder and ensure it in your server.cfg. This script MUST BE STARTED AFTER ngd-Bridge.
#  -- Put the items below into your inventory.
#  -- Copy the images from the 'img' folder into your inventory's images folder.
#  -- Edit the Config.ImagePath = 'ox_inventory/web/images/' to match the path to your inventory images.
#  -- Add the job to your framework.

# -- DJ BOOTH -- #
# - If you want to use the included dj booth, make sure to download the included ngd-dj from Keymaster and follow the instructions for setup.

Script by deluce#0 | Nemesis Gaming Development

https://docs.nemesisgd.com

```lua

--OLD QB:
--Add the following job to your qb-core>shared>jobs.lua:


['vu'] = {
    label = 'Vanilla Unicorn',
    defaultDuty = true,
    grades = {
        ['0'] = { name = 'Employee', payment = 25 },
        ['1'] = { name = 'Owner', payment = 75, isboss = true },
    },
},

--NEW QB:
--Add the following job to your qb-core>shared>jobs.lua:


vu = {
    label = 'Vanilla Unicorn',
	type = 'VU',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Employee', payment = 25 },
		['1'] = { name = 'Owner', payment = 75, isboss = true },
	},
},

--ESX:  You must add the 'vu' job into your database.  You can try the following MYSQL snippet below, but it may not work depending on how you have your jobs table configured.

```

```sql

SELECT id FROM job_grades ORDER BY id DESC LIMIT 1 INTO @last_id;

SET @new_id = IFNULL(@last_id, 0) + 1;

INSERT INTO jobs (name, label, whitelisted) VALUES ('vu', 'Vanilla Unicorn', 0);

INSERT INTO job_grades (id, job_name, name, grade, label, salary, skin_male, skin_female)
VALUES (@new_id, 'vu', 'employee', 0, 'Employee', 100, '{}', '{}');

INSERT INTO job_grades (id, job_name, name, grade, label, salary, skin_male, skin_female)
VALUES (@new_id + 1, 'vu', 'boss', 1, 'Boss', 200, '{}', '{}');


```

```lua
-- OLD QB and QS Items: --

['ngd_vuice'] = {['name'] = 'ngd_vuice', ['label'] = 'Ice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuice.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumar'] = {['name'] = 'ngd_vumar', ['label'] = 'Martini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumar.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuem'] = {['name'] = 'ngd_vuem', ['label'] = 'Emerald', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuem.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucoffee'] = {['name'] = 'ngd_vucoffee', ['label'] = 'Coffee', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucoffee.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vurd'] = {['name'] = 'ngd_vurd', ['label'] = 'Red Devil', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vurd.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuds'] = {['name'] = 'ngd_vuds', ['label'] = 'Dark Side', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuds.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vureap'] = {['name'] = 'ngd_vureap', ['label'] = 'Reaper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vureap.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucocorum'] = {['name'] = 'ngd_vucocorum', ['label'] = 'Coconut Rum', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucocorum.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vubc'] = {['name'] = 'ngd_vubc', ['label'] = 'Blue Curacao', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vubc.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuom'] = {['name'] = 'ngd_vuom', ['label'] = 'Orange Martini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuom.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuvodka'] = {['name'] = 'ngd_vuvodka', ['label'] = 'Vodka', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuvodka.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vustout'] = {['name'] = 'ngd_vustout', ['label'] = 'Stout', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vustout.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vupj'] = {['name'] = 'ngd_vupj', ['label'] = 'Pineapple Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vupj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumartiniglass'] = {['name'] = 'ngd_vumartiniglass', ['label'] = 'Martini Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumartiniglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vump'] = {['name'] = 'ngd_vump', ['label'] = 'Magic Potion', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vump.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumgs'] = {['name'] = 'ngd_vumgs', ['label'] = 'Green Screwdriver', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumgs.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vubw'] = {['name'] = 'ngd_vubw', ['label'] = 'Black Widow', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vubw.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vublm'] = {['name'] = 'ngd_vublm', ['label'] = 'Blue Mojito', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vublm.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucdv'] = {['name'] = 'ngd_vucdv', ['label'] = 'Creme De Violette', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucdv.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuchambottle'] = {['name'] = 'ngd_vuchambottle', ['label'] = 'Champagne Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuchambottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumint'] = {['name'] = 'ngd_vumint', ['label'] = 'Mint', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumint.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuolive'] = {['name'] = 'ngd_vuolive', ['label'] = 'Olive', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuolive.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vurwbottle'] = {['name'] = 'ngd_vurwbottle', ['label'] = 'Red Wine Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vurwbottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucs'] = {['name'] = 'ngd_vucs', ['label'] = 'Caribbean Sunrise', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucs.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuhurricaneglass'] = {['name'] = 'ngd_vuhurricaneglass', ['label'] = 'Hurricane Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuhurricaneglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuwhitewine'] = {['name'] = 'ngd_vuwhitewine', ['label'] = 'White Wine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuwhitewine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuwineglass'] = {['name'] = 'ngd_vuwineglass', ['label'] = 'Wine Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuwineglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuemp'] = {['name'] = 'ngd_vuemp', ['label'] = 'Empress', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuemp.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vugrenadine'] = {['name'] = 'ngd_vugrenadine', ['label'] = 'Grenadine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vugrenadine.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_50sog'] = {['name'] = 'ngd_50sog', ['label'] = '50 Shades of Grey', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_50sog.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuwwbottle'] = {['name'] = 'ngd_vuwwbottle', ['label'] = 'White Wine Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuwwbottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vulime'] = {['name'] = 'ngd_vulime', ['label'] = 'Lime', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vulime.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucham'] = {['name'] = 'ngd_vucham', ['label'] = 'Champagne', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucham.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vulmar'] = {['name'] = 'ngd_vulmar', ['label'] = 'Lagoon Martini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vulmar.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vucbj'] = {['name'] = 'ngd_vucbj', ['label'] = 'Cranberry Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vucbj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuredwine'] = {['name'] = 'ngd_vuredwine', ['label'] = 'Red Wine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuredwine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vusp'] = {['name'] = 'ngd_vusp', ['label'] = 'Sweet Poison', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vusp.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumidori'] = {['name'] = 'ngd_vumidori', ['label'] = 'Midori', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumidori.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vurum'] = {['name'] = 'ngd_vurum', ['label'] = 'Rum', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vurum.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuoj'] = {['name'] = 'ngd_vuoj', ['label'] = 'Orange Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuoj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vufc'] = {['name'] = 'ngd_vufc', ['label'] = 'Fleur Collins', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vufc.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuchamglass'] = {['name'] = 'ngd_vuchamglass', ['label'] = 'Champagne Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuchamglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vulb'] = {['name'] = 'ngd_vulb', ['label'] = 'IPA', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vulb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vudb'] = {['name'] = 'ngd_vudb', ['label'] = 'Diamond Blue', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vudb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vulager'] = {['name'] = 'ngd_vulager', ['label'] = 'Lager', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vulager.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vutonic'] = {['name'] = 'ngd_vutonic', ['label'] = 'Tonic', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vutonic.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vulj'] = {['name'] = 'ngd_vulj', ['label'] = 'Lemon Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vulj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vubm'] = {['name'] = 'ngd_vubm', ['label'] = 'The Upsidedown', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vubm.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vutallglass'] = {['name'] = 'ngd_vutallglass', ['label'] = 'Tall Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vutallglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vugin'] = {['name'] = 'ngd_vugin', ['label'] = 'Gin', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vugin.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vuvermouth'] = {['name'] = 'ngd_vuvermouth', ['label'] = 'Vermouth', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vuvermouth.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vublvodka'] = {['name'] = 'ngd_vublvodka', ['label'] = 'Black Vodka', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vublvodka.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vutequila'] = {['name'] = 'ngd_vutequila', ['label'] = 'Tequila', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vutequila.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_vumenu'] = {['name'] = 'ngd_vumenu', ['label'] = 'VU Drink Menu', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_vumenu.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},

-- NEW QB ITEMS: --
ngd_vuice = { name = 'ngd_vuice', label = 'Ice', weight = 0, type = 'item', image = 'ngd_vuice.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vumar = { name = 'ngd_vumar', label = 'Martini', weight = 0, type = 'item', image = 'ngd_vumar.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuem = { name = 'ngd_vuem', label = 'Emerald', weight = 0, type = 'item', image = 'ngd_vuem.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vucoffee = { name = 'ngd_vucoffee', label = 'Coffee', weight = 0, type = 'item', image = 'ngd_vucoffee.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vurd = { name = 'ngd_vurd', label = 'Red Devil', weight = 0, type = 'item', image = 'ngd_vurd.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuds = { name = 'ngd_vuds', label = 'Dark Side', weight = 0, type = 'item', image = 'ngd_vuds.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vureap = { name = 'ngd_vureap', label = 'Reaper', weight = 0, type = 'item', image = 'ngd_vureap.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vucocorum = { name = 'ngd_vucocorum', label = 'Coconut Rum', weight = 0, type = 'item', image = 'ngd_vucocorum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vubc = { name = 'ngd_vubc', label = 'Blue Curacao', weight = 0, type = 'item', image = 'ngd_vubc.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuom = { name = 'ngd_vuom', label = 'Orange Martini', weight = 0, type = 'item', image = 'ngd_vuom.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuvodka = { name = 'ngd_vuvodka', label = 'Vodka', weight = 0, type = 'item', image = 'ngd_vuvodka.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vustout = { name = 'ngd_vustout', label = 'Stout', weight = 0, type = 'item', image = 'ngd_vustout.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vupj = { name = 'ngd_vupj', label = 'Pineapple Juice', weight = 0, type = 'item', image = 'ngd_vupj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vumartiniglass = { name = 'ngd_vumartiniglass', label = 'Martini Glass', weight = 0, type = 'item', image = 'ngd_vumartiniglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vump = { name = 'ngd_vump', label = 'Magic Potion', weight = 0, type = 'item', image = 'ngd_vump.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vumgs = { name = 'ngd_vumgs', label = 'Green Screwdriver', weight = 0, type = 'item', image = 'ngd_vumgs.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vubw = { name = 'ngd_vubw', label = 'Black Widow', weight = 0, type = 'item', image = 'ngd_vubw.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vublm = { name = 'ngd_vublm', label = 'Blue Mojito', weight = 0, type = 'item', image = 'ngd_vublm.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vucdv = { name = 'ngd_vucdv', label = 'Creme De Violette', weight = 0, type = 'item', image = 'ngd_vucdv.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuchambottle = { name = 'ngd_vuchambottle', label = 'Champagne Bottle', weight = 0, type = 'item', image = 'ngd_vuchambottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vumint = { name = 'ngd_vumint', label = 'Mint', weight = 0, type = 'item', image = 'ngd_vumint.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuolive = { name = 'ngd_vuolive', label = 'Olive', weight = 0, type = 'item', image = 'ngd_vuolive.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vurwbottle = { name = 'ngd_vurwbottle', label = 'Red Wine Bottle', weight = 0, type = 'item', image = 'ngd_vurwbottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vucs = { name = 'ngd_vucs', label = 'Caribbean Sunrise', weight = 0, type = 'item', image = 'ngd_vucs.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuhurricaneglass = { name = 'ngd_vuhurricaneglass', label = 'Hurricane Glass', weight = 0, type = 'item', image = 'ngd_vuhurricaneglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuwhitewine = { name = 'ngd_vuwhitewine', label = 'White Wine', weight = 0, type = 'item', image = 'ngd_vuwhitewine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuwineglass = { name = 'ngd_vuwineglass', label = 'Wine Glass', weight = 0, type = 'item', image = 'ngd_vuwineglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuemp = { name = 'ngd_vuemp', label = 'Empress', weight = 0, type = 'item', image = 'ngd_vuemp.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vugrenadine = { name = 'ngd_vugrenadine', label = 'Grenadine', weight = 0, type = 'item', image = 'ngd_vugrenadine.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_50sog = { name = 'ngd_50sog', label = '50 Shades of Grey', weight = 0, type = 'item', image = 'ngd_50sog.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuwwbottle = { name = 'ngd_vuwwbottle', label = 'White Wine Bottle', weight = 0, type = 'item', image = 'ngd_vuwwbottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vulime = { name = 'ngd_vulime', label = 'Lime', weight = 0, type = 'item', image = 'ngd_vulime.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vucham = { name = 'ngd_vucham', label = 'Champagne', weight = 0, type = 'item', image = 'ngd_vucham.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vulmar = { name = 'ngd_vulmar', label = 'Lagoon Martini', weight = 0, type = 'item', image = 'ngd_vulmar.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vucbj = { name = 'ngd_vucbj', label = 'Cranberry Juice', weight = 0, type = 'item', image = 'ngd_vucbj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuredwine = { name = 'ngd_vuredwine', label = 'Red Wine', weight = 0, type = 'item', image = 'ngd_vuredwine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vusp = { name = 'ngd_vusp', label = 'Sweet Poison', weight = 0, type = 'item', image = 'ngd_vusp.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vumidori = { name = 'ngd_vumidori', label = 'Midori', weight = 0, type = 'item', image = 'ngd_vumidori.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vurum = { name = 'ngd_vurum', label = 'Rum', weight = 0, type = 'item', image = 'ngd_vurum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuoj = { name = 'ngd_vuoj', label = 'Orange Juice', weight = 0, type = 'item', image = 'ngd_vuoj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vufc = { name = 'ngd_vufc', label = 'Fleur Collins', weight = 0, type = 'item', image = 'ngd_vufc.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vuchamglass = { name = 'ngd_vuchamglass', label = 'Champagne Glass', weight = 0, type = 'item', image = 'ngd_vuchamglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vulb = { name = 'ngd_vulb', label = 'IPA', weight = 0, type = 'item', image = 'ngd_vulb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vudb = { name = 'ngd_vudb', label = 'Diamond Blue', weight = 0, type = 'item', image = 'ngd_vudb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vulager = { name = 'ngd_vulager', label = 'Lager', weight = 0, type = 'item', image = 'ngd_vulager.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vutonic = { name = 'ngd_vutonic', label = 'Tonic', weight = 0, type = 'item', image = 'ngd_vutonic.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vulj = { name = 'ngd_vulj', label = 'Lemon Juice', weight = 0, type = 'item', image = 'ngd_vulj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vubm = { name = 'ngd_vubm', label = 'The Upsidedown', weight = 0, type = 'item', image = 'ngd_vubm.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_vutallglass = { name = 'ngd_vutallglass', label = 'Tall Glass', weight = 0, type = 'item', image = 'ngd_vutallglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vugin = { name = 'ngd_vugin', label = 'Gin', weight = 0, type = 'item', image = 'ngd_vugin.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vuvermouth = { name = 'ngd_vuvermouth', label = 'Vermouth', weight = 0, type = 'item', image = 'ngd_vuvermouth.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vublvodka = { name = 'ngd_vublvodka', label = 'Black Vodka', weight = 0, type = 'item', image = 'ngd_vublvodka.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vutequila = { name = 'ngd_vutequila', label = 'Tequila', weight = 0, type = 'item', image = 'ngd_vutequila.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_vumenu = { name = 'ngd_vumenu', label = 'VU Drink Menu', weight = 0, type = 'item', image = 'ngd_vumenu.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },

--OX Items: --

["ngd_vuice"] = {
    label = "Ice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuice.png",
    }
},

["ngd_vumar"] = {
    label = "Martini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumar.png",
    }
},

["ngd_vuem"] = {
    label = "Emerald",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuem.png",
    }
},

["ngd_vucoffee"] = {
    label = "Coffee",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucoffee.png",
    }
},

["ngd_vurd"] = {
    label = "Red Devil",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vurd.png",
    }
},

["ngd_vuds"] = {
    label = "Dark Side",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuds.png",
    }
},

["ngd_vureap"] = {
    label = "Reaper",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vureap.png",
    }
},

["ngd_vucocorum"] = {
    label = "Coconut Rum",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucocorum.png",
    }
},

["ngd_vubc"] = {
    label = "Blue Curacao",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vubc.png",
    }
},

["ngd_vuom"] = {
    label = "Orange Martini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuom.png",
    }
},

["ngd_vuvodka"] = {
    label = "Vodka",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuvodka.png",
    }
},

["ngd_vustout"] = {
    label = "Stout",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vustout.png",
    }
},

["ngd_vupj"] = {
    label = "Pineapple Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vupj.png",
    }
},

["ngd_vumartiniglass"] = {
    label = "Martini Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumartiniglass.png",
    }
},

["ngd_vump"] = {
    label = "Magic Potion",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vump.png",
    }
},

["ngd_vumgs"] = {
    label = "Green Screwdriver",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumgs.png",
    }
},

["ngd_vubw"] = {
    label = "Black Widow",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vubw.png",
    }
},

["ngd_vublm"] = {
    label = "Blue Mojito",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vublm.png",
    }
},

["ngd_vucdv"] = {
    label = "Creme De Violette",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucdv.png",
    }
},

["ngd_vuchambottle"] = {
    label = "Champagne Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuchambottle.png",
    }
},

["ngd_vumint"] = {
    label = "Mint",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumint.png",
    }
},

["ngd_vuolive"] = {
    label = "Olive",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuolive.png",
    }
},

["ngd_vurwbottle"] = {
    label = "Red Wine Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vurwbottle.png",
    }
},

["ngd_vucs"] = {
    label = "Caribbean Sunrise",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucs.png",
    }
},

["ngd_vuhurricaneglass"] = {
    label = "Hurricane Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuhurricaneglass.png",
    }
},

["ngd_vuwhitewine"] = {
    label = "White Wine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuwhitewine.png",
    }
},

["ngd_vuwineglass"] = {
    label = "Wine Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuwineglass.png",
    }
},

["ngd_vuemp"] = {
    label = "Empress",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuemp.png",
    }
},

["ngd_vugrenadine"] = {
    label = "Grenadine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vugrenadine.png",
    }
},

["ngd_50sog"] = {
    label = "50 Shades of Grey",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_50sog.png",
    }
},

["ngd_vuwwbottle"] = {
    label = "White Wine Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuwwbottle.png",
    }
},

["ngd_vulime"] = {
    label = "Lime",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vulime.png",
    }
},

["ngd_vucham"] = {
    label = "Champagne",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucham.png",
    }
},

["ngd_vulmar"] = {
    label = "Lagoon Martini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vulmar.png",
    }
},

["ngd_vucbj"] = {
    label = "Cranberry Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vucbj.png",
    }
},

["ngd_vuredwine"] = {
    label = "Red Wine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuredwine.png",
    }
},

["ngd_vusp"] = {
    label = "Sweet Poison",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vusp.png",
    }
},

["ngd_vumidori"] = {
    label = "Midori",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumidori.png",
    }
},

["ngd_vurum"] = {
    label = "Rum",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vurum.png",
    }
},

["ngd_vuoj"] = {
    label = "Orange Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuoj.png",
    }
},

["ngd_vufc"] = {
    label = "Fleur Collins",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vufc.png",
    }
},

["ngd_vuchamglass"] = {
    label = "Champagne Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuchamglass.png",
    }
},

["ngd_vulb"] = {
    label = "IPA",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vulb.png",
    }
},

["ngd_vudb"] = {
    label = "Diamond Blue",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vudb.png",
    }
},

["ngd_vulager"] = {
    label = "Lager",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vulager.png",
    }
},

["ngd_vutonic"] = {
    label = "Tonic",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vutonic.png",
    }
},

["ngd_vulj"] = {
    label = "Lemon Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vulj.png",
    }
},

["ngd_vubm"] = {
    label = "The Upsidedown",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vubm.png",
    }
},

["ngd_vutallglass"] = {
    label = "Tall Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vutallglass.png",
    }
},

["ngd_vugin"] = {
    label = "Gin",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vugin.png",
    }
},

["ngd_vuvermouth"] = {
    label = "Vermouth",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vuvermouth.png",
    }
},

["ngd_vublvodka"] = {
    label = "Black Vodka",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vublvodka.png",
    }
},

["ngd_vutequila"] = {
    label = "Tequila",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vutequila.png",
    }
},

["ngd_vumenu"] = {
    label = "VU Drink Menu",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_vumenu.png",
    }
},

```


# ███╗   ██╗ ██████╗ ██████╗       ██████╗  █████╗ ██╗  ██╗ █████╗ ███╗   ███╗ █████╗ 
# ████╗  ██║██╔════╝ ██╔══██╗      ██╔══██╗██╔══██╗██║  ██║██╔══██╗████╗ ████║██╔══██╗
# ██╔██╗ ██║██║  ███╗██║  ██║█████╗██████╔╝███████║███████║███████║██╔████╔██║███████║
# ██║╚██╗██║██║   ██║██║  ██║╚════╝██╔══██╗██╔══██║██╔══██║██╔══██║██║╚██╔╝██║██╔══██║
# ██║ ╚████║╚██████╔╝██████╔╝      ██████╔╝██║  ██║██║  ██║██║  ██║██║ ╚═╝ ██║██║  ██║
# ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝       ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝

Script by deluce#0 | Nemesis Gaming Development

https://docs.nemesisgd.com

# To install script:
#  -- Put ngd-Bridge into your resources folder and ensure it in your server.cfg. This script MUST BE STARTED AFTER all of your core resources such as inventory, target and framework.
#  -- Put ngd-bahama into your resources folder and ensure it in your server.cfg. This script MUST BE STARTED AFTER ngd-Bridge.
#  -- Put the items below into your inventory.
#  -- Copy the images from the 'img' folder into your inventory's images folder.
#  -- Edit the Config.ImagePath = 'ox_inventory/web/images/' to match the path to your inventory images.
#  -- Add the job to your framework.

# -- DJ BOOTH -- #
# - If you want to use the included dj booth, make sure to download the included ngd-dj from Keymaster and follow the instructions for setup.

```lua

--Add the following job to your qb-core>shared>jobs.lua:
    ['bahama'] = {
        label = 'Bahama Mama',
        defaultDuty = true,
        grades = {
            ['0'] = { name = 'Employee', payment = 25 },
            ['1'] = { name = 'Owner', payment = 75, isboss = true },
        },
    },

    --OR, NEW QB:

    	bahama = {
		label = 'Bahama Mamas',
		type = 'Bahama',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Employee', payment = 50 },
			['1'] = { name = 'Owner', payment = 75, isboss = true },
		},
	},


    --ESX:  You must add the 'bahama' job into your database.  You can try the following MYSQL snippet below, but it may not work depending on how you have your jobs table configured.

```

```sql

SELECT id FROM job_grades ORDER BY id DESC LIMIT 1 INTO @last_id;

SET @new_id = IFNULL(@last_id, 0) + 1;

INSERT INTO jobs (name, label, whitelisted) VALUES ('bahama', 'Bahama Mama', 0);

INSERT INTO job_grades (id, job_name, name, grade, label, salary, skin_male, skin_female)
VALUES (@new_id, 'bahama', 'employee', 0, 'Employee', 100, '{}', '{}');

INSERT INTO job_grades (id, job_name, name, grade, label, salary, skin_male, skin_female)
VALUES (@new_id + 1, 'bahama', 'boss', 1, 'Boss', 200, '{}', '{}');

```

```lua
-- OLD QB and QS Items: --
['ngd_bhpk'] = {['name'] = 'ngd_bhpk', ['label'] = 'Painkiller', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhpk.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhlj'] = {['name'] = 'ngd_bhlj', ['label'] = 'Lemon Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhlj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhes'] = {['name'] = 'ngd_bhes', ['label'] = 'Emerald Sunrise', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhes.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbrandy'] = {['name'] = 'ngd_bhbrandy', ['label'] = 'Brandy', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbrandy.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhwhitewine'] = {['name'] = 'ngd_bhwhitewine', ['label'] = 'White Wine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhwhitewine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcham'] = {['name'] = 'ngd_bhcham', ['label'] = 'Champagne', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcham.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhpretzel'] = {['name'] = 'ngd_bhpretzel', ['label'] = 'Bite Size Pretzel', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhpretzel.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhmar'] = {['name'] = 'ngd_bhmar', ['label'] = 'Martini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhmar.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhgin'] = {['name'] = 'ngd_bhgin', ['label'] = 'Gin', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhgin.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhhpnotiq'] = {['name'] = 'ngd_bhhpnotiq', ['label'] = 'Hpnotiq', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhhpnotiq.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhjal'] = {['name'] = 'ngd_bhjal', ['label'] = 'Jalapeno', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhjal.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhrwbottle'] = {['name'] = 'ngd_bhrwbottle', ['label'] = 'Red Wine Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhrwbottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhrum'] = {['name'] = 'ngd_bhrum', ['label'] = 'Rum', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhrum.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhtt'] = {['name'] = 'ngd_bhtt', ['label'] = 'Tokyo Tea', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhtt.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhyb'] = {['name'] = 'ngd_bhyb', ['label'] = 'Yellow Bird', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhyb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhmidori'] = {['name'] = 'ngd_bhmidori', ['label'] = 'Midori', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhmidori.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhwineglass'] = {['name'] = 'ngd_bhwineglass', ['label'] = 'Wine Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhwineglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhpr'] = {['name'] = 'ngd_bhpr', ['label'] = 'Purple Rain', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhpr.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhhb'] = {['name'] = 'ngd_bhhb', ['label'] = 'Hawaiian Bonfire', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhhb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcoffee'] = {['name'] = 'ngd_bhcoffee', ['label'] = 'Coffee', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcoffee.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhmartiniglass'] = {['name'] = 'ngd_bhmartiniglass', ['label'] = 'Martini Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhmartiniglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcocorum'] = {['name'] = 'ngd_bhcocorum', ['label'] = 'Coconut Rum', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcocorum.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhchamglass'] = {['name'] = 'ngd_bhchamglass', ['label'] = 'Champagne Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhchamglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcdm'] = {['name'] = 'ngd_bhcdm', ['label'] = 'Creme De Menthe', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcdm.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bholive'] = {['name'] = 'ngd_bholive', ['label'] = 'Olive', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bholive.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhice'] = {['name'] = 'ngd_bhice', ['label'] = 'Ice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhice.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcherry'] = {['name'] = 'ngd_bhcherry', ['label'] = 'Cherry', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcherry.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhgat'] = {['name'] = 'ngd_bhgat', ['label'] = 'Appletini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhgat.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbh'] = {['name'] = 'ngd_bhbh', ['label'] = 'Blue Hawaiian', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbh.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbs'] = {['name'] = 'ngd_bhbs', ['label'] = 'Blackberry Sour', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbs.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhtallglass'] = {['name'] = 'ngd_bhtallglass', ['label'] = 'Tall Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhtallglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhhm'] = {['name'] = 'ngd_bhhm', ['label'] = 'Hpnotiq Martini', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhhm.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhvodka'] = {['name'] = 'ngd_bhvodka', ['label'] = 'Vodka', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhvodka.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhpj'] = {['name'] = 'ngd_bhpj', ['label'] = 'Pineapple Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhpj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhba'] = {['name'] = 'ngd_bhba', ['label'] = 'Blue Angel', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhba.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhgrenadine'] = {['name'] = 'ngd_bhgrenadine', ['label'] = 'Grenadine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhgrenadine.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhav'] = {['name'] = 'ngd_bhav', ['label'] = 'Aviation', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhav.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbb'] = {['name'] = 'ngd_bhbb', ['label'] = 'Blackberries', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbb.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhtonic'] = {['name'] = 'ngd_bhtonic', ['label'] = 'Tonic', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhtonic.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhts'] = {['name'] = 'ngd_bhts', ['label'] = 'Tequila Sunrise', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhts.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcdv'] = {['name'] = 'ngd_bhcdv', ['label'] = 'Creme De Violette', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcdv.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhgh'] = {['name'] = 'ngd_bhgh', ['label'] = 'Grasshopper', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhgh.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbama'] = {['name'] = 'ngd_bhbama', ['label'] = 'Bahama Mama', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbama.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhgf'] = {['name'] = 'ngd_bhgf', ['label'] = 'Gin Fizz', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhgf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhchambottle'] = {['name'] = 'ngd_bhchambottle', ['label'] = 'Champagne Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhchambottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhss'] = {['name'] = 'ngd_bhss', ['label'] = 'Scooby Snak', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhss.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhfb'] = {['name'] = 'ngd_bhfb', ['label'] = 'Frostbite', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhfb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhoj'] = {['name'] = 'ngd_bhoj', ['label'] = 'Orange Juice', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhoj.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhjf'] = {['name'] = 'ngd_bhjf', ['label'] = 'Jellyfish', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhjf.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhtequila'] = {['name'] = 'ngd_bhtequila', ['label'] = 'Tequila', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhtequila.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhhurricaneglass'] = {['name'] = 'ngd_bhhurricaneglass', ['label'] = 'Hurricane Glass', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhhurricaneglass.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhvermouth'] = {['name'] = 'ngd_bhvermouth', ['label'] = 'Vermouth', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhvermouth.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhredwine'] = {['name'] = 'ngd_bhredwine', ['label'] = 'Red Wine', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhredwine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhwwbottle'] = {['name'] = 'ngd_bhwwbottle', ['label'] = 'White Wine Bottle', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhwwbottle.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhol'] = {['name'] = 'ngd_bhol', ['label'] = 'Orange Liqueur', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhol.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhlime'] = {['name'] = 'ngd_bhlime', ['label'] = 'Lime', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhlime.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhcream'] = {['name'] = 'ngd_bhcream', ['label'] = 'Cream', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhcream.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhpretzelb'] = {['name'] = 'ngd_bhpretzelb', ['label'] = 'Bag of Pretzels', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhpretzelb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhbc'] = {['name'] = 'ngd_bhbc', ['label'] = 'Blue Curacao', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhbc.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhlb'] = {['name'] = 'ngd_bhlb', ['label'] = 'Bahama Light Beer', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhlb.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhlager'] = {['name'] = 'ngd_bhlager', ['label'] = 'Bahama Lager', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhlager.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhstout'] = {['name'] = 'ngd_bhstout', ['label'] = 'Bahama Stout', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngs_bhstout.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},
['ngd_bhmenu'] = {['name'] = 'ngd_bhmenu', ['label'] = 'Bahama Menu', ['weight'] = 0, ['type'] = 'item', ['image'] = 'ngd_bhmenu.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = ''},

--NEW QB Items--

ngd_bhpk = { name = 'ngd_bhpk', label = 'Painkiller', weight = 0, type = 'item', image = 'ngd_bhpk.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhlj = { name = 'ngd_bhlj', label = 'Lemon Juice', weight = 0, type = 'item', image = 'ngd_bhlj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhes = { name = 'ngd_bhes', label = 'Emerald Sunrise', weight = 0, type = 'item', image = 'ngd_bhes.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbrandy = { name = 'ngd_bhbrandy', label = 'Brandy', weight = 0, type = 'item', image = 'ngd_bhbrandy.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhwhitewine = { name = 'ngd_bhwhitewine', label = 'White Wine', weight = 0, type = 'item', image = 'ngd_bhwhitewine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhcham = { name = 'ngd_bhcham', label = 'Champagne', weight = 0, type = 'item', image = 'ngd_bhcham.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhpretzel = { name = 'ngd_bhpretzel', label = 'Bite Size Pretzel', weight = 0, type = 'item', image = 'ngd_bhpretzel.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhmar = { name = 'ngd_bhmar', label = 'Martini', weight = 0, type = 'item', image = 'ngd_bhmar.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhgin = { name = 'ngd_bhgin', label = 'Gin', weight = 0, type = 'item', image = 'ngd_bhgin.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhhpnotiq = { name = 'ngd_bhhpnotiq', label = 'Hpnotiq', weight = 0, type = 'item', image = 'ngd_bhhpnotiq.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhjal = { name = 'ngd_bhjal', label = 'Jalapeno', weight = 0, type = 'item', image = 'ngd_bhjal.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhrwbottle = { name = 'ngd_bhrwbottle', label = 'Red Wine Bottle', weight = 0, type = 'item', image = 'ngd_bhrwbottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhrum = { name = 'ngd_bhrum', label = 'Rum', weight = 0, type = 'item', image = 'ngd_bhrum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhtt = { name = 'ngd_bhtt', label = 'Tokyo Tea', weight = 0, type = 'item', image = 'ngd_bhtt.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhyb = { name = 'ngd_bhyb', label = 'Yellow Bird', weight = 0, type = 'item', image = 'ngd_bhyb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhmidori = { name = 'ngd_bhmidori', label = 'Midori', weight = 0, type = 'item', image = 'ngd_bhmidori.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhwineglass = { name = 'ngd_bhwineglass', label = 'Wine Glass', weight = 0, type = 'item', image = 'ngd_bhwineglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhpr = { name = 'ngd_bhpr', label = 'Purple Rain', weight = 0, type = 'item', image = 'ngd_bhpr.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhhb = { name = 'ngd_bhhb', label = 'Hawaiian Bonfire', weight = 0, type = 'item', image = 'ngd_bhhb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhcoffee = { name = 'ngd_bhcoffee', label = 'Coffee', weight = 0, type = 'item', image = 'ngd_bhcoffee.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhmartiniglass = { name = 'ngd_bhmartiniglass', label = 'Martini Glass', weight = 0, type = 'item', image = 'ngd_bhmartiniglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhcocorum = { name = 'ngd_bhcocorum', label = 'Coconut Rum', weight = 0, type = 'item', image = 'ngd_bhcocorum.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhchamglass = { name = 'ngd_bhchamglass', label = 'Champagne Glass', weight = 0, type = 'item', image = 'ngd_bhchamglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhcdm = { name = 'ngd_bhcdm', label = 'Creme De Menthe', weight = 0, type = 'item', image = 'ngd_bhcdm.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bholive = { name = 'ngd_bholive', label = 'Olive', weight = 0, type = 'item', image = 'ngd_bholive.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhice = { name = 'ngd_bhice', label = 'Ice', weight = 0, type = 'item', image = 'ngd_bhice.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhcherry = { name = 'ngd_bhcherry', label = 'Cherry', weight = 0, type = 'item', image = 'ngd_bhcherry.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhgat = { name = 'ngd_bhgat', label = 'Appletini', weight = 0, type = 'item', image = 'ngd_bhgat.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbh = { name = 'ngd_bhbh', label = 'Blue Hawaiian', weight = 0, type = 'item', image = 'ngd_bhbh.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbs = { name = 'ngd_bhbs', label = 'Blackberry Sour', weight = 0, type = 'item', image = 'ngd_bhbs.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhtallglass = { name = 'ngd_bhtallglass', label = 'Tall Glass', weight = 0, type = 'item', image = 'ngd_bhtallglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhhm = { name = 'ngd_bhhm', label = 'Hpnotiq Martini', weight = 0, type = 'item', image = 'ngd_bhhm.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhvodka = { name = 'ngd_bhvodka', label = 'Vodka', weight = 0, type = 'item', image = 'ngd_bhvodka.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhpj = { name = 'ngd_bhpj', label = 'Pineapple Juice', weight = 0, type = 'item', image = 'ngd_bhpj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhba = { name = 'ngd_bhba', label = 'Blue Angel', weight = 0, type = 'item', image = 'ngd_bhba.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhgrenadine = { name = 'ngd_bhgrenadine', label = 'Grenadine', weight = 0, type = 'item', image = 'ngd_bhgrenadine.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhav = { name = 'ngd_bhav', label = 'Aviation', weight = 0, type = 'item', image = 'ngd_bhav.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbb = { name = 'ngd_bhbb', label = 'Blackberries', weight = 0, type = 'item', image = 'ngd_bhbb.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhtonic = { name = 'ngd_bhtonic', label = 'Tonic', weight = 0, type = 'item', image = 'ngd_bhtonic.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhts = { name = 'ngd_bhts', label = 'Tequila Sunrise', weight = 0, type = 'item', image = 'ngd_bhts.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhcdv = { name = 'ngd_bhcdv', label = 'Creme De Violette', weight = 0, type = 'item', image = 'ngd_bhcdv.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhgh = { name = 'ngd_bhgh', label = 'Grasshopper', weight = 0, type = 'item', image = 'ngd_bhgh.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbama = { name = 'ngd_bhbama', label = 'Bahama Mama', weight = 0, type = 'item', image = 'ngd_bhbama.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhgf = { name = 'ngd_bhgf', label = 'Gin Fizz', weight = 0, type = 'item', image = 'ngd_bhgf.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhchambottle = { name = 'ngd_bhchambottle', label = 'Champagne Bottle', weight = 0, type = 'item', image = 'ngd_bhchambottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhss = { name = 'ngd_bhss', label = 'Scooby Snak', weight = 0, type = 'item', image = 'ngd_bhss.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhfb = { name = 'ngd_bhfb', label = 'Frostbite', weight = 0, type = 'item', image = 'ngd_bhfb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhoj = { name = 'ngd_bhoj', label = 'Orange Juice', weight = 0, type = 'item', image = 'ngd_bhoj.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhjf = { name = 'ngd_bhjf', label = 'Jellyfish', weight = 0, type = 'item', image = 'ngd_bhjf.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhtequila = { name = 'ngd_bhtequila', label = 'Tequila', weight = 0, type = 'item', image = 'ngd_bhtequila.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhhurricaneglass = { name = 'ngd_bhhurricaneglass', label = 'Hurricane Glass', weight = 0, type = 'item', image = 'ngd_bhhurricaneglass.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhvermouth = { name = 'ngd_bhvermouth', label = 'Vermouth', weight = 0, type = 'item', image = 'ngd_bhvermouth.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhredwine = { name = 'ngd_bhredwine', label = 'Red Wine', weight = 0, type = 'item', image = 'ngd_bhredwine.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhwwbottle = { name = 'ngd_bhwwbottle', label = 'White Wine Bottle', weight = 0, type = 'item', image = 'ngd_bhwwbottle.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhol = { name = 'ngd_bhol', label = 'Orange Liqueur', weight = 0, type = 'item', image = 'ngd_bhol.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhlime = { name = 'ngd_bhlime', label = 'Lime', weight = 0, type = 'item', image = 'ngd_bhlime.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhcream = { name = 'ngd_bhcream', label = 'Cream', weight = 0, type = 'item', image = 'ngd_bhcream.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhpretzelb = { name = 'ngd_bhpretzelb', label = 'Bag of Pretzels', weight = 0, type = 'item', image = 'ngd_bhpretzelb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhbc = { name = 'ngd_bhbc', label = 'Blue Curacao', weight = 0, type = 'item', image = 'ngd_bhbc.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_bhlb = { name = 'ngd_bhlb', label = 'Bahama Light Beer', weight = 0, type = 'item', image = 'ngd_bhlb.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhlager = { name = 'ngd_bhlager', label = 'Bahama Lager', weight = 0, type = 'item', image = 'ngd_bhlager.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhstout = { name = 'ngd_bhstout', label = 'Bahama Stout', weight = 0, type = 'item', image = 'ngs_bhstout.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_bhmenu = { name = 'ngd_bhmenu', label = 'Bahama Menu', weight = 0, type = 'item', image = 'ngd_bhmenu.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },

--OX Items: --
["ngd_bhpk"] = {
    label = "Painkiller",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhpk.png",
    }
},

["ngd_bhlj"] = {
    label = "Lemon Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhlj.png",
    }
},

["ngd_bhes"] = {
    label = "Emerald Sunrise",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhes.png",
    }
},

["ngd_bhbrandy"] = {
    label = "Brandy",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbrandy.png",
    }
},

["ngd_bhwhitewine"] = {
    label = "White Wine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhwhitewine.png",
    }
},

["ngd_bhcham"] = {
    label = "Champagne",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcham.png",
    }
},

["ngd_bhpretzel"] = {
    label = "Bite Size Pretzel",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhpretzel.png",
    }
},

["ngd_bhmar"] = {
    label = "Martini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhmar.png",
    }
},

["ngd_bhgin"] = {
    label = "Gin",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhgin.png",
    }
},

["ngd_bhhpnotiq"] = {
    label = "Hpnotiq",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhhpnotiq.png",
    }
},

["ngd_bhjal"] = {
    label = "Jalapeno",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhjal.png",
    }
},

["ngd_bhrwbottle"] = {
    label = "Red Wine Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhrwbottle.png",
    }
},

["ngd_bhrum"] = {
    label = "Rum",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhrum.png",
    }
},

["ngd_bhtt"] = {
    label = "Tokyo Tea",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhtt.png",
    }
},

["ngd_bhyb"] = {
    label = "Yellow Bird",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhyb.png",
    }
},

["ngd_bhmidori"] = {
    label = "Midori",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhmidori.png",
    }
},

["ngd_bhwineglass"] = {
    label = "Wine Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhwineglass.png",
    }
},

["ngd_bhpr"] = {
    label = "Purple Rain",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhpr.png",
    }
},

["ngd_bhhb"] = {
    label = "Hawaiian Bonfire",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhhb.png",
    }
},

["ngd_bhcoffee"] = {
    label = "Coffee",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcoffee.png",
    }
},

["ngd_bhmartiniglass"] = {
    label = "Martini Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhmartiniglass.png",
    }
},

["ngd_bhcocorum"] = {
    label = "Coconut Rum",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcocorum.png",
    }
},

["ngd_bhchamglass"] = {
    label = "Champagne Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhchamglass.png",
    }
},

["ngd_bhcdm"] = {
    label = "Creme De Menthe",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcdm.png",
    }
},

["ngd_bholive"] = {
    label = "Olive",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bholive.png",
    }
},

["ngd_bhice"] = {
    label = "Ice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhice.png",
    }
},

["ngd_bhcherry"] = {
    label = "Cherry",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcherry.png",
    }
},

["ngd_bhgat"] = {
    label = "Appletini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhgat.png",
    }
},

["ngd_bhbh"] = {
    label = "Blue Hawaiian",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbh.png",
    }
},

["ngd_bhbs"] = {
    label = "Blackberry Sour",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbs.png",
    }
},

["ngd_bhtallglass"] = {
    label = "Tall Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhtallglass.png",
    }
},

["ngd_bhhm"] = {
    label = "Hpnotiq Martini",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhhm.png",
    }
},

["ngd_bhvodka"] = {
    label = "Vodka",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhvodka.png",
    }
},

["ngd_bhpj"] = {
    label = "Pineapple Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhpj.png",
    }
},

["ngd_bhba"] = {
    label = "Blue Angel",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhba.png",
    }
},

["ngd_bhgrenadine"] = {
    label = "Grenadine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhgrenadine.png",
    }
},

["ngd_bhav"] = {
    label = "Aviation",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhav.png",
    }
},

["ngd_bhbb"] = {
    label = "Blackberries",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbb.png",
    }
},

["ngd_bhtonic"] = {
    label = "Tonic",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhtonic.png",
    }
},

["ngd_bhts"] = {
    label = "Tequila Sunrise",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhts.png",
    }
},

["ngd_bhcdv"] = {
    label = "Creme De Violette",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcdv.png",
    }
},

["ngd_bhgh"] = {
    label = "Grasshopper",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhgh.png",
    }
},

["ngd_bhbama"] = {
    label = "Bahama Mama",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbama.png",
    }
},

["ngd_bhgf"] = {
    label = "Gin Fizz",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhgf.png",
    }
},

["ngd_bhchambottle"] = {
    label = "Champagne Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhchambottle.png",
    }
},

["ngd_bhss"] = {
    label = "Scooby Snak",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhss.png",
    }
},

["ngd_bhfb"] = {
    label = "Frostbite",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhfb.png",
    }
},

["ngd_bhoj"] = {
    label = "Orange Juice",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhoj.png",
    }
},

["ngd_bhjf"] = {
    label = "Jellyfish",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhjf.png",
    }
},

["ngd_bhtequila"] = {
    label = "Tequila",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhtequila.png",
    }
},

["ngd_bhhurricaneglass"] = {
    label = "Hurricane Glass",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhhurricaneglass.png",
    }
},

["ngd_bhvermouth"] = {
    label = "Vermouth",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhvermouth.png",
    }
},

["ngd_bhredwine"] = {
    label = "Red Wine",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhredwine.png",
    }
},

["ngd_bhwwbottle"] = {
    label = "White Wine Bottle",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhwwbottle.png",
    }
},

["ngd_bhol"] = {
    label = "Orange Liqueur",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhol.png",
    }
},

["ngd_bhlime"] = {
    label = "Lime",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhlime.png",
    }
},

["ngd_bhcream"] = {
    label = "Cream",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhcream.png",
    }
},

["ngd_bhpretzelb"] = {
    label = "Bag of Pretzels",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhpretzelb.png",
    }
},

["ngd_bhbc"] = {
    label = "Blue Curacao",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhbc.png",
    }
},

["ngd_bhlb"] = {
    label = "Bahama Light Beer",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhlb.png",
    }
},

["ngd_bhlager"] = {
    label = "Bahama Lager",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhlager.png",
    }
},

    ["ngd_bhstout"] = {
    label = "Bahama Stout",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngs_bhstout.png",
    }
},

    ["ngd_bhmenu"] = {
    label = "Bahama Menu",
    weight = 0,
    stack = true,
    close = true,
    description = "",
    client = {
        image = "ngd_bhmenu.png",
    }
},

```

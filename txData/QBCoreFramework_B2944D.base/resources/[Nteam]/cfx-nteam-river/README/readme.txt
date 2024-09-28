If you have our other maps with scenarios follow this instruction


Step 1.

you need to transfer these files from this map

cypress_flats.ymt
east_los_santos.ymt
la_mesa.ymt


in cfx-nteam-mapdata > stream > ymt



Step 2.

Delete sp_manifest.ymt from cfx-nteam-river

Step 3.

Delete ymt folder from cfx-nteam-river > stream


Step 4.

In cfx-nteam-river open file fxmanifest and delete this lines

file "sp_manifest.ymt"
data_file "SCENARIO_POINTS_OVERRIDE_PSO_FILE" "sp_manifest.ymt"

And thats it. 

------------------------

Also if river scenario dont work that mean that your server read some other scenarios. 

So you need to transfer these files from this map

cypress_flats.ymt
east_los_santos.ymt
la_mesa.ymt

in your other map with scenarios that your server read.





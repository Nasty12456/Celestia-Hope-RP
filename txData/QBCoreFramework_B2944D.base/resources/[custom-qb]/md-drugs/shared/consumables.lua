Consumables = {}
Consumables.defaulttime = 4000
Consumables.defaultanim = 'pflag2'
Consumables.defaultprogresstext = 'Consuming ' -- it will always show the label of the item being used after what you put here, make sure to keep the space at the end :)
Consumables.defaultstatval = 0
--[[
    effect options
    alien
    ecstacy
    meth
    coke
    trevor
    none
]]

--[[
add = {} 
health = number -- amount of health to give
stress = number -- number of stress to give 
speed = number -- number of seconds you a fast boi
hunger = number -- number of hunger to fill
thirst = number -- same shit 
strength = number -- how long you are strong boi

]]
Consumables.Items = {
    -- meth
    ["methbags"] =                { time = 4000, effect = 'meth', anim = "smoke", progressbartext = "Injesting", 
                                    add = {health = -20, stress = -10, speed = 40, strength = 10, thirst = -30}},
    -- coke
    ["cokebaggy"] =               {  anim = 'smell', time = 1000, effect = 'coke'},
    ["cokebaggystagetwo"] =       {  anim = 'smell', time = 1000, effect = 'coke'},
    ["cokebaggystagethree"] =     {  anim = 'smell', time = 1000, effect = 'coke'},
    -- heroin
    ["heroin_ready"]        =     {  anim = 'shootup', time = 1000, effect = 'ecstacy'},
    ["heroin_readystagetwo"] =    {  anim = 'shootup', time = 1000, effect = 'ecstacy'},
    ["heroin_readystagethree"] =  {  anim = 'shootup', time = 1000, effect = 'ecstacy'},
    -- crack
    ["baggedcracked"] =           {  anim = 'smell', time = 1000, effect = 'coke'},
    ["baggedcrackedstagetwo"] =   {  anim = 'smell', time = 1000, effect = 'coke'},
    ["baggedcrackedstagethree"] = {  anim = 'smell', time = 1000, effect = 'coke'},
    -- xtc
    ["white_playboys"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_playboys2"] =         {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_playboys3"] =         {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_playboys4"] =         {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_playboys"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_playboys2"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_playboys3"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_playboys4"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_playboys"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_playboys2"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_playboys3"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_playboys4"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_playboys"] =         {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_playboy2s"] =        {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_playboys3"] =        {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_playboys4"] =        {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_aliens"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_aliens2"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_aliens3"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_aliens4"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_aliens"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_aliens2"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_aliens3"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_aliens4"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_aliens"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_aliens3"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_aliens2"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_aliens4"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_aliens"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_aliens2"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_aliens3"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_aliens4"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_pl"] =                {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_pl2"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_pl3"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_pl4"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_pl"] =                 {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_pl2"] =                {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_pl3"] =                {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_pl4"] =                {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_pl"] =                  {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_pl2"] =                 {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_pl3"] =                 {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_pl4"] =                 {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_pl"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_pl2"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_pl3"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_pl4"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_trolls"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_trolls2"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_trolls3"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_trolls4"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_trolls"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_trolls2"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_trolls3"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_trolls4"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_trolls"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_trolls2"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_trolls3"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_trolls4"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_trolls"] =           {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_trolls2"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_trolls3"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_trolls4"] =          {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_cats2"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_cats3"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_cats4"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["white_cats"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_cats"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_cats3"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_cats2"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["blue_cats4"] =              {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_cats"] =                {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_cats2"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_cats3"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["red_cats4"] =               {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_cats"] =             {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_cats2"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'}, 
    ["orange_cats3"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    ["orange_cats4"] =            {  anim = 'edible', time = 1000, effect = 'ecstacy'},
    -- weed
    ["specialbrownie"] =          {  anim = 'edible',  effect = 'alien', add = {hunger = 10}},
    ["specialcookie"] =           {  anim = 'edible',  effect = 'alien', add = {hunger = 10}},
    ["specialchocolate"] =        {  anim = 'edible',  effect = 'alien', add = {hunger = 10}},
    ["specialmuffin"] =           {  anim = 'edible',  effect = 'alien', add = {hunger = 10}},
    ["blunt"] =                   {  anim = 'smokeweed', effect = 'alien'},
    ["dextroblunts"] =            {  anim = 'smokeweed', effect = 'alien'},
    ["leanblunts"] =              {  anim = 'smokeweed', effect = 'alien'},
    ["chewyblunt"] =              {  anim = 'smokeweed', effect = 'alien'},
    -- lean 
    ["cupofdextro"] =             {  anim = 'cup', effect = 'alien'},
    ["cupoflean"] =               {  anim = 'cup', effect = 'alien'},
    --lsd
    ["smiley_tabs"]  =            {  anim = 'edible', effect = 'trevor'},
    ["wildcherry_tabs"]  =        {  anim = 'edible', effect = 'trevor'},
    ["yinyang_tabs"]  =           {  anim = 'edible', effect = 'trevor'},
    ["pineapple_tabs"] =          {  anim = 'edible', effect = 'trevor'}, 
    ["bart_tabs"]  =              {  anim = 'edible', effect = 'trevor'},
    ["gratefuldead_tabs"]  =      {  anim = 'edible', effect = 'trevor'},
}
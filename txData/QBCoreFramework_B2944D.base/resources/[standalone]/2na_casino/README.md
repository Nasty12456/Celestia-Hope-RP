# 2NA-Casino

This is an exclusive casino script created for FiveM with bunch of games packed inside of it. If you need any support please head to our [discord server](https://discord.gg/0resmon)

## How does games work?

Every game is based on absolute luck, all games have few differences between each other if you want more detailed description for every game then
read the section below.

Even though win chances are not really manageable you can change how much the game will pay on few games. Unfortunately this feature is not available
for some games, due to some limitations because of how games are created. For example on the dice game user selects how much chance they will have.

### Crash:

A multiplier value is set to 0.0 value then increased in every few miliseconds. Everytime a multiplier gets increased the chance of the game crasning gets increased as well.

### Dice:

User select the chance of them winning and losing. After these values are set system randomly picks a value then game ends by user winning or losing the money.

### Mines:

User selects how many mines will be placed inside of 5x5 canvas. Then places a bet after the bet placement system randomly places the amount of mines selected by user.When mine amount gets increased also the multiplier gets increased as well.

### Plinko:

Row and ball amount gets selected and bets get placed. Then system places amount of balls selected by user. After balls are placed every ball has a 50% chance of dropping to a ball that is near it. For example if a ball is placed on the second barrier of the second row. Ball has 50% chance of dropping to the third or second barrier of the third row.

### Roulette:

After the bet placement a ball is spawned at the edges of the roulette wheel. Then two random values gets picked by the system. One of them is the value of ball getting inside of the roulette ball part. Second value is for the time ball starts to slow down. When ball starts to slow down system slows down the ball in every few miliseconds then ball freezes at a random place.

### Slot:

Player places bets then system picks two random values. One for the delay for each column to start and one for the time to freeze the each column. After starting each slot column with their delays system starts to freeze them after the second value (amount of time to freeze it) passes. Then system multiplies the bet amount with its corresponding multiplier value (_Specified inside of the config file_). These multiplier values gets divied into 5 types (1,2,3,4,5). These values (1,2,3,4,5) indicate the same amount of items that got placed on the center of the slot.

## How to configure the script ?

Script has few features to configure, you can configure them via the config file placed inside of the script (Config.lua). Almost everyting is explained inside of the config file however if you don't understand a feature or have anything to ask about the script that is not explained inside of this file or in config file then feel free to head our [discord server](https://discord.gg/0resmon)

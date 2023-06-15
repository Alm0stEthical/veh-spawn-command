# Vehicle spawner command for FiveM!
This is a FiveM script, whenever you type /veh (vehicle name) the vehicle will spawn in the game! Ex. `/veh adder`

_If you'd like to change to command to something else follow this guide!_
1. Go to the source code (**cl_vehSpawner**) on line **12** you'll see `RegisterCommand('veh', function(source, args, rawCommand)`
2. Change the ***bold word*** to the command that you want it to be called! RegisterCommand('***veh***', function(source, args, rawCommand)
For example if you changed it to `RegisterCommand('car', function(source, args, rawCommand)` the usage will be in-game: `/car (vehiclename)`
# MAKE SURE THAT YOU SAVE THE FILE AND ENSURE IT AND RESTART THE GAME!

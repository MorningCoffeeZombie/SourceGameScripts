![Valve Corp](https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Valve_old_logo.svg/1098px-Valve_old_logo.svg.png)

# SourceGameScripts
Scripts for Valve (Steam) games to improve performance and/or change the experience.  
Files are named based on the applicable game and usage. Files prefixed by "source_" are agnostic and may work with any game.
Add 'autoexec.cfg' to all/any Steam games and uncomment the lines beginning with "exec" to activate the other scripts. This is the master control file.  

*/CSGOSpecificResources/botprofile.db* is a custom file for improving performance/abilities of CSGO bots. It's found at *steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/botprofile.db*. Included is a */CSGOSpecificResources/botprofile.db.BAK* which is a backup copy as of 1/18/2019.  

## Installation
Running `./ShellScripts/deployGitToLocalPC.sh` will install all files to Steam's default save-game locations. `\ShellScripts\deployGitToLocalPC.bat` is a windows equivalent but is not fully supported (use at your own risk).  

## Source Soundboard
Running `./ShellScripts/swapMicSpams.sh` in a terminal will open a menu to swap various soundclips into Valve/Source games as "voice_input.wav". When coupled with the proper keybinds (see csgo_general.cfg for an example) you can use the soundboard in-game.    



#!/bin/bash

# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

SCRIPTLOCATION=$(pwd)


ar_common_source_configs=(
	'autoexec.cfg'
	'source_debugging.cfg'
	'source_enable_user_sprays.cfg'
	'source_fake_lag.cfg'
	'source_fake_lag_removal.cfg'
	'source_network_boost.cfg'
	'source_optimize_low_end_pc.cfg'
)

ar_game_cfg_folders=(
	"/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Counter-Strike Source/cstrike/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Day of Defeat Source/dod/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Portal/portal/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/left 4 dead/left4dead/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Team Fortress 2/tf/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Half-Life 2/hl2/cfg/"
	"/home/$USER/.steam/steam/steamapps/common/Half-Life/valve/"
	"/home/$USER/.steam/steam/steamapps/common/Half-Life/cstrike/"
	"/home/$USER/.steam/steam/steamapps/common/Half-Life/czeror/"
)


# Loop through each of the supported directories and copy specified files
for a in "${ar_game_cfg_folders[@]}"
do
	# Place all common configs into all folders
	for b in "${ar_common_source_configs[@]}"
	do
		if [ ! -d "$a" ]; then
			cp $SCRIPTLOCATION/../$b $a
			echo "Copied:	$SCRIPTLOCATION/../$b to $a"
		fi
	done

	if [ ! -d "$a" ] && [[ "$a" = *Strike*Global* ]]; then
		cp $SCRIPTLOCATION/../csgo_general.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../csgo_general.cfg to $a"
	fi

	if [ ! -d "$a" ] && [[ "$a" = *Strike*Source* ]]; then
		cp $SCRIPTLOCATION/../css_general.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../css_general.cfg to $a"
		cp $SCRIPTLOCATION/../cstrike_english.txt /home/$USER/.steam/steam/steamapps/common/Counter-Strike Source/cstrike/resource/
		echo "Copied:	$SCRIPTLOCATION/../cstrike_english.txt to /home/$USER/.steam/steam/steamapps/common/Counter-Strike Source/cstrike/resource/"
	fi

#	if [ ! -d "$a" ] && [[ "$a" = *Defeat*Source* ]]; then
		# There are currently no saved DODS
#	fi

	if [ ! -d "$a" ] && [[ "$a" = *GarrysMod* ]]; then
		cp $SCRIPTLOCATION/../gmod_general.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../gmod_general.cfg to $a"
		cp $SCRIPTLOCATION/../gmod_mcore_off.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../gmod_mcore_off.cfg to $a"
		cp $SCRIPTLOCATION/../gmod_mcore_on.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../gmod_mcore_on.cfg to $a"
		cp $SCRIPTLOCATION/../GModSpecificResources/AEF_Woodland.txt /home/$USER/.steam/steam/steamapps/common/GarrysMod/garrysmod/data/pac3/
		echo "Copied:	$SCRIPTLOCATION/../GModSpecificResources/AEF_Woodland.txt to $a"
		cp $SCRIPTLOCATION/../GModSpecificResources/autoload.txt /home/$USER/.steam/steam/steamapps/common/GarrysMod/garrysmod/data/pac3/
		echo "Copied:	$SCRIPTLOCATION/../GModSpecificResources/autoload.txt to $a"
	fi

#	if [ ! -d "$a" ] && [[ "$a" = *Portal* ]]; then
		# There are currently no saved configs for Portal
#	fi

#	if [ ! -d "$a" ] && [[ "$a" = *4*dead* ]]; then
		# There are currently no saved configs for Left 4 Dead
#	fi

	if [ ! -d "$a" ] && [[ "$a" = *Team*Fortress* ]]; then
		cp $SCRIPTLOCATION/../tf2_general.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../tf2_general.cfg to $a"
	fi
	
	if [ ! -d "$a" ] && [[ "$a" = *Half*Life*2* ]]; then
		cp $SCRIPTLOCATION/../hl2_power_script.cfg $a
		cp $SCRIPTLOCATION/../hl2_commands.lst $a
		echo "Copied:	$SCRIPTLOCATION/../hl2_power_script.cfg to $a"
		echo "Copied:	$SCRIPTLOCATION/../hl2_commands.lst to $a"
	fi

	if [ ! -d "$a" ] && [[ "$a" = "Half-Life" ]]; then
		cp $SCRIPTLOCATION/../cs_general.cfg $a
		echo "Copied:	$SCRIPTLOCATION/../cs_general.cfg to $a"
	fi

done



exit







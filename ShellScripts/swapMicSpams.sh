#!/bin/bash


# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
SCRIPTLOCATION=$(pwd)

# Set default game
$GAME="Counter-Strike Global Offensive"

if [ "${1,,}" = "csgo" ] || [ "${1,,}" = "" ]; then
	$GAME="Counter-Strike Global Offensive"
	sudo printf "GAME=Counter-Strike Global Offensive\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "csgo" ] || [ "${1,,}" = "cs go" ]; then
	$GAME="Counter-Strike Source"
	sudo printf "GAME=Counter-Strike Source\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "dod" ] || [ "${1,,}" = "dods" ]; then
	$GAME="Day of Defeat Source"
	sudo printf "GAME=Day of Defeat Source\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "gmod" ] || [ "${1,,}" = "garrysmod" ]; then
	$GAME="GarrysMod"
	sudo printf "GAME=GarrysMod\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "portal" ]; then
	$GAME="Portal"
	sudo printf "GAME=Portal\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "l4d" ] || [[ "${1,,}" = lef* ]]; then
	$GAME="left 4 dead"
	sudo printf "GAME=left 4 dead\n" | sudo tee --append swapMicSpams.conf
elif [ "${1,,}" = "tf2" ] || [[ "${1,,}" = team* ]]; then
	$GAME="Team Fortress 2"
	sudo printf "GAME=Team Fortress 2\n" | sudo tee --append swapMicSpams.conf
fi


# Catch errors
if [ ! -d /steamapps/common/$GAME ]; then
	printf "${RED}GAME NOT INSTALLED AS EXPECTED!${NC}"
	printf "${RED}EXITING SCRIPT${NC}"
	exit
fi


# Placing script in a loop so you don't have to reopen every time
while true;
do
	echo  
	echo  
	PS3="Which soundbyte would you like to que? "
	options=("Bomb Planted" "Concentrate" "Drinking Problem" "FBI Open Up" "Kinky" "Medic!" "OOF" "IM THE MOUNTAIN" "Quit")
	select voiceinput in "${options[@]}"
	do
	case $voiceinput in
		"Bomb Planted")
			cp $SCRIPTLOCATION/MicSpams/bomb_planted_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Concentrate")
			cp $SCRIPTLOCATION/MicSpams/concentrate_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Drinking Problem")
			cp $SCRIPTLOCATION/MicSpams/drinking_problem_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"FBI Open Up")
			cp $SCRIPTLOCATION/MicSpams/fbi-open-up-sfx_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Kinky")
			cp $SCRIPTLOCATION/MicSpams/kinky_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Medic!")
			cp $SCRIPTLOCATION/MicSpams/medic_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"OOF")
			cp $SCRIPTLOCATION/MicSpams/oof_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"IM THE MOUNTAIN")
			cp $SCRIPTLOCATION/MicSpams/stoned_jesus_im_the_mountain_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Quit")
			break;;
		*) echo "invalid option $REPLY";;
	esac
	done
done




#cp ../MicSpams/ "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"





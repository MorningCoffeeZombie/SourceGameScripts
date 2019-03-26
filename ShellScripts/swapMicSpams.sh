#!/bin/bash


# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


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
			cp ../MicSpams/bomb_planted_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Concentrate")
			cp ../MicSpams/concentrate_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Drinking Problem")
			cp ../MicSpams/drinking_problem_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"FBI Open Up")
			cp ../MicSpams/fbi-open-up-sfx_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Kinky")
			cp ../MicSpams/kinky_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Medic!")
			cp ../MicSpams/medic_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"OOF")
			cp ../MicSpams/oof_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"IM THE MOUNTAIN")
			cp ../MicSpams/stoned_jesus_im_the_mountain_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"; echo "${BOLDFONT}$voiceinput${NORMALFONT} entered"; break;;
		"Quit")
			break;;
		*) echo "invalid option $REPLY";;
	esac
	done
done




#cp ../MicSpams/ "/home/$USER/.steam/steam/steamapps/common/Counter-Strike Global Offensive/voice_input.wav"





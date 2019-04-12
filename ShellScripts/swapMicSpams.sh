#!/bin/bash
# Audio MUST BE: 16 bit format, Mono (not stereo), and 22050Hz


# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
SCRIPTLOCATION=$(pwd)

# Call Font Scripts
# ${RED}My text here${NC}

# This is a throw-away variable for tallying playcount and recording it to the .conf file
MATH=0

# Save settings/stats locally
# The $GAME var MUST be set to the full/proper name as this is also the top level name of the folder in which the voice_input.wav will reside
source /swapMicSpams.conf
function fn_check_conf(){
	if [ ! -f "/swapMicSpams.conf" ]; then
		echo "Config file could not be found, creating a new one"
		sudo echo> /swapMicSpams.conf
		sudo printf "GAME=Counter-Strike Global Offensive\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND1=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND2=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND3=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND4=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND5=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND6=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND7=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND8=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND9=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND10=0\n" | sudo tee --append /swapMicSpams.conf
		sudo printf "SOUND11=0\n" | sudo tee --append /swapMicSpams.conf
		sudo chmod 777 /swapMicSpams.conf
		source /swapMicSpams.conf
		echo "New config file successfully created"
	fi
}
GAME="Counter-Strike Global Offensive"
#fn_check_conf


if [[ "${1,,}" = help* ]] || [ "${1,,}" = "/?" ] ; then
	printf "\n${GREEN}${BOLDFONT}CURRENT GAME:\t\t$GAME${NORMALFONT}${NC}\n"
	printf "${BOLDFONT}ARGUMENT\t\tDESCRIPTION${NORMALFONT}\n"
	printf "${BOLDFONT}help${NORMALFONT}\t\t\tDisplay this help text.\n"
	printf "${BOLDFONT}game${NORMALFONT}\t\t\tSwitch the game directory that sound clips are saved to.\n"
	printf "${BOLDFONT}mode${NORMALFONT}\t\t\tSwitch the game directory that sound clips are saved to.\n"
fi

if [[ "${1,,}" = gam* ]] || [[ "${1,,}" = mod* ]]; then
	if [ "${2,,}" = "csgo" ] || [ "${2,,}" = "" ]; then
		GAME="Counter-Strike Global Offensive"
		sudo printf "GAME=Counter-Strike Global Offensive\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "csgo" ] || [ "${2,,}" = "cs go" ]; then
		GAME="Counter-Strike Source"
		sudo printf "GAME=Counter-Strike Source\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "dod" ] || [ "${2,,}" = "dods" ]; then
		GAME="Day of Defeat Source"
		sudo printf "GAME=Day of Defeat Source\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "gmod" ] || [ "${2,,}" = "garrysmod" ]; then
		GAME="GarrysMod"
		sudo printf "GAME=GarrysMod\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "portal" ]; then
		GAME="Portal"
		sudo printf "GAME=Portal\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "l4d" ] || [[ "${2,,}" = lef* ]]; then
		GAME="left 4 dead"
		sudo printf "GAME=left 4 dead\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "tf2" ] || [[ "${2,,}" = team* ]]; then
		GAME="Team Fortress 2"
		sudo printf "GAME=Team Fortress 2\n" | sudo tee --append swapMicSpams.conf
	elif [ "${2,,}" = "hl2" ] || [[ "${2,,}" = half* ]]; then
		GAME="Half-Life 2"
		sudo printf "GAME=Team Fortress 2\n" | sudo tee --append swapMicSpams.conf
	fi
fi


# Catch errors
if [ ! -d "/home/$USER/.steam/steam/steamapps/common/$GAME" ]; then
	printf "${RED}GAME NOT INSTALLED AS EXPECTED!${NC}\n"
	printf "${RED}EXITING SCRIPT${NC}\n"
	exit
fi


# Placing script in a loop so you don't have to reopen every time
while true;
do
	echo  
	echo  
	PS3="Which soundbyte would you like to que? "
	options=("Be Gone Thot" "Bill Nye Chant" "Bomb Planted" "Cant Hurt Me" "CHOCOLATE!" "Concentrate" "Dab Distorted" "Dirty Jobs" "Discord - Message" "Discord - Incoming Call" "Discord - Joining (3x)" "Drinking Problem" "FBI Open Up" "Get To Choppa" "Gotcha Bitch" "Chris Hansen" "I See Dead People" "Its My Money" "Kinky?!?" "Lahey - Clock's Tickin" "Lahey - Drunk/Sober Enough" "Lahey - I Condemn This" "Medic!" "Mr. Meeseeks" "My Leg" "OOF" "NOT THE BEES!" "Points Dont Matter" "Price Is Wrong" "Pull The Trigger" "IM THE MOUNTAIN" "RUN AWAY!" "Sausages" "Sexual Helicopter" "Virgin In House" "We Got Him" "WORLDSTAR!" "Yakety Sax" "Zoidberg - Boooo" "Zoidberg - Scuddling" "Quit")
	select voiceinput in "${options[@]}"
	do
	case $voiceinput in
		"Be Gone Thot")
			cp $SCRIPTLOCATION/MicSpams/be_gone_thot_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
			#MATH=$(( $($BeGoneThot) + 1 ))
			#sudo sed -i '/BeGoneThot/ s/.*/BeGoneThot='$MATH'/' /swapMicSpams.conf
		"Bill Nye Chant")
			cp $SCRIPTLOCATION/MicSpams/bill_nye_chant_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Bomb Planted")
			cp $SCRIPTLOCATION/MicSpams/bomb_planted_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Cant Hurt Me")
			cp $SCRIPTLOCATION/MicSpams/cant_hurt_me_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"CHOCOLATE!")
			cp $SCRIPTLOCATION/MicSpams/chocolate_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Concentrate")
			cp $SCRIPTLOCATION/MicSpams/concentrate_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Dab Distorted")
			cp $SCRIPTLOCATION/MicSpams/dab_distorted_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Dirty Jobs")
			cp $SCRIPTLOCATION/MicSpams/dirty_jobs_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Discord - Message")
			cp $SCRIPTLOCATION/MicSpams/discord_message_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Discord - Incoming Call")
			cp $SCRIPTLOCATION/MicSpams/discord_incoming_call_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Discord - Joining (3x)")
			cp $SCRIPTLOCATION/MicSpams/discord_joining_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Drinking Problem")
			cp $SCRIPTLOCATION/MicSpams/drinking_problem_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"FBI Open Up")
			cp $SCRIPTLOCATION/MicSpams/fbi-open-up-sfx_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Get To Choppa")
			cp $SCRIPTLOCATION/MicSpams/get_to_choppa_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Gotcha Bitch")
			cp $SCRIPTLOCATION/MicSpams/gotcha_bitch_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Chris Hansen")
			cp $SCRIPTLOCATION/MicSpams/im_chris_hansen_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"I See Dead People")
			cp $SCRIPTLOCATION/MicSpams/i_see_dead_people_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Its My Money")
			cp $SCRIPTLOCATION/MicSpams/its_my_money_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Kinky?!?")
			cp $SCRIPTLOCATION/MicSpams/kinky_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Lahey - Clock's Tickin")
			cp $SCRIPTLOCATION/MicSpams/lahey_clocks_tickin_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Lahey - Drunk/Sober Enough")
			cp $SCRIPTLOCATION/MicSpams/lahey_drunk_sober_enough_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Lahey - I Condemn This")
			cp $SCRIPTLOCATION/MicSpams/lahey_i_condemn_this_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Medic!")
			cp $SCRIPTLOCATION/MicSpams/medic_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Mr. Meeseeks")
			cp $SCRIPTLOCATION/MicSpams/mr_meeseeks_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"My Leg")
			cp $SCRIPTLOCATION/MicSpams/my_leg_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"NOT THE BEES!")
			cp $SCRIPTLOCATION/MicSpams/not_the_bees_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"OOF")
			cp $SCRIPTLOCATION/MicSpams/oof_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Points Dont Matter")
			cp $SCRIPTLOCATION/MicSpams/points_dont_matter_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Price Is Wrong")
			cp $SCRIPTLOCATION/MicSpams/price_is_wrong.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Pull The Trigger")
			cp $SCRIPTLOCATION/MicSpams/pull_the_trigger_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"IM THE MOUNTAIN")
			cp $SCRIPTLOCATION/MicSpams/stoned_jesus_im_the_mountain_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"RUN AWAY!")
			cp $SCRIPTLOCATION/MicSpams/run_away_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Sausages")
			cp $SCRIPTLOCATION/MicSpams/sausages_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Sexual Helicopter")
			cp $SCRIPTLOCATION/MicSpams/sexually_identify_helicopter_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Virgin In House")
			cp $SCRIPTLOCATION/MicSpams/22_yo_virgin_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"We Got Him")
			cp $SCRIPTLOCATION/MicSpams/we_got_him_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"WORLDSTAR!")
			cp $SCRIPTLOCATION/MicSpams/world_star_spam_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Yakety Sax")
			cp $SCRIPTLOCATION/MicSpams/yakety_sax_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Zoidberg - Boooo")
			cp $SCRIPTLOCATION/MicSpams/zoidberg_boo_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Zoidberg - Scuddling")
			cp $SCRIPTLOCATION/MicSpams/zoidberg_scuddling_voice_input.wav "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"; printf "${GREEN}${BOLDFONT}$voiceinput${NORMALFONT}${NC} entered"; break;;
		"Quit")
			exit;;
		*) echo "invalid option $REPLY";;
	esac
	done
done




#cp ../MicSpams/ "/home/$USER/.steam/steam/steamapps/common/$GAME/voice_input.wav"





#############
# SCRIPT VARS
#############
TODAYISO=`date '+%Y%m%d-%H%M'`
SCRIPTDIR=$(pwd)
LOGFILE=$SCRIPTDIR/${0##*/}.log
# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color



function fn_check_distro(){
	if [[ $(apropos "package manager") = *eopkg* ]] || [[ $(lsb_release -a) = *olus* ]] || [[ $(cat /etc/issue) = *olus* ]];then
		alias 'apt-get'=eopkg
		DISTRO="solus"
	elif [[ $(apropos "package manager") = *apt-get* ]] || [[ $(lsb_release -a) = *buntu* ]] || [[ $(lsb_release -a) = *ebian* ]];then
		alias eopkg="apt-get"
		DISTRO="debian"
	elif [[ $(apropos "package manager") = *pacman* ]]; then
		# If the `apropos` command is not working you'll need to run `sudo mandb`
		DISTRO="arch"
	fi
}


fn_check_distro
if [[ $1 != *help* ]]; then
	printf "$TODAYISO\tLinux distro determined to be: ${DISTRO^^} \n">>$LOGFILE
fi


############################
# Backup original conf files
############################
if [[ $DISTRO = *solus* ]] && [[ ! -f /usr/share/pulseaudio/daemon.conf.BAKORIGINAL ]]; then
    sudo cp /usr/share/pulseaudio/daemon.conf /usr/share/pulseaudio/daemon.conf.BAKORIGINAL
	printf "$TODAYISO\tCould not file backup of \"/usr/share/pulseaudio/daemon.conf\". One has been created. \n">>$LOGFILE
fi
if [[ $DISTRO = *solus* ]] && [[ ! -f /usr/share/pulseaudio/client.conf.BAKORIGINAL ]]; then
    sudo cp /usr/share/pulseaudio/client.conf /usr/share/pulseaudio/client.conf.BAKORIGINAL
	printf "$TODAYISO\tCould not file backup of \"/usr/share/pulseaudio/client.conf\". One has been created. \n">>$LOGFILE
fi
if [[ $DISTRO != *solus* ]] && [[ ! -f /etc/pulseaudio/daemon.conf.BAKORIGINAL ]]; then
    sudo cp /etc/pulseaudio/daemon.conf /etc/pulseaudio/daemon.conf.BAKORIGINAL
	printf "$TODAYISO\tCould not file backup of \"/etc/pulseaudio/daemon.conf\". One has been created. \n">>$LOGFILE
fi
if [[ $DISTRO != *solus* ]] && [[ ! -f /etc/pulseaudio/client.conf.BAKORIGINAL ]]; then
    sudo cp /etc/pulseaudio/client.conf /etc/pulseaudio/client.conf.BAKORIGINAL
	printf "$TODAYISO\tCould not file backup of \"/etc/pulseaudio/client.conf\". One has been created. \n">>$LOGFILE
fi


##############################################################
# Change Pulse Audio memory allocations (prevent memory leaks)
##############################################################
if [[ $DISTRO = *solus* ]] && [[ $1 = *mem* ]] && [[ $2 = *on* ]]; then
	sudo sed -i '/shm-size-bytes/ s/.*/shm-size-bytes = '8'/' /usr/share/pulseaudio/daemon.conf
	sudo sed -i '/shm-size-bytes/ s/.*/shm-size-bytes = '8'/' /usr/share/pulseaudio/client.conf
	printf "$TODAYISO\tRunning MEM ON. shm-size-bytes has been set to 8 \n">>$LOGFILE
elif [[ $DISTRO != *solus* ]] && [[ $1 = *mem* ]] && [[ $2 = *on* ]];then
	sudo sed -i '/shm-size-bytes/ s/.*/shm-size-bytes = '8'/' /etc/pulseaudio/daemon.conf
	sudo sed -i '/shm-size-bytes/ s/.*/shm-size-bytes = '8'/' /etc/pulseaudio/client.conf
	printf "$TODAYISO\tRunning MEM ON. shm-size-bytes has been set to 8 \n">>$LOGFILE
fi

if [[ $DISTRO = *solus* ]] && [[ $1 = *mem* ]] && [[ $2 = *off* ]]; then
    sudo cp /usr/share/pulseaudio/daemon.conf.BAKORIGINAL /usr/share/pulseaudio/daemon.conf
    sudo cp /usr/share/pulseaudio/client.conf.BAKORIGINAL /usr/share/pulseaudio/client.conf
	printf "$TODAYISO\tRunning MEM OFF. Settings restored from backup files in \"/usr/share/pulseaudio/\". \n">>$LOGFILE
elif [[ $DISTRO != *solus* ]] && [[ $1 = *mem* ]] && [[ $2 = *ff* ]];then
    sudo cp /etc/pulseaudio/daemon.conf.BAKORIGINAL /etc/pulseaudio/daemon.conf
    sudo cp /etc/pulseaudio/client.conf.BAKORIGINAL /etc/pulseaudio/client.conf
	printf "$TODAYISO\tRunning MEM OFF. Settings restored from backup files in \"/etc/pulseaudio/\". \n">>$LOGFILE
fi


######################
# Alt Launcher options
######################
# Garry's Mod for Linux tends to crash and have instability issues
# Allegedly some of this is due to GMod using Internet Explorer protocols to download server files
# Additionally it may be due to Linux's filesystem case-sensitivity (Windows directories are not case-sensitive)
# For some reason GMod might actually have a chance of running when you run the following commands:
if [[ $1 = *laun* ]]; then
	printf "$TODAYISO\tRunning LAUNCH. Attempting to run GMod via \"~/.local/share/Steam/steamapps/common/GarrysMod/hl2.sh\". \n">>$LOGFILE
	cd ~/.local/share/Steam/steamapps/common/GarrysMod
	./hl2.sh
fi


############
# Help texts
############
if [[ $1 = *help* ]]; then
	printf "${BOLDFONT}./gmodinux.sh mem on${NORMALFONT} - Limit Pulse Audio memory allocation to prevent mem leaks \n"
	printf "${BOLDFONT}./gmodinux.sh mem off${NORMALFONT} - Revert Pulse Audio to unlimited/max mem allocation \n"
	printf "${BOLDFONT}./gmodinux.sh launch${NORMALFONT} - Launch Garry\'s Mod via Steam\'s native shell script \n"
	printf "${BOLDFONT}./gmodinux.sh list${NORMALFONT} - Show a list of Steam/GMod launcher options which may help compatibility \n"
	printf "${BOLDFONT}./gmodinux.sh help${NORMALFONT} - Show this \'help\' text \n"
fi

if [[ $1 = *list* ]]; then
	printf "${BOLDFONT}-nojoy${NORMALFONT} - Instruct game to not expect joystick/controller input. \n"
	printf "${BOLDFONT}-USEALLAVAILABLECORES${NORMALFONT} - Make GMod use all of your CPU cores. If all of your CPU cores are NOT being used after using this launch option then disable it as it may cause more stuttering. \n"
	printf "${BOLDFONT}-lowmemory${NORMALFONT} - Launches the game in 4gb memory mode. This may prevent maxing out memory usage. \n"
	printf "${BOLDFONT}-autoconfig${NORMALFONT} - Restores video and performance settings to default for the current hardware detected. Ignores settings inside any .cfg files until this parameter is removed. \n"
	printf "${BOLDFONT}-dxlevel <level> ${NORMALFONT} - Forces a specific DirectX version when launching the game. Below are common levels: \n"
	printf "\t${BOLDFONT}-dxlevel 80 ${NORMALFONT} \n"
	printf "\t${BOLDFONT}-dxlevel 81 ${NORMALFONT} \n"
	printf "\t${BOLDFONT}-dxlevel 90 ${NORMALFONT} \n"
	printf "\t${BOLDFONT}-dxlevel 95 ${NORMALFONT} \n"
	printf "\t${BOLDFONT}-dxlevel 98 ${NORMALFONT} \n"
	printf "${BOLDFONT}-multirun${NORMALFONT} - Run multiple instances of GMod on your PC. \n"
	printf "${BOLDFONT}-high${NORMALFONT} - Sets the game's priority to High. \n"
	printf "${BOLDFONT}-nosound${NORMALFONT} - Disable sound support. \n"
	printf "${BOLDFONT}FULL LIST OF OPTIONS${NORMALFONT} - https://developer.valvesoftware.com/wiki/Command_Line_Options \n"
	
fi





# Support Links:
# https://support.facepunchstudios.com/hc/en-us/articles/213577689-Common-start-up-Problems-and-Solutions
# https://developer.valvesoftware.com/wiki/Command_Line_Options























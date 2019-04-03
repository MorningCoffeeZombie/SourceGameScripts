#!/bin/bash

# This script was made for Linux games that do not support the Steam Broswer, therefore incumbering your ability to check the time. This script is meant to be run in a terminal on your second monitor to show the time of day and script runtime. 


# Text effects
BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
CPUUSAGE="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"


PLAYTIME=`date \r`
STARTTIME="$(date -u +%s)"



while :
do
	clear
	echo "I tell you the time while you play games!"
	echo "Press [CTRL+C] to stop..."
	date +"%I:%M %p %D"
	ENDTIME="$(date -u +%s)"
	ELAPSED="$(($ENDTIME-$STARTTIME))"
	if [[ "$ELAPSED" -le 59 ]]; then
		SEC="$ELAPSED"
		echo "Play Time: $SEC sec"
	elif [[ "$ELAPSED" -ge 60 ]] && [[ "$ELAPSED" -le 3599 ]]; then
		MIN="$(($ELAPSED/60))"
		echo "Play Time: $MIN min"
	elif [[ "$ELAPSED" -ge 3600 ]]; then
		MIN="$(($ELAPSED/60))"
		HOUR="$(($ELAPSED/120))"
		echo "Play Time: ${HOUR%%.*} hr $MIN min"
	fi
	echo
	echo "CPU:	      $CPUUSAGE" 
	echo
	free -m
	echo
	if nvidia-smi &>/dev/null; then
		nvidia-smi
	fi
	sleep 5s
	clear
done






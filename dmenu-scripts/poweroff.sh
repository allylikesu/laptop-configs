#!/bin/bash
#sudo shutdown -h now
#sudo shutdown -r now

choice=$(echo -e "shutdown\nreboot" | dmenu -sb "#500000" -p "Power:")

if [ $choice = "shutdown" ]; then
	doas shutdown -h now
else
	if [ $choice = "reboot" ]; then
		doas shutdown -r now
	else
		echo "Exiting" && exit 0
	fi
fi

#!/bin/sh

# Shows a prompt where a user can choose to shutdown or reboot.
# Note, your user/group must be able to execute /bin/shutdown without a password.

choice=$(echo "shutdown\nreboot" | dmenu -sb "#cc0000" -sf "#ffffff" -p "Power:")

if [ $choice = "shutdown" ]; then
	doas shutdown -h now
else
	if [ $choice = "reboot" ]; then
		doas shutdown -r now
	else
		echo "Exiting" && exit 0
	fi
fi

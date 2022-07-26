#!/bin/sh

# Lists all files in $SCRIPTS_DIR/control-panel-scripts, then executes the chosen script.

SCRIPTS_DIR="/home/laptop/dmenu-scripts"

choice=$(ls -t $SCRIPTS_DIR/control-panel-scripts |  dmenu -p "control panel:")

if [ "$choice" ]; then
	$SCRIPTS_DIR/control-panel-scripts/"$(echo $choice)"
else
	echo "Exiting" && exit 0
fi

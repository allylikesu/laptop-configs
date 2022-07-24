#!/bin/sh

SCRIPTS_DIR="/home/laptop/dmenu-scripts/"

choice=$(ls $SCRIPTS_DIR/control-panel-scripts |  dmenu -p "control panel:")
#echo "0" >> $SCRIPTS_DIR/debug
#echo "[DEBIG] retval: "$retval
#echo "[DEBUG] choice: "$choice

#echo "1" >> $SCRIPTS_DIR/debug
if [ "$choice" ]; then
	$SCRIPTS_DIR/control-panel-scripts/$choice
else
	echo "Exiting" && exit 0
fi

#!/bin/bash

IMG_DIR="$HOME/Images/"
SCRIPTS_DIR="$HOME/dmenu-scripts"



cd $IMG_DIR

selection=$(echo -e "Entire screen\nManual selection" | dmenu -p "Take a screenshot:")

if [ "$selection" = "Entire screen" ]; then
	scrot -e "$SCRIPTS_DIR/confirm.sh -r 'Rename \$f?' '$SCRIPTS_DIR/file-rename.sh \$f'"
else 
	if [ "$selection" = "Manual selection" ]; then
		scrot -s -f -i -e "$SCRIPTS_DIR/confirm.sh -r 'Rename \$f?' '$SCRIPTS_DIR/file-rename.sh \$f'"
	else 
		echo "Invalid selection - quitting" && exit 0
	fi
fi

#!/bin/sh

# Take a screenshot, then prompt to rename it.
# Before screenshot is taken, user may choose to screenshot the whole screen or manually select a window (click) or custom rectangle (click and drag).

IMG_DIR="$HOME/Images/"
SCRIPTS_DIR="$HOME/dmenu-scripts"



cd $IMG_DIR

selection=$(echo "Entire screen\nManual selection" | dmenu -p "Take a screenshot:")

if [ "$selection" = "Entire screen" ]; then
	scrot -e "$SCRIPTS_DIR/confirm.sh -r 'Rename \$f?' '$SCRIPTS_DIR/file-rename.sh \$f'"
else 
	if [ "$selection" = "Manual selection" ]; then
		scrot -s -f -i -e "$SCRIPTS_DIR/confirm.sh -r 'Rename \$f?' '$SCRIPTS_DIR/file-rename.sh \$f'"
	else 
		echo "Invalid selection - quitting" && exit 0
	fi
fi

#!/bin/bash

SCRIPTS_DIR="$HOME/dmenu-scripts"

FILE=$1
FILEDIR=$(dirname $FILE)
FILENAME=$(basename $FILE)

newName=$(echo "" | dmenu -p "Enter new name for $FILENAME:")

if [ $newName ]; then
	mv "$FILE" "$FILEDIR/$newName"
fi

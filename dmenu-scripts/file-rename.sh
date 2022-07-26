#!/bin/sh

# takes a path to a file as an argument. Will show a rename prompt, and change the file's name to the user's input.
# Note, this only changes the file name, entering a path will not work.

SCRIPTS_DIR="$HOME/dmenu-scripts"

FILE=$1
FILEDIR=$(dirname $FILE)
FILENAME=$(basename $FILE)

newName=$(echo "" | dmenu -p "Rename $FILENAME:")

if [ $newName ]; then
	mv "$FILE" "$FILEDIR/$newName"
fi

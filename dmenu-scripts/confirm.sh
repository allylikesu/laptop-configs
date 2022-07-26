#!/bin/sh

# Simple Yes/No confirmation script for dmenu.
# Usage:  ./confirm.sh [-r, --reverse] [PROMPT] [COMMAND]
# Runs COMMAND on a 'Yes' selection.
# If the -r or --reverse flag is specified, the options will be shown as No/Yes.

options="Yes\nNo"
prompt=$1
cmd=$2

echo "$@"

case $1 in
	"-r" | "--reverse")
		options="No\nYes"
		prompt=$2
		cmd=$3
		;;
esac

#[[ $(echo $options | dmenu -p "$prompt") = "Yes" ]] && $cmd
if [ $(echo $options | dmenu -p "$prompt") = "Yes" ]; then
	$cmd
fi

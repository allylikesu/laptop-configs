#!/bin/bash

# Shows bookmarks (stored in the below array), then opens surf (in tabbed) to that webpage.
# If an input is not the name of a bookmark, the input will be assumed to be the target URL.

declare -A bookmarks
bookmarks[forensics]="https://katyisd.instructure.com/courses/526876/modules"
bookmarks[precal]="https://katyisd.instructure.com/courses/571318/modules"
bookmarks[econ]="https://katyisd.instructure.com/courses/527556/modules"
bookmarks[english]="https://katyisd.instructure.com/courses/527565/modules"
bookmarks[conmsci]="https://katyisd.instructure.com/courses/526798/modules"

bookmarks[canvas]="https://katyisd.instructure.com/"
bookmarks[hac]="https://homeaccess.katyisd.org/HomeAccess/Home/WeekView"
bookmarks[google]="https://google.com"
bookmarks[duckduckgo]="https://duckduckgo.com"
bookmarks[archwiki]="https://wiki.archlinux.org"

choice=$(printf "%s\n" "${!bookmarks[@]}" | dmenu -p "surf:")

if [ "$choice" ]; then
	if [ "${bookmarks[$choice]}" = "" ]; then
		tabbed -fdn tabbed-surf -r 2 surf -isme '' $choice &
	else
		tabbed -fdn tabbed-surf -r 2 surf -isme '' "${bookmarks[$choice]}" &
	fi
else
	echo "Exiting" && exit 0
fi

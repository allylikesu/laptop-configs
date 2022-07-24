#!/bin/bash
declare -A bookmarks
bookmarks[physics]="https://katyisd.instructure.com/courses/498026/modules"
bookmarks[history]="https://eagleonline.hccs.edu/courses/189060/modules"
bookmarks[leadworthy]="https://katyisd.instructure.com/courses/498083"
bookmarks[algebra]="https://katyisd.instructure.com/courses/498329/modules"
bookmarks[english]="https://katyisd.instructure.com/courses/497837/modules"
bookmarks[french]="https://katyisd.instructure.com/courses/499236/modules"
bookmarks[compsci]="https://katyisd.instructure.com/courses/498739/modules"
bookmarks[canvas]="https://katyisd.instructure.com/"
bookmarks[hac]="https://homeaccess.katyisd.org/HomeAccess/Home/WeekView"
bookmarks[google]="https://google.com"
bookmarks[duckduckgo]="https://duckduckgo.com"
bookmarks[archwiki]="https://wiki.archlinux.org"

choice=$(printf "%s\n" "${!bookmarks[@]}" | dmenu -p "surf:")

if [ "$choice" ]; then
	tabbed -fdn tabbed-surf -r 2 surf -isme '' "${bookmarks[$choice]}" &
else
	echo "Exiting" && exit 0
fi

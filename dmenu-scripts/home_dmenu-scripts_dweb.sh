#!/bin/zsh
lines=(
	"physics https://katyisd.instructure.com/courses/498026/modules"
	"history https://eagleonline.hccs.edu/courses/189060/modules"
	"leadworthy https://katyisd.instructure.com/courses/498083"
	"algebra https://katyisd.instructure.com/courses/498329/modules"
	"english https://katyisd.instructure.com/courses/497837/modules"
	"french https://katyisd.instructure.com/courses/499236/modules"
	"compsci https://katyisd.instructure.com/courses/498739/modules"
	"canvas https://katyisd.instructure.com/"
	"google https://google.com"
)

choices=$(print -l ${lines[@]} | awk '{print $1}')

choice=$(print $choices | dmenu -p "surf:")

for bookmark in $lines
do
	name=$(echo $bookmark | awk '{print $1}')
	url=$(echo $bookmark | awk '{print $2}')
	echo name:$name
	echo url:$url
	if [ "$name" = "$choice" ]; then
		tabbed -dn tabbed-surf -r 2 surf -e '' "$url" &
		return
	fi
done
tabbed -dn tabbed-surf -r 2 surf -e '' "$choice" &


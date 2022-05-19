#!/bin/bash

if [ $UID != 0 ]; then
	echo "You must run this script as root!"
	exit
fi

echo "This is a script to preform a post-install configuration of Void Linux based on my laptop."
echo "Press enter to continue, or CTRL-c to quit."
read
echo -n "enter name of user to install to: "
read username
cd /home/$username

# install packages
echo " -> installing required packages using xbps-install..."
xbps-install -Su
xbps-install curl unzip zsh htop xorg git make gcc xorg-server-devel libXinerama-devel fontconfig-devel libXft-devel vim pkg-config webkit2gtk webkit2gtk-devel gcr gcr-devel

# install custom suckless software suite
echo " -> downloading, compiling, and installing suckless software..."
git clone https://github.com/allylikesu/laptop-configs
mv laptop-configs/dmenu-scripts /home/$username/
cd laptop-configs/dmenu
make clean install
cd ../dwm
make clean install
cd ../scroll
make clean install
cd ../slstatus
make clean install
cd ../st
make clean install
cd ../surf
make clean install
cd ../tabbed
make clean install
cd ../../

# set .xinitrc
echo " -> setting .xinitrc..."
echo -e "slstatus &\nexec dwm" >> .xinitrc

# install ubuntu fonts
echo " -> installing fonts..."
curl -O https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip
unzip 0cef8205-ubuntu-font-family-0.83.zip 
rm -r __MACOSX/
mv ubuntu-font-family-0.83/ /usr/share/fonts/
fc-cache

echo
if [ $username != laptop ]; then
	echo "[!] username is not 'laptop'. some applications will not be able to find ~/dmenu-scripts."
	echo "    to fix, edit & recompile appropriate software."
fi

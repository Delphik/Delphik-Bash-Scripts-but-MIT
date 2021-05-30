#!/bin/bash

#Updater for Manjaro

# Set BASH to quit script and exit on errors:

set -e

#Updates with Pacman by default (yay if passed the -y flag) and flatpak

if [ "$1" == "-y" ]; then
    echo "Updating Repos and AUR with yay" | cowsay | lolcat
    yay -Syu -y
else
    echo "Updating Repos with pacman" | cowsay | lolcat
    sudo pacman -Syu 
fi

echo "Updating Flatpak" | cowsay | lolcat
sudo flatpak update -y

echo "Updates Complete" | cowsay | lolcat
exit

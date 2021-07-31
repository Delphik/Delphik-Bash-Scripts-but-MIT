#!/bin/bash

#Updater for Manjaro

# Set BASH to quit script and exit on errors:

set -e

#Updates with Pacman by default (yay if passed the -y flag) and then flatpak
# -p flag uses pamac, -pa pamac with AUR

if [ "$1" == "-y" ]; then
    echo "Updating Repos and AUR with yay" | cowsay | lolcat
    yay -Syu -y

elif [ "$1" == "-p" ]; then
    echo "Updating Repos with Pamac" | cowsay | lolcat
    sudo pamac update --no-confirm
    
elif [ "$1" == "-pa" ]; then
    echo "Updating Repos and AUR with Pamac" | cowsay | lolcat
    sudo pamac update -a --no-confirm
      
else
    echo "Updating Repos with pacman" | cowsay | lolcat
    sudo pacman -Syu 
fi

echo "Updating Flatpak" | cowsay | lolcat
sudo flatpak update -y

echo "Updates Complete" | cowsay | lolcat
exit


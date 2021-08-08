#!/bin/bash

#Updater for Manjaro

# Set BASH to quit script and exit on errors:
# Dependencies: pamac, yay, flatpak, lolcat, cowsay

set -e

#Updates with Pacman by default and then flatpak
# -y        Updates via Yay
# -p        Updates via pamac 
# -pa       Updates via pamac with AUR flag
# -k        Refreshes pacman keyring then updates via flatpak
# -h        Help

flatpak_update () {
    echo "Updating Flatpak" | cowsay | lolcat
    sudo flatpak update -y | lolcat

}

pacman_update () {
    echo "Updating Repos with pacman" | cowsay | lolcat
    sudo pacman -Syu | lolcat
}

help () {
    echo "Mjup Help" | cowsay | lolcat
    echo
    echo "Updates with Pacman by default and then flatpak" | lolcat
    echo " -y        Updates via Yay" | lolcat
    echo " -p        Updates via pamac"  | lolcat
    echo " -pa       Updates via pamac with AUR flag" | lolcat
    echo " -k        Refreshes pacman keyring then updates via flatpak" | lolcat
    echo " -h, -help Help " | lolcat
    exit
}

if [ "$1" == "-y" ]; then
    echo "Updating Repos and AUR with yay" | cowsay | lolcat
    yay -Syu -y
    flatpak_update

elif [ "$1" == "-h" ]; then
    help

elif [ "$1" == "-help" ]; then
    help

elif [ "$1" == "-p" ]; then
    echo "Updating Repos with Pamac" | cowsay | lolcat
    sudo pamac update --no-confirm
    flatpak_update

elif [ "$1" == "-pa" ]; then
    echo "Updating Repos and AUR with Pamac" | cowsay | lolcat
    sudo pamac update -a --no-confirm
    flatpak_update

elif [ "$1" == "-k" ]; then
    echo "Refreshing Pacman Keyring" | cowsay | lolcat
    sudo pacman-key --populate archlinux
    pacman_update
else
    pacman_update 
    flatpak_update
fi


echo "Updates Complete" | cowsay | lolcat
exit


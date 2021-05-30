#!/bin/bash

#author Delphik
#Downloads audio mp3 of a video using youtube-dl
#   Checks for and resolves dependencies (rpm, apt, and pacman support) 
#   before executing youtube-dl then checks for updates

#Declare Static Variables

start= $pwd

# Set BASH to quit script and exit on errors:

set -e

# Check for youtube-dl and installs if necessary

if [ ! -e /usr/local/bin/youtube-dl ]; then
    echo "Youtube-dl not present"
    echo "Installing youtube-dl"
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
fi

# Checks for ffmpeg and installs if necessary for apt pacman and dnf based distros

if [ ! -e /usr/bin/ffmpeg ]; then
    echo "ffmpeg not found, installing ffmpeg"
    if [ -e /usr/bin/pacman]; then
        echo "Installing ffmpeg with pacman"
        yes | sudo pacman -S ffmpeg 
    fi

    if [ -e /usr/bin/apt]; then
        echo "Installing ffmpeg with apt"
        yes | sudo apt install ffmpeg
    fi

    if [ -e /usr/bin/dnf]; then
        echo "Installing ffmpeg with dnf"
        yes | sudo dnf install ffmpeg
    fi
fi

#Creates Directory ~/Music/ydla if it does not exist

if [ ! -d ~/Music/ydla ]; then
    echo -n $"Creating Directory : ~/Music/ydla"
    mkdir ~/Music/ydla
fi

#Returns to original directory, checks for updates to youtube-dl, and exits

leave () {
    cd $start
    youtube-dl -U
    exit
}

#Downloads mp3 of link passed to ~/Music/ydla
if [ -d $2 ]; then
    cd $2
else
        cd ~/Music/ydla
fi

    youtube-dl -x --audio-quality 0 --audio-format mp3  --add-metadata --embed-thumbnail --ignore-errors $1
    leave


exit

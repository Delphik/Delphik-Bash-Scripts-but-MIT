#!/bin/bash

#New Setup Scripte for Ubuntu

# Set BASH to quit script and exit on errors:

set -e

# Option For CLI Apps
if[ "$1" == "-c" ]; then
    cli_install

# Option for Help Menu
elif [ "$1" == "-h" ]; then
    help
else
cli_install
gui_install
fi

# Install CLI Apps
cli_install () {
sudo apt install tmux htop vim powerline lolcat tldr fish git neofetch cowsay  -y
}

# Install GUI Apps
gui_install () {
sudo apt install vlc deluge thunderbird -y
}

# Install Kde Specific Apps

kde_install () {
sudo apt install yakuake -y
}

# Help function

help () {
    echo "Ubuntu Setup Help"
    echo
    echo " -c       Installs Command Line Apps only"
    exho " -h       Help Menu"
}

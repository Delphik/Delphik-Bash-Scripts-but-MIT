#!/bin/bash

#Updater for Ubuntu

# Set BASH to quit script and exit on errors:

set -e

echo "Updating Ubuntu" | cowsay | lolcat

sudo apt update 
sudo apt upgrade -y
sudo apt autoremove -y

echo "Updates Complete" | cowsay | lolcat

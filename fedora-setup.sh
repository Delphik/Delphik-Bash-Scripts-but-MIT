#!/bin/bash

#author Delphik
#setup script for fedora 34

#initial updates
echo "Running Initial Updates"
sudo dnf update -y
sudo flatpak update -y


#install RPM Fusion
echo "Adding RPM Fusion"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#add flathhub repo
echo "Adding Flathub Repo"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install apps via repos
echo "Installing Apps via repos"
sudo dnf install tmux tmux-powerline powerline vim-powerline git breeze-gtk fish neofetch htop vim yakuake tldr deluge thunderbird -y

#install apps via flatpak
echo "Installing Apps via Flatpak"
sudo flatpak install com.visualstudio.code org.telegram.desktop com.discordapp.Discord com.microsoft.Teams -y

#make local script bin
echo "Creating Local bin directory"
mkdir ~/.local/bin
export PATH="~/.local/bin:$PATH"

#Enables tmux-powerline
echo 'source /usr/share/tmux/powerline.conf' >> ~/.tmux.conf
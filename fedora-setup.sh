#!/bin/bash

#author Delphik
#setup script for fedora 33

#initial updates
sudo dnf update -y
sudo flatpak update -y

#install RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#add flathhub repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#install apps via repos
sudo dnf install tmux tmux-powerline fish neofetch htop vim yakuake tldr deluge thunderbird -y

#install apps via flatpak
sudo flatpak install -y
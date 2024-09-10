#!/bin/bash

# author Max Henny
# Personal config script for Ultramarine linux


# Dnf installations
sudo dnf install vlc tmux tldr yakuake -y


# Flatpak apps installations
# Apps in order, discord, telegram, spotify, obs, vscode
sudo flatpak install com.discordapp.Discord org.telegram.desktop com.spotify.Client com.obsproject.Studio com.visualstudio.code -y

# Flatpak game installations
# Apps in order, protonup-qt, protontricks
sudo flatpak install net.davidotek.pupgui2 com.github.Matoking.protontricks -y

# Tmux Autostart Config
#from mark hansen https://www.markhansen.co.nz/auto-start-tmux/

echo '# Tmux Autostart script by mark hansen' >> ~/.zshrc
echo 'if [ -n "$PS1" ] && [ -z "$TMUX" ]; then' >> ~/.zshrc
echo '  tmux new-session -A -s main' >> ~/.zshrc
echo 'fi' >> ~/.zshrc




echo 'Complete'
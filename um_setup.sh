#!/bin/bash

# author Max Henny
# Personal config script for Ultramarine linux

#initial updates
echo "Running Initial Updates"
sudo dnf update -y
sudo flatpak update -y

# Dnf installations
echo 'DNF installations'
sudo dnf install vlc tmux tldr yakuake tmux-powerline powerline vim-powerline -y


# Flatpak apps installations
# Apps in order, discord, telegram, spotify, obs, vscode, obsidian, edge, chromium, bitwarden, krita, warehouse, shortwave
echo 'Flatpak App Install'
sudo flatpak install com.discordapp.Discord org.telegram.desktop com.spotify.Client com.obsproject.Studio com.visualstudio.code md.obsidian.Obsidian com.microsoft.Edge org.chromium.Chromium com.bitwarden.desktop org.kde.krita io.github.flattool.Warehouse de.haeckerfelix.Shortwave -y

# Flatpak game installations
# Apps in order, protonup-qt, protontricks, retroarch, heroic games launcher, lutris, PortProton, steamlink
sudo flatpak install net.davidotek.pupgui2 com.github.Matoking.protontricks org.libretro.RetroArch com.heroicgameslauncher.hgl net.lutris.Lutris ru.linux_gaming.PortProton com.valvesoftware.SteamLink -y

# Tmux Autostart Config
#from mark hansen https://www.markhansen.co.nz/auto-start-tmux/

echo '# Tmux Autostart script by mark hansen' >> ~/.zshrc
echo 'if [ -n "$PS1" ] && [ -z "$TMUX" ]; then' >> ~/.zshrc
echo '  tmux new-session -A -s main' >> ~/.zshrc
echo 'fi' >> ~/.zshrc

#Enables tmux-powerline
echo 'source /usr/share/tmux/powerline.conf' >> ~/.tmux.conf


echo 'Complete'
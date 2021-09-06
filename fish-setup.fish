#!/bin/fish

# setup script for fish shell

# https://fedoramagazine.org/add-power-terminal-powerline/

# sets fish to default shell
sudo chsh -s /usr/bin/fish (whoami)

# disable greeting
echo "set -U fish_greeting" >> ~/.config/fish/config.fish

# disable ? globbing
echo "set -U fish_feature qmark-noglob" >> ~/.config/fish/config.fish

# fix for flatpaks on desktop
# https://github.com/fish-shell/fish-shell/issues/7485#issuecomment-728984689

echo "set -l xdg_data_home $XDG_DATA_HOME ~/.local/share" >> ~/.config/fish/config.fish
echo "set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share" >> ~/.config/fish/config.fish
echo >> ~/.config/fish/config.fish
echo "for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin" >> ~/.config/fish/config.fish
echo "    if test -d $flatpakdir" >> ~/.config/fish/config.fish
echo "        contains $flatpakdir $PATH; or set -a PATH $flatpakdir" >> ~/.config/fish/config.fish
echo "    end" >> ~/.config/fish/config.fish
echo "end" >> ~/.config/fish/config.fish

# Tmux autostart
if [ -e /usr/bin/tmux ]
    echo "if status is-interactive
    and not set -q TMUX
        exec tmux
    end" >> ~/.config/fish/config.fish
else
    echo "tmux is not installed"
end

#Enables tmux-powerline

#echo 'source /usr/share/tmux/powerline.conf' >> ~/.tmux.conf

#dowload and installs oh-my-fish 
curl -L https://get.oh-my.fish | fish

#installs powerline theme
echo
echo "installing omf powerline theme"
omf install bobthefish

exit
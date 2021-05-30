#!/bin/fish

#setup script for fish shell

#sets fish to default shell
sudo chsh -s /usr/bin/fish (whoami)

#disable greeting
echo "set -U fish_greeting" >> ~/.config/fish/config.fish

#disable ? globbing
echo "set -U fish_feature qmark-noglob" >> ~/.config/fish/config.fish

#enables powerline
#if [ -e /usr/bin/powerline ]
#    echo "set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"" >> ~/.config/fish/config.fish
#    echo "source /usr/share/powerline/bindings/fish/powerline-setup.fish" >> ~/.config/fish/config.fish
#    echo "powerline-setup" >> ~/.config/fish/config.fish
#else
#echo "powerline not installed"
#end

#Tmux autostart
if [ -e /usr/bin/tmux ]
    echo "if status is-interactive
    and not set -q TMUX
        exec tmux
    end" >> ~/.config/fish/config.fish
else
    echo "tmux is not installed"
end

#Enables tmux-powerline

echo 'source /usr/share/powerline/bindings/tmux/powerline.conf' >> ~/.tmux.conf

#dowload and installs oh-my-fish 
#curl -L https://get.oh-my.fish > install
#fish install --path=~/.local/share/omf --config=~/.config/omf
curl -L https://get.oh-my.fish | fish

#installs powerline theme
omf install bobthefish

exit
#!/bin/bash

# install package
sudo apt update
sudo apt install -y gnome-tweak-tool screen
# mkdir to install jetbrains commands
mkdir ~/bin
# change key from capslock to ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
# copy screenrc
cp ../common/.screenrc ~/
# copy vimrc
cp ../common/.vimrc ~/
# add symboliclink
ln -s /usr/bin/xdg-open /bin/open
# import terminal profile
open https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
# import keyboard bindings
open https://askubuntu.com/questions/682513/how-to-backup-restore-system-custom-keyboard-shortcuts
dconf load /org/gnome/desktop/wm/keybindings/ < keybindings.dconf
# setup Docker
open https://docs.docker.com/engine/install/ubuntu/
sudo bash -x ./install-docker.sh
# open setup site
open https://www.st1t.com/entry/2019/04/29/132026  
open https://www.jetbrains.com/ja-jp/toolbox-app/

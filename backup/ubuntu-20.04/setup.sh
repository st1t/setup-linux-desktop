#!/bin/bash

# Change home directory language from Japanese to English
LANG=C xdg-user-dirs-gtk-update

# install package
sudo apt update
sudo apt install -y gnome-tweak-tool

# mkdir to install jetbrains commands
mkdir ~/bin

# Change key repeat https://qiita.com/hidetzu/items/75011200411274aaedfd
echo "xset r rate 195 62" >> ~/.xinitrc

# Disable Win Key https://askubuntu.com/questions/93746/how-can-i-disable-the-windows-key-from-opening-the-activities-overview
gsettings set org.gnome.mutter overlay-key ''

# https://intellij-support.jetbrains.com/hc/en-us/community/posts/205806309-How-to-disable-completely-audible-beeps-
ln -s ~/.vimrc ~/.ideavimrc

# add symboliclink
ln -s /usr/bin/xdg-open /bin/open

# import terminal profile
## open https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf

# import keyboard bindings
open https://askubuntu.com/questions/682513/how-to-backup-restore-system-custom-keyboard-shortcuts
dconf load /org/gnome/desktop/wm/keybindings/ < keybindings.dconf

# Install Spotify
## open https://www.spotify.com/jp/download/linux/
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Setup natural scrolling
diff ./40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo cp ./40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf

# open setup site
open https://www.st1t.com/entry/2019/04/29/132026  
open https://www.jetbrains.com/ja-jp/toolbox-app/

# Print message
echo 'Please reboot'

#!/bin/bash

# install package
sudo apt update
sudo apt install -y gnome-tweak-tool \
  screen \
  jq

# mkdir to install jetbrains commands
mkdir ~/bin

# Change editor from nano to vim
sudo update-alternatives --set editor /usr/bin/vim.basic

# change key from capslock to ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

# Change key repeat https://qiita.com/hidetzu/items/75011200411274aaedfd
echo "xset r rate 195 62" >> ~/.xinitrc

# Disable Win Key https://askubuntu.com/questions/93746/how-can-i-disable-the-windows-key-from-opening-the-activities-overview
gsettings set org.gnome.mutter overlay-key ''

# copy screenrc
cp ../common/.screenrc ~/
echo "alias ls='ls --color'" >> ~.bash_profile

# Change ls color https://www.itmedia.co.jp/help/tips/linux/l0372.html
echo "export LS_COLORS='di=01;36'" >> ~.bash_profile

# copy vimrc
cp ../common/.vimrc ~/

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

# setup Docker
## open https://docs.docker.com/engine/install/ubuntu/
sudo bash -x ./install-docker.sh
sudo usermod -a -G docker $USER

# Install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Install Spotify
## open https://www.spotify.com/jp/download/linux/
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Install AWS SAM
bash -x install-aws-sam.sh

# Install rbenv
sudo apt install -y libssl-dev zlib1g-dev
bash -x  install-rbenv.sh

# Install pyenv
bash -x install-pyenv.sh

# Install envchain
bash -x install-envchain.sh

# Setup natural scrolling
diff ./40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
sudo cp ./40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf

# open setup site
open https://www.st1t.com/entry/2019/04/29/132026  
open https://www.jetbrains.com/ja-jp/toolbox-app/

# Print message
echo 'Please reboot'

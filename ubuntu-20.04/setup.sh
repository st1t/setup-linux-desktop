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

# copy screenrc
cp ../common/.screenrc ~/
echo "alias ls='ls --color'" >> ~.bash_profile

# copy vimrc
cp ../common/.vimrc ~/

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

# open setup site
open https://www.st1t.com/entry/2019/04/29/132026  
open https://www.jetbrains.com/ja-jp/toolbox-app/

# Print message
echo 'Please reboot'

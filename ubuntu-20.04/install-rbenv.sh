#!/bin/bash

# open https://github.com/rbenv/rbenv#basic-github-checkout
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
~/.rbenv/bin/rbenv init >> ~/.bash_profile 2>&1
. ~/.bash_profile

# open https://github.com/rbenv/ruby-build#installation
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build


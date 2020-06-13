#!/bin/bash

apt-get update
apt-get install libsecret-1-dev
git clone https://github.com/sorah/envchain.git
cd envchain/
make && sudo make install
cd ../
rm -rf envchain/


#!/usr/bin/env bash

# Install lunchy
sudo gem install lunchy

# Install brew ( # brew doctor,update,search,install,list,remove)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew install git
brew install wget

# Install postgresql
#######################################
brew install postgresql
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# lunchy start|stop postgres

# Install nodejs
brew install nodejs

# Install python2/3
brew install python
brew install python3
pip install --upgrade --no-use-wheel pip setuptools virtualenv
pip install virtualenv
pip install virtualenvwrapper

# MemCache
brew install libmemcached
LIBMEMCACHED=/opt/local gpip install pylibmc

# Image Lib (required for pillow)
brew install libjpeg
brew install libtiff
brew install libpng





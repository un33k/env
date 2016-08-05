#!/usr/bin/env bash

# Install lunchy
sudo gem install lunchy

# Install brew ( # brew doctor,update,search,install,list,remove)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew install git
brew install wget
brew install ruby

# Install postgresql
#######################################
brew install postgresql
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# lunchy start|stop postgres

# Install nodejs and node version manager
brew install nodejs
git clone git://github.com/creationix/nvm.git ~/.nvm

# Install python2/3 - install python 3.5+ via https://www.python.org/downloads/
brew install python
brew install python3
export PIP_REQUIRE_VIRTUALENV=''
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

#
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

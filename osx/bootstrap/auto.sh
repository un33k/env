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
brew cask reinstall xquartz

# Install postgresql
#######################################
brew install postgresql
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
# lunchy start|stop postgres

# Install postgis
#######################################
brew install postgis

# Install nodejs and node version manager
brew install nodejs
git clone git://github.com/creationix/nvm.git ~/.nvm

# Install python2/3 - install python 3.5+ via https://www.python.org/downloads/
brew install python
brew install python3

# To switch between python
# unset PYTHONPATH

export PIP_REQUIRE_VIRTUALENV=''
pip install --upgrade pip setuptools virtualenv wheel
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

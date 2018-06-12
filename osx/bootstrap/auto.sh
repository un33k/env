#!/usr/bin/env bash

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
brew services start postgresql

# Install postgis
#######################################
brew install postgis

# Install nodejs and node version manager & yarn
brew install nodejs
git clone git://github.com/creationix/nvm.git ~/.nvm
brew install yarn --without-node

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

# Utils, Config directory
mkdir -p ~/.utils
mkdir -p ~/.config

# Bash prompt
echo 'LP_ENABLE_TIME=1' > ~/.config/liquidpromptrc
cd ~/.utils
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
cd -

#
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

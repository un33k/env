#!/usr/bin/env bash

# Install brew ( # brew doctor,update,search,install,list,remove)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap homebrew/cask
brew doctor
brew update
brew install git

# Install iTerm2
#######################################
brew cask install iterm2-nightly

# Install postgresql
#######################################
brew install postgresql
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
brew services start postgresql

# To have launchd start postgresql now and restart at login:
# $ brew services start postgresql
# Or, if you don't want/need a background service you can just run:
# $ pg_ctl -D /usr/local/var/postgres start | stop


# Install postgis
#######################################
brew install postgis

# Install nodejs and node version manager & yarn
brew install nodejs
git clone git://github.com/creationix/nvm.git ~/.nvm

# Yarn - Alternative $ curl -o- -L https://yarnpkg.com/install.sh | bash
brew install yarn

# Install python2/3 - install python 3.7+ via https://www.python.org/downloads/
brew install python3

# To switch between python
# unset PYTHONPATH

export PIP_REQUIRE_VIRTUALENV=''
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

# Git completion
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
cp git-completion.zsh ../git/.git-completion.zsh ~/

#
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

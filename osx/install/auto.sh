#!/usr/bin/env bash

# Paths
#######################################
HOME="~"
BIN_DIR="${HOME}/.bin"
ZSH_DIR="${HOME}/.zsh"
UTL_DIR="${HOME}/.utils"
CFG_DIR="${HOME}/.config"

# Create Directories
#######################################
mkdir -p ${BIN_DIR}
mkdir -p ${ZSH_DIR}
mkdir -p ${UTL_DIR}
mkdir -p ${CFG_DIR}

# Copy Scripts / Configs
#######################################
cp ../bin/* ${BIN_DIR}
cp ../git/.giconfig ${HOME}
cp ../home/.zshrc ${HOME}
cp ../home/.npmrc ${HOME}
cp ../home/zsh-* ${ZSH_DIR}

# Install Oh My Zsh
#######################################
OH_MY_ZSH="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
curl -o- ${OH_MY_ZSH} | bash

# Brew Install
#######################################
HOME_BREW="https://raw.github.com/Homebrew/install/master/install.sh"
curl -o- ${HOME_BREW} | bash

# Default Cask
#######################################
brew tap homebrew/cask                  # Default Cask
brew doctor                             # Brew Doctor
brew update                             # Brew Update

# Core
#######################################
brew install node                       # Node JS Runtime Env
brew install git                        # Git Distributed Source Control
brew install git-gui                    # Git Gui - Gitk
brew install yarn                       # Node Package Manager
brew install make                       # Make - Compile
brew install travis                     # Continous Integration (CI)
brew install python3                    # Python 3
brew install libmemcached               # MemCache Daemon

# Extra
#######################################
brew cask install visual-studio-code      # Visual Studio Code (IDE)
brew cask install google-chrome           # Google Chrome (Browser)
brew cask install firefox                 # Firefox (Browser)
brew cask install opera                   # Opera (Browser)
brew cask install iterm2                  # Terminal (Enhanced)
brew cask install docker                  # Container Platform
brew cask install slack                   # Collaboration Platform 
brew cask install postman                 # API Development Tool
brew cask install rectangle               # Move & Resize & Grap Windows on MacOS
brew cask install keybase                 # Messages & Chats Encryption
brew cask install postgres                # Postgresql (Relational Database)
brew cask install postgis                 # Postgresql GIS extension
brew cask install postico                 # Postgresql Mac Client
brew cask install spotify                 # Music Platform
brew cask install vlc                     # Media Player

# Configure postgresql
#######################################
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
brew services start postgresql

# To have launchd start postgresql now and restart at login:
# $ brew services start postgresql
# Or, if you don't want/need a background service you can just run:
# $ pg_ctl -D /usr/local/var/postgres start | stop

# Brew NVM
#######################################
NVM="https://raw.github.com/nvm-sh/nvm/v0.35.2/install.sh"
curl -o- ${NVM} | bash

# To switch between python
# unset PYTHONPATH

export PIP_REQUIRE_VIRTUALENV=''
pip install virtualenv
pip install virtualenvwrapper

# Brew MemCache
#######################################
brew install libmemcached
LIBMEMCACHED=/opt/local pip install pylibmc

# Image Lib (required for pillow)
#######################################
brew install libjpeg
brew install libtiff
brew install ibpng

# Git completion
GIT_COMPLETION="https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh"
wget -q ${GIT_COMPLETION} -O ${ZSH_DIR}/git-completion.zsh

# Brew clean up
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

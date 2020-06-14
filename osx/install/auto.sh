#!/usr/bin/env bash

# Github
#######################################
GITHUB="https://raw.github.com"

# Brew & Friends
#######################################
HOME_BREW="${GITHUB}/Homebrew/install/master/install.sh"
curl -fsSL ${HOME_BREW} | bash
brew tap homebrew/cask                  # Default Cask
brew doctor                             # Brew Doctor
brew update                             # Brew Update
brew install wget                       # Wget Utils

# Required Paths
#######################################
BIN_DIR="${HOME}/.bin"                  # Private Bin
ZSH_DIR="${HOME}/.zsh"                  # Directory for zsh scripts
UTL_DIR="${HOME}/.utils"                # Directory for utility scripts
CFG_DIR="${HOME}/.config"               # Directory for config files
VIR_ENV="${HOME}/Sandbox/.venv"         # Virtual env directory

# Required Directories
#######################################
mkdir -p ${BIN_DIR}
mkdir -p ${ZSH_DIR}
mkdir -p ${UTL_DIR}
mkdir -p ${CFG_DIR}
mkdir -p ${VIR_ENV}

# Required Scripts & Configurations
#######################################
cp ../bin/* ${BIN_DIR}
cp ../git/.gitconfig ${HOME}
cp ../home/.zshrc ${HOME}
cp ../home/.npmrc ${HOME}
cp ../home/zsh-* ${ZSH_DIR}
cp ../py/venv/.pypirc ${HOME}

# Iterm & Friends
#######################################
brew cask install iterm2                  # Terminal (Enhanced)
ITERM_THEME_MT="${GITHUB}/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors"
wget -q ${ITERM_THEME_MT} -O ${CFG_DIR}/material-design-colors.itermcolors

# Zsh & Friends
#######################################
OH_MY_ZSH="${GITHUB}/ohmyzsh/ohmyzsh/master/tools/install.sh"
curl -fsSL ${OH_MY_ZSH} | bash

# Core
#######################################
brew install make                       # Make - Compile
brew install travis                     # Continous Integration (CI)

# Extra
#######################################
brew cask install visual-studio-code      # Visual Studio Code (IDE)
brew cask install google-chrome           # Google Chrome (Browser)
brew cask install brave-browser           # Brave (Browser)
brew cask install firefox                 # Firefox (Browser)
brew cask install opera                   # Opera (Browser)
brew cask install docker                  # Container Platform
brew cask install slack                   # Collaboration Platform 
brew cask install postman                 # API Development Tool
brew cask install rectangle               # Move & Resize & Grap Windows on MacOS
brew cask install keybase                 # Messages & Chats Encryption
brew cask install spotify                 # Music Platform
brew cask install vlc                     # Media Player
cask install alfred                       # Alfred Productivity
cask install caffeine                     # Prevents Mac Sleeping
cask install slack                        # Team communiction tool


# Git & Friends
#######################################
brew install git                          # Git Distributed Source Control
brew install git-gui                      # Git Gui - Gitk
GIT_COMPLETION="${GITHUB}/git/git/master/contrib/completion/git-completion.zsh"
wget -q ${GIT_COMPLETION} -O ${ZSH_DIR}/git-completion.zsh

# MemCache & Friends
#######################################
brew install libmemcached
LIBMEMCACHED=/opt/local pip install pylibmc

# NodeJs & Friends
#######################################
brew install node                       # Node JS Runtime Env
brew install yarn                       # Node Package Manager
NVM="${GITHUB}/nvm-sh/nvm/v0.35.2/install.sh"
curl -fsSL ${NVM} | bash

# Python & Friends
#######################################
export PIP_REQUIRE_VIRTUALENV=''
brew install python3                    # Python 3+
pip install virtualenv                  # Virtual Env
pip install virtualenvwrapper           # Virtual Env Wrapper

# ImageLibs & Friends (required for pillow)
#######################################
brew install libjpeg
brew install libtiff
brew install ibpng

# Postgres & Friends
#######################################
brew install postgres                     # Postgresql (Relational Database)
brew install postgis                      # Postgresql GIS extension
brew install postico                      # Postgresql Mac Client
initdb /usr/local/var/postgres -E utf8
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
brew services start postgresql

# Restore scripts
# .zshrc runs after each terminal opens
# .zprofile runs on each user login once
# .zshrc is rerwitten by the above scripts
#######################################
cp ${HOME}/.zshrc ${HOME}/.zprofile
cp ../home/.zshrc ${HOME}/

# Finalize Python & Virtual Env
#######################################
cp ../py/venv/postactivate ${VIR_ENV}

# Clean ups
#######################################
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

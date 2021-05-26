#!/usr/bin/env zsh

BREW_DIR="/opt/homebrew"

if [ "$1" == "intel" ]; then
  BREW_DIR="/usr/local"
elif [ "$1" == "apple" ]; then
  BREW_DIR="/opt/homebrew"
else
  echo "usage: bash setup.sh <apple | intel>"
  exit 1
fi

echo "Arch is set to ($1), brew directory is set to (${BREW_DIR})."

# Github
#######################################
GITHUB="https://raw.github.com"

# Brew & Friends
#######################################
HOME_BREW="${GITHUB}/Homebrew/install/master/install.sh"
curl -fsSL ${HOME_BREW} | bash
brew doctor                          # Brew Doctor
brew update                          # Brew Update
brew install wget                    # Wget Utils

# Required Paths
#######################################
BIN_DIR="${HOME}/.bin"               # Private Bin
ZSH_DIR="${HOME}/.zsh"               # Directory for zsh scripts
UTL_DIR="${HOME}/.utils"             # Directory for utility scripts
CFG_DIR="${HOME}/.config"            # Directory for config files
VIR_ENV="${HOME}/Sandbox/.venv"      # Virtual env directory

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
brew install iterm2                  # Terminal (Enhanced)
ITERM_THEME_MT="${GITHUB}/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors"
wget -q ${ITERM_THEME_MT} -O ${CFG_DIR}/material-design-colors.itermcolors

# Zsh & Friends
#######################################
OH_MY_ZSH="${GITHUB}/ohmyzsh/ohmyzsh/master/tools/install.sh"
curl -fsSL ${OH_MY_ZSH} | bash

# Core
#######################################
brew install make                    # Make - Compile
brew install travis                  # Continous Integration (CI)

# Extra
#######################################
brew install visual-studio-code      # Visual Studio Code (IDE)
brew install google-chrome           # Google Chrome (Browser)
brew install brave-browser           # Brave (Browser)
brew install firefox                 # Firefox (Browser)
brew install opera                   # Opera (Browser)
brew install docker                  # Container Platform
brew install slack                   # Collaboration Platform
brew install postman                 # API Development Tool
brew install rectangle               # Move & Resize & Grap Windows on MacOS
brew install keybase                 # Messages & Chats Encryption
brew install spotify                 # Music Platform
brew install vlc                     # Media Player
brew install alfred                  # Alfred Productivity
brew install caffeine                # Prevents Mac Sleeping


# Git & Friends
#######################################
brew install git                     # Git Distributed Source Control
brew install git-gui                 # Git Gui - Gitk
GIT_COMPLETION="${GITHUB}/git/git/master/contrib/completion/git-completion.zsh"
wget -q ${GIT_COMPLETION} -O ${ZSH_DIR}/git-completion.zsh

# MemCache & Friends
#######################################
brew install libmemcached

# NodeJs & Friends
#######################################
brew install node                    # Node JS Runtime Env
brew install yarn                    # Node Package Manager
NVM="${GITHUB}/nvm-sh/nvm/v0.38.0/install.sh"
curl -fsSL ${NVM} | bash

# Python & Friends
#######################################
export PIP_REQUIRE_VIRTUALENV=''
brew install python3                 # Python 3+
pip3 install virtualenv               # Virtual Env
pip3 install virtualenvwrapper        # Virtual Env Wrapper
pip3 install pylibmc                  # Python Client for Memcache

# ImageLibs & Friends (required for pillow)
#######################################
brew install libjpeg
brew install libtiff
brew install libpng

# Postgres & Friends
#######################################
brew install postgres                # Postgresql (Relational Database)
brew install postgis                 # Postgresql GIS extension
brew install postico                 # Postgresql Mac Client
initdb ${BREW_DIR}/var/postgres -E utf8
ln -sfv ${BREW_DIR}/opt/postgres/*.plist ~/Library/LaunchAgents
brew services start postgresql

# Restore scripts
# .zshrc runs after each terminal opens
# .zprofile runs on each user login once
# .zshrc is rewitten by this scripts & ohmyzsh
#######################################
cat ../home/enable >> ${HOME}/.zprofile
cat "export BREW_DIR=${BREW_DIR}" >> ${HOME}/.zprofile
cat ../home/enable >> ${HOME}/.zshrc

# Finalize Python & Virtual Env
#######################################
cp ../py/venv/postactivate ${VIR_ENV}

# Clean ups
#######################################
brew cleanup
export PIP_REQUIRE_VIRTUALENV=true

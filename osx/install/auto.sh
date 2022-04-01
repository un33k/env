# Brew Directory arm64 vs. x86
#######################################
BREW_DIR="/opt/homebrew"
# BREW_DIR="/usr/local"  # x86

# Github Related Links
#######################################
GITHUB="https://raw.github.com"

# Brew Related Links
#######################################
HOME_BREW="https://raw.github.com/Homebrew/install/master/install.sh"

# Iterm2 Related Links
#######################################
ITERM_THEME_MT="https://raw.github.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors"

# Zsh Related Links
#######################################
OH_MY_ZSH="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

# Git Related Links
#######################################
GIT_COMPLETION="https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh"

# Node Related Links
#######################################
NVM="https://raw.github.com/nvm-sh/nvm/v0.39.1/install.sh"

# Required Paths
#######################################
BIN_DIR="${HOME}/.bin"                      # Private Bin
ZSH_DIR="${HOME}/.zsh"                      # Directory for zsh scripts
UTL_DIR="${HOME}/.utils"                    # Directory for utility scripts
CFG_DIR="${HOME}/.config"                   # Directory for config files
VIR_ENV="${HOME}/Sandbox/.venv"             # Virtual env directory

# Required Directories
#######################################
create_dirs() {
    mkdir -p ${BIN_DIR}                     # bin directory for personal executables and scripts
    mkdir -p ${ZSH_DIR}                     # zsh related directory
    mkdir -p ${UTL_DIR}                     # utility directory
    mkdir -p ${CFG_DIR}                     # config directory
    mkdir -p ${VIR_ENV}                     # virtual env directory
}

# Required Scripts & Configurations
#######################################
hydrate_home_dir() {
    echo "Hydrating home directory."
    cp ../bin/* ${BIN_DIR}
    cp ../git/.gitconfig ${HOME}
    cp ../home/.npmrc ${HOME}
    cp ../home/zsh-* ${ZSH_DIR}
    cp ../py/.pypirc ${HOME}
}

# Brew & Friends
#######################################
install_brew() {
    echo "Installing brew."
    curl -fsSL ${HOME_BREW} | bash
    brew doctor                             # Brew Doctor
    brew update                             # Brew Update
    brew install wget                       # Wget Utils
}

# Build
#######################################
install_build() {
    echo "Installing build tools."
    brew install make                       # Make - Compile
}

# Extra
#######################################
install_extra_apps() {
    echo "Installing apps."
    brew install visual-studio-code         # Visual Studio Code (IDE)
    brew install google-chrome              # Google Chrome (Browser)
    brew install brave-browser              # Brave (Browser)
    brew install firefox                    # Firefox (Browser)
    brew install docker                     # Container Platform
    brew install postman                    # API Development Tool
    brew install vlc                        # Media Player
    brew install alfred                     # Alfred Productivity
    brew install caffeine                   # Prevents Mac Sleeping
}

# Iterm & Friends
#######################################
install_iterm() {
    echo "Installing iterm."
    brew install iterm2                     # Terminal (Enhanced)
    wget -q ${ITERM_THEME_MT} -O ${CFG_DIR}/material-design-colors.itermcolors
}

# Zsh & Friends
#######################################
install_zsh() {
    echo "Installing zShell."
    curl -fsSL ${OH_MY_ZSH} | bash          # Oh My zShell
}

# Git & Friends
#######################################
install_git() {
    echo "Installing git."
    brew install git                        # Git Distributed Source Control
    brew install git-gui                    # Git Gui - Gitk
    wget -q ${GIT_COMPLETION} -O ${ZSH_DIR}/git-completion.zsh
}

# NodeJs & Friends
#######################################
install_node() {
    echo "Installing node."
    brew install node                       # Node JS Runtime Env
    brew install yarn                       # Node Package Manager
    curl -fsSL ${NVM} | bash
}

# Python & Friends
#######################################
install_python() {
    echo "Installing python."
    export PIP_REQUIRE_VIRTUALENV=''
    brew install python3                    # Python 3+
    pip3 install virtualenv                 # Virtual Env
    pip3 install virtualenvwrapper          # Virtual Env Wrapper
    cp ../py/venv/postactivate ${VIR_ENV}   # Enable venv activate hook
    export PIP_REQUIRE_VIRTUALENV=true
}

# ImageLibs & Friends (required for pillow)
#######################################
install_image_libs() {
    echo "Installing libs."
    brew install libjpeg
    brew install libtiff
    brew install libpng
}

# MemCache & Friends
#######################################
install_libmemcached() {
    echo "Installing memcached."
    brew install libmemcached
}

# Postgres & Friends
#######################################
install_postgress() {
    echo "Installing postgres."
    brew install postgres                   # Postgresql (Relational Database)
    brew install postgis                    # Postgresql GIS extension
    brew install postico                    # Postgresql Mac Client
    initdb ${BREW_DIR}/var/postgres -E utf8
    ln -sfv ${BREW_DIR}/opt/postgres/*.plist ~/Library/LaunchAgents
    brew services start postgresql
}

# Restore scripts
# .zshrc runs after each terminal opens
# .zprofile runs on each user login once
# .zshrc is rewitten by this scripts & ohmyzsh
#######################################
finalize_install() {
    echo "finalalilzing installs."
    echo "export BREW_DIR=${BREW_DIR}" >> ${HOME}/.zprofile
    echo "export BREW_DIR=${BREW_DIR}" >> ${HOME}/.zshrc
    cat ../home/enable >> ${HOME}/.zprofile
    cat ../home/enable >> ${HOME}/.zshrc
}

# Clean ups
#######################################
clean_up() {
    echo "Clean up."
    brew cleanup
}

# Comment out lines if not applicable
#######################################
# create_dirs
# hydrate_home_dir
# install_brew
# install_build
# install_extra_apps
# install_iterm
# install_zsh
# install_git
# install_node
# install_libmemcached
# install_python
# install_image_libs
# install_postgress
# finalize_install
# clean_up
# snag theme: http://noahfrederick.com/blog/2011/lion-terminal-theme-peppermint/

LOCAL_BIN=~/.bin

export PATH=/usr/local/bin:$PATH

# qt related
export PATH="/usr/local/opt/qt/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"

# Set python 3 as default for my user
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

export EDITOR=/usr/bin/vim
# export PATH=$LOCAL_BIN:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/p5merge.app/Contents/MacOS:$PATH

if [ -f ~/.zsh-editors.sh ]; then
  . ~/.zsh-editors
fi

if [ -f ~/.zsh-utils.sh ]; then
  . ~/.zsh-utils
fi

# Aliases configuration
if [ -f ~/.zsh-aliases.sh ]; then
  . ~/.zsh-aliases
fi

# Git configuration
if [ -f ~/.zsh-git.sh ]; then
  . ~/.zsh-git
fi

# SVN configuration
if [ -f ~/.svn/svn.conf.sh ]; then
. ~/.svn/svn.conf
fi

# Python configuration
if [ -f ~/.zsh-py.sh ]; then
  . ~/.zsh-py
fi

# Go configuration
if [ -f ~/.zsh-go.sh ]; then
  . ~/.zsh-go
fi

# zsh git prompt
if [ -f ~/.zsh-go.sh ]; then
  . ~/.zsh-go
fi

# Node Version Manager Loader
# Prerequisite: git clone git://github.com/creationix/nvm.git ~/.nvm
export NVM_DIR=~/.nvm
if [ -f $NVM_DIR/nvm.sh ]; then
  . $NVM_DIR/nvm.sh
fi

# NPM configuration
if [ -f ~/.zsh-npm.sh ]; then
  . ~/.zsh-npm
fi

# NPM configuration
if [ -f ~/.zsh-npm.sh ]; then
  . ~/.zsh-npm
fi

# A two-line colored Bash prompt (PS1) with Git branch and a line decoration
# which adjusts automatically to the width of the terminal by Michal Kottman

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

PS_INFO="$GREEN\u@\h$RESET:$BLUE\w"
PS_GIT="$YELLOW\$PS_GIT_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "


# snag theme: http://noahfrederick.com/blog/2011/lion-terminal-theme-peppermint/

LOCAL_BIN=~/.bin

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Visual Basic Code
c () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" "$F"
    fi
}

export EDITOR=/usr/bin/vim
export PATH=$LOCAL_BIN:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/p5merge.app/Contents/MacOS:$PATH

if [ -f ~/.bash_tokens ]; then
  . ~/.bash_tokens
fi

# Aliases configuration
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Git configuration
if [ -f ~/.bash_git ]; then
  . ~/.bash_git
fi

# SVN configuration
if [ -f ~/.svn/svn.conf ]; then
. ~/.svn/svn.conf
fi

# Ruby configuration
if [ -f ~/.bash_rb ]; then
  . ~/.bash_rb
fi

# Python configuration
if [ -f ~/.bash_py ]; then
  . ~/.bash_py
fi

# Go configuration
if [ -f ~/.bash_go ]; then
  . ~/.bash_go
fi

# Node Version Manager Loader
# Prerequisite: git clone git://github.com/creationix/nvm.git ~/.nvm
export NVM_DIR=~/.nvm
if [ -f $NVM_DIR/nvm.sh ]; then
  . $NVM_DIR/nvm.sh
fi

# A two-line colored Bash prompt (PS1) with Git branch and a line decoration
# which adjusts automatically to the width of the terminal by Michal Kottman

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

PROMPT_COMMAND=parse_git_branch
PS_INFO="$GREEN\u@\h$RESET:$BLUE\w"
PS_GIT="$YELLOW\$PS_GIT_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
 . $LUNCHY_DIR/lunchy-completion.bash
fi

eval "$(rbenv init - --no-rehash)"


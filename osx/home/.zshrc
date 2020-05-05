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

if [ -f ~/.zsh/zsh-editors.sh ]; then
  . ~/.zsh/zsh-editors.sh
fi

if [ -f ~/.zsh/zsh-utils.sh ]; then
  . ~/.zsh/zsh-utils.sh
fi

# Aliases configuration
if [ -f ~/.zsh/zsh-aliases.sh ]; then
  . ~/.zsh/zsh-aliases.sh
fi

# Git configuration
if [ -f ~/.zsh/zsh-git.sh ]; then
  . ~/.zsh/zsh-git.sh
fi

# Python configuration
if [ -f ~/.zsh/zsh-py.sh ]; then
  . ~/.zsh/zsh-py.sh
fi

# Go configuration
if [ -f ~/.zsh/zsh-go.sh ]; then
  . ~/.zsh/zsh-go.sh
fi

# Node npm configuration
if [ -f ~/.zsh/zsh-npm.sh ]; then
  . ~/.zsh/zsh-npm.sh
fi

# Node Version Manager Loader
# Prerequisite: git clone git://github.com/creationix/nvm.git ~/.nvm
export NVM_DIR=~/.nvm
if [ -f $NVM_DIR/nvm.sh ]; then
  . $NVM_DIR/nvm.sh
fi

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
setopt PROMPT_SUBST ; PS1='@%m %c$(__git_ps1)\$ '
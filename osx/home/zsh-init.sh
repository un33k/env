# Local scripts
LOCAL_BIN=~/.bin

# ZSH command completion case
CASE_SENSITIVE="true" 

# Default is opt out brew analytics
HOMEBREW_NO_ANALYTICS=1

# Editor & IDEs
if [ -f ~/.zsh/zsh-editors.sh ]; then
  . ~/.zsh/zsh-editors.sh
fi

# Utility stuff
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


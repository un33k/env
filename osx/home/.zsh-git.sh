# Git configuration

# https://github.com/settings/tokens
# Add access tokens to the following

export GHOMEBREW_GITHUB_API_TOKE=
export GITHUB_TOKEN=


alias gg="git grep"
alias gitflush='git branch --merged master | grep -v master | xargs git branch -d && git remote prune origin'
alias gitk='/usr/local/git/bin/gitk'

PS_LINE=`printf -- '- %.0s' {1..200}`

# Git configuration
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
if [ -f ~/.git-completion.zsh ]; then
  . ~/.git-completion.zsh
fi

# Git prompt configuration
#https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/gitfast/git-prompt.sh
if [ -f ~/.git-prompt.zsh ]; then
  . ~/.git-prompt.zsh
fi

#[[ $- = *i* ]] && source ~/.utils/liquidprompt/liquidprompt

# snag theme: http://noahfrederick.com/blog/2011/lion-terminal-theme-peppermint/

# A two-line colored Bash prompt (PS1) with Git branch and a line decoration
# which adjusts automatically to the width of the terminal.
# Screenshot: http://img194.imageshack.us/img194/2154/twolineprompt.png
# Michal Kottman, 2012

LOCAL_BIN=~/.bin

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

PS_LINE=`printf -- '- %.0s' {1..200}`
function parse_git_branch {
  #update_terminal_cwd;
  PS_GIT_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_GIT_BRANCH="(${ref#refs/heads/}) "
}
PROMPT_COMMAND=parse_git_branch
PS_INFO="$GREEN\u@\h$RESET:$BLUE\w"
PS_GIT="$YELLOW\$PS_GIT_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "

# cd into whatever is the forefront Finder window.
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

alias e="subl"
alias be="bundle exec"
alias gg="git grep"
alias ls="ls -GFh"
alias gitflush='git branch --merged master | grep -v master | xargs git branch -d && git remote prune origin'
alias gitk='/usr/local/git/bin/gitk'

export EDITOR=/usr/bin/vim
export HOMEBREW_GITHUB_API_TOKEN=208f2952ca07731ea3a2335c7f6d7ac3c7556c90
export PATH=$LOCAL_BIN:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/p5merge.app/Contents/MacOS:$PATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
export LINEMAN_AUTO_START=false
export LINEMAN_AUTO_WATCH=true
# Git Bash Autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init - --no-rehash)"

eval "$(rbenv init - --no-rehash)"

eval "$(rbenv init - --no-rehash)"

if [ -f ~/.bash_py ]; then
  . ~/.bash_py
fi

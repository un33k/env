alias ls="ls -GFh"

alias djdev="export DEPLOYMENT_FLAVOR='DEVELOPMENT';"
alias djsta="export DEPLOYMENT_FLAVOR='STAGING';"
alias djpro="export DEPLOYMENT_FLAVOR='PRODUCTION';"
alias djtst="export DEPLOYMENT_FLAVOR='TEST';"

alias pg_start="pg_ctl -D ${BREW_DIR}/var/postgres start"
alias pg_stop="pg_ctl -D ${BREW_DIR}/var/postgres stop"
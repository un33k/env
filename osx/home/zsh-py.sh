# Python configuration

# Set python 3 as default for my user
export PATH="${BREW_DIR}/Cellar/python@3.10/3.10.1/libexec/bin:/usr/local/sbin:$PATH"

############ Python, VirtualEnv & VirtualEnvWrapper ##########
PY3="${BREW_DIR}/bin/python3"

export PIP_REQUIRE_VIRTUALENV=true
export VHOME_DIR=$HOME/Sandbox
export WORKON_HOME=$VHOME_DIR/.venv
export PIP_DOWNLOAD_CACHE=$VHOME_DIR/.pip_cache
mkdir -p $WORKON_HOME > /dev/null 2>& 1

export VIRTUALENVWRAPPER_PYTHON=$PY3
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
source ${BREW_DIR}/bin/virtualenvwrapper.sh

############## virtualevnwrapper ############
alias v.mk='mkvirtualenv --python=$PY3 '
alias v.rm='rmvirtualenv '
alias v='workon'
alias v.deactivate='deactivate'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

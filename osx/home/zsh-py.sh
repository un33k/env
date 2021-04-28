# Python configuration

# Set python 3 as default for my user
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/sbin:$PATH"

############ Python, VirtualEnv & VirtualEnvWrapper ##########
PY2=/usr/local/bin/python2
PY2DIST=/usr/local/lib/python2.7/site-packages
PY3=/usr/local/bin/python3
PY3DIST=/usr/local/lib/python3.9/site-packages

export PIP_REQUIRE_VIRTUALENV=true
export VHOME_DIR=$HOME/Sandbox
export WORKON_HOME=$VHOME_DIR/.venv
export PIP_DOWNLOAD_CACHE=$VHOME_DIR/.pip_cache
mkdir -p $WORKON_HOME > /dev/null 2>& 1

export VIRTUALENVWRAPPER_PYTHON=$PYTHON3
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

############## virtualevnwrapper ############
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --python=$PY3 '
alias v.mk2='mkvirtualenv --python=$PY2 '
alias v.rm='rmvirtualenv '
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

######### Standalone Server in Python ###############
# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  $PY2 -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

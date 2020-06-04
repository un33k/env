# Default Editor
export EDITOR=/usr/bin/vim

# Visual Basic Code IDE
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" "$F"
    fi
}

# Sublime Text IDE
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "

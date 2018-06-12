# Visual Basic Code
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" "$F"
    fi
}

# Sublime Text
alias sub="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "

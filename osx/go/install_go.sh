#!/usr/bin/env sh

# Ensure the following lines are sourced (.bash_profile, or .bash_go)
# ===============================
# export GOPATH=$HOME/Code/go
# export PATH=$PATH:$GOPATH/bin

brew update && brew upgrade
brew install go

#brew install git
#brew install mercurial

mkdir -p $GOPATH/src/github.com/user

echo "installation done."
echo "export GOPATH=${GOPATH}"

go get code.google.com/p/go-tour/gotour
gotour

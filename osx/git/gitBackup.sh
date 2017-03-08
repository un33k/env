#!/bin/sh

# Loops over all git directories and backs them up

declare -a gitDirectories=(`find . -type d -name .git | sed 's/.git//g'`)

for i in ${gitDirectories[@]}; do
    echo "Processing $i ..."
    cd $i
    git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
    git fetch --all
    git pull --all
    cd -
done


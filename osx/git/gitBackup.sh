#!/bin/sh

declare -a gitDirectories=(`ls -d */ | cut -f1 -d'/'`)

#loop over the array of directories and back them up
for i in ${gitDirectories[@]}; do
    echo "Processing $i ..."
    cd $i
    git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
    git fetch --all
    git pull --all
    cd ..
done

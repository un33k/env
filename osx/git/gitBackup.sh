#!/bin/sh


declare -a GIT_REPOS=(`find . -type d -name .git | sed 's/.git//g'`)


#loop over the array of directories and back them up
for i in ${GIT_REPOS[@]}; do
    echo "Processing $i ..."
    cd $i
    git branch -r | grep -v "\->" | sed 's/origin\///g' | while read local; do git checkout "$local"; git pull; done
    cd -
done

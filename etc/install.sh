#!/bin/zsh

EXCLUDE_FILES=( . .. .git)

for dots in `ls -1dA $HOME/dotfiles/.*`
do
    skip=0

    for ex in ${EXCLUDE_FILES[@]}
    do
        if [ $dots = "${HOME}/dotfiles/${ex}" ]
        then
	    skip=1
        fi
    done

    if [ $skip -eq 0 ]
    then
        target="$HOME/`basename $dots`"
        if [ ! -f $target ]
        then
            ln -s $dots $target
        else
            echo "[skip] ${target} already exists"
        fi
    fi
done

#!/bin/zsh

# Install brew based tools
brew install git
brew install neovim
brew install tig
brew install tmux
brew install gh
brew install lsd
brew install zoxide
brew install fzf


# Create symlinks in $HOME
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
            echo "[link] ${target}"
        else
            echo "[skip] ${target} already exists"
        fi
    fi
done

sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight


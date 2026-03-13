#!/bin/zsh

echo "🏎 Starting Setup!"

#########################################################
echo "⏱️ Begin installing tools"
#########################################################

# Install brew based tools
brew install zsh
brew install git
brew install lsd
brew install neovim
brew install tig
brew install lazygit
brew install tmux
#brew install gh
brew install zoxide
brew install fzf
brew install ripgrep
brew install starship

echo "✅ Complete installing tools"

#########################################################
echo "⏱️ Begin tool's setup"
#########################################################

sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

echo "✅ Complete tool's setup"

#########################################################
echo "⏱️ Begin linking dotfiles"
#########################################################

cd dotfiles
CURRENT_DIR=`pwd`

for FILE_NAME in `ls -1A $CURRENT_DIR/dotfiles/`; do
    ORIGINAL_FILE="${CURRENT_DIR}/dotfiles/${FILE_NAME}"
    TARGET_LINK="${HOME}/${FILE_NAME}"

    if [ -e $TARGET_LINK ]; then
        echo "[skip] ${TARGET_LINK} already exists"
    elif [ $FILE_NAME = ".git" -o $FILE_NAME = ".gitignore" ]; then
        echo "[skip] ${TARGET_LINK} should not be copied"
    else
        ln -s $ORIGINAL_FILE $TARGET_LINK
        echo "[link] ${TARGET_LINK} created"
    fi
done

echo "✅ Complete linking dotfiles"

#########################################################
echo "⏱️ Begin linking .config"
#########################################################

CURRENT_DIR=`pwd`

if [ ! -d ${HOME}/.config ]; then
    mkdir ${HOME}/.config
fi

for DIR_NAME in `ls -1A $CURRENT_DIR/dotconfig/`; do
    ORIGINAL_DIR="${CURRENT_DIR}/dotconfig/${DIR_NAME}"
    TARGET_LINK="${HOME}/.config/${DIR_NAME}"

    if [ -e $TARGET_LINK ]; then
        echo "[skip] ${TARGET_LINK} already exists"
    else
        ln -s $ORIGINAL_DIR $TARGET_LINK
        echo "[link] ${TARGET_LINK} created"
    fi
done

echo "✅ Complete linking .config"

echo "🏁 All Complete!"

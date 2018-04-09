export EDITOR=vim
export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/sbin:/usr/local/bin
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# NeoVim
export XDG_CONFIG_HOME=$HOME/dotfiles

# Load other files
[ -f $HOME/.zshrc.option ] && source $HOME/.zshrc.option
[ -f $HOME/.zshrc.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.function ] && source $HOME/.zshrc.function
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load Kiex (for Elixir)
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

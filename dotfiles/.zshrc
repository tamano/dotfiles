export EDITOR=vim
export TERM=xterm-256color

export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/sbin:/usr/local/bin
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man


export PATH=$PATH:$HOME/Library/Python/3.7/bin


export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Load other files
[ -f $HOME/.zshrc.option ] && source $HOME/.zshrc.option
[ -f $HOME/.zshrc.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.function ] && source $HOME/.zshrc.function
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias
[ -f $HOME/.zshrc.private ] && source $HOME/.zshrc.private

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

if [ -e "/usr/local/Cellar/qt@5.5" ]; then
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi

# Load pyenv
if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Load Kiex (for Elixir)
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH=$HOME/.nodebrew/current/bin:$PATH

# added by travis gem
[ ! -s /Users/tamano.yuya/.travis/travis.sh ] || source /Users/tamano.yuya/.travis/travis.sh

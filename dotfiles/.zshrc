#export LANG="C"
export LC_ALL=en_US.UTF-8
export TZ=Asia/Tokyo

export EDITOR=vim
export TERM=xterm-256color
export LESSCHARSET=utf-8

export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/sbin:/usr/local/bin
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man

export PATH=$PATH:$HOME/Library/Python/3.7/bin

# Load linuxbrew
if [ -e "/home/linuxbrew/.linuxbrew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

# Load pyenv
if [ -e "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Load GoLang
if [ -e "$HOME/.go" ]; then
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi

# Load nodebrew
if [ -e "$HOME/.nodebrew" ]; then
  export PATH=$PATH:$HOME/.nodebrew/current/bin
fi

# Load Deno
if [ -e "$HOME/.deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH=$PATH:"$DENO_INSTALL/bin"
fi

# Load Kiex (for Elixir)
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# Load qt for old mac
if [ -e "/usr/local/Cellar/qt@5.5" ]; then
  export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ ! -s /Users/tamano.yuya/.travis/travis.sh ] || source /Users/tamano.yuya/.travis/travis.sh

# Load other files
[ -f $HOME/.zshrc.option ] && source $HOME/.zshrc.option
[ -f $HOME/.zshrc.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.function ] && source $HOME/.zshrc.function
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias
[ -f $HOME/.zshrc.private ] && source $HOME/.zshrc.private


export EDITOR=vim
export PATH=$PATH:$HOME/local/bin:/usr/local/git/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/sbin:/usr/local/bin
export MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man

[ -f $HOME/.zshrc.option ] && source $HOME/.zshrc.option
[ -f $HOME/.zshrc.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.function ] && source $HOME/.zshrc.function
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

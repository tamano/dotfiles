[ -f $HOME/.zshrc.zplug ] && source $HOME/.zshrc.zplug
[ -f $HOME/.zshrc.alias ] && source $HOME/.zshrc.alias

# Load rbenv
if [ -e "$HOME/.rbenv" ]; then
  eval "$(rbenv init - zsh)"
fi

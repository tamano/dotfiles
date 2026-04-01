#!/bin/zsh

# set tmux panes for ide

if [ "$#" -eq 0 ]; then
  tmux split-window -v
  tmux resize-pane -D 10
  tmux select-pane -t 1
else
  case $1 in
    desk)
      tmux split-window -h
      tmux select-pane -t 1
      tmux resize-pane -R 50
      tmux split-window -v
      tmux resize-pane -D 10
      tmux select-pane -t 1
      clear
      ;;
    *)
      echo [ERROR] "$1" は設定されていない引数です。
      ;;
  esac
fi

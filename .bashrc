# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
fish

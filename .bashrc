# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias delta='delta --side-by-side'
alias diff='delta'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias config-lazy='lazygit -git-dir=$HOME/dotfiles --work-tree=$HOME'

fish

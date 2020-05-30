# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load nvm
source /usr/share/nvm/init-nvm.sh

# Load Antigen
source ~/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

# Source Bash functions
. ~/.bash_functions

# Import pywal colors
(cat ~/.cache/wal/sequences &)

# Setup aliases
alias ls='ls --color=auto'
alias cpdots='cp -rT ~/dotfiles/home/mig ~/ && echo "dotfiles applied"'
alias dotfiles='cd ~/dotfiles && git status'
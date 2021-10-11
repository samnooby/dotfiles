#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\t](\u) \W \$ '

#Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias docs='cd ~/Documents'

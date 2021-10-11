#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\e[1;32m[\A]\e[0;32m(\u)\e[1;36m\w \[\e[31m\]$(parse_git_branch)\[\e[00m\]$ '

#Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias docs='cd ~/Documents'

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

OLD_PS1='\[\e[31m\]$(parse_git_branch)\[\e[00m\]$ '
TIME='\[\e[1;32m\][\A]'
USER='\[\e[0;32m\](\u)'
DIRECTORY='\[\e[1;36m\]\w '
GIT='\[\e[1;31m\]$(parse_git_branch)'
END='\[\e[0;00m\]$ '

PS1=$TIME 
PS1+=$USER
PS1+=$DIRECTORY
PS1+=$GIT
PS1+=$END

#Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias docs='cd ~/Documents'

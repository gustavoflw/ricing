# Aliases
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'

if [[ ${EUID} == 0 ]] ; then
		sq_color="\[\033[0;31m\]"
	else		
		sq_color="\[\033[0;34m\]"
	fi

	PS1="\[\e[0;34m\]┌─[\[\e[1;37m\]\u\[\e[0;37m\]@\[\e[1;37m\]\h\[\e[0;34m\]]─[\[\e[1;33m\]\w\[\e[0;34m\]]\n\[\e[0;34m\]└──> [\[\e[1;37m\]\t\[\e[0;34m\]] $ >> \[\e[0m\]"


	unset sq_color

neofetch | lolcat
echo -e "\e[00;33m$(/usr/bin/fortune -s)\e[00m" | glitchcat -d 300

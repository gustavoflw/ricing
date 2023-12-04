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

	PS1="$sq_color\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[01;37m\]\342\234\227$sq_color]\342\224\200\")[\[\033[01;37m\]\t$sq_color]\342\224\200[\[\033[01;34m\]\[\033[01;37m\]\u\[\033[01;34m\]@\[\033[01;35m\]\h$sq_color]\n\342\224\224\342\224\200\342\224\200> \[\033[01;37m\]\W$sq_color $ \[\033[01;37m\]>>\\[\\033[0m\\] "

	unset sq_color

neofetch | lolcat
echo -e "\e[00;33m$(/usr/bin/fortune -s)\e[00m" | glitchcat -d 300

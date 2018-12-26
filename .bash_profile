#
# ~/.bash_profile
#

export EDITOR='vim'
export TERMINAL='urxvt'
export BROWSER='firefox'

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

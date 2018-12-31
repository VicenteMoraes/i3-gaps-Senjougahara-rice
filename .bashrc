#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias temp='~/.scripts/choose_template.sh'
alias off='shutdown -h now'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)


# Done in bashrcgenerator.com
export PS1="\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

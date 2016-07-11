#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


HISTSIZE=10000

# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

alias psgrep="ps a | grep"
alias h?="history | grep"

# set -o vi

PATH=":/home/akegalj/.local/bin/:${PATH}:/home/akegalj/.cabal/bin:.cabal-sandbox/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ssh='TERM=rxvt ssh'
alias pbcopy='xclip -selection clipboard -i'
alias pbpaste='xclip -selection clipboard -o'

# PS1='[\u@\h \W]\$ '
PS1='\[\e[1;36m\][\u@\h \W]\$\[\e[0m\] '
export EDITOR=vim
export BROWSER=firefox
# export ELM_HOME=./node_modules/elm/share

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[1;36m\][\u@\h \W]\$\[\e[0m\] '

PATH="${PATH}:/home/akegalj/.cabal/bin:/home/akegalj/.gem/ruby/2.0.0/bin:.cabal-sandbox/bin"
HISTSIZE=10000

#PATH=$PATH:$HOME/.rvm/bin:/home/akegalj/.gem/ruby/2.0.0/bin # Add RVM to PATH for scripting

alias ssh="TERM=rxvt ssh"

set -o vi

export EDITOR="vim"
export BROWSER="midori"

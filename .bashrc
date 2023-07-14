# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000

# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

alias psgrep="ps a | grep"
alias h?="history | grep"

set -o vi

PATH=":/home/akegalj/.local/bin/:${PATH}:/home/akegalj/.cabal/bin:.cabal-sandbox/bin:/home/akegalj/.gem/ruby/2.4.0/bin:/home/akegalj/.w3m/scripts"

# alias neomutt='cd ~/Downloads && neomutt '

alias nix-haskell="nix-shell -p 'haskellPackages.ghcWithPackages (pkgs: with pkgs; [ $@ ])'"
alias nix-shell='TERM=xterm nix-shell'
alias wegozg='wego -l "45.81444,15.97798"'
alias w3m='w3m -o confirm_qq=false'
alias zenkoans='w3m -o confirm_qq=false ~/zenkoans.html'
alias pastebin='curl -F c=@- https://ptpb.pw < '
alias vima='vim-anywhere.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ssh='TERM=rxvt ssh'
alias pbcopy='xclip -selection primary -i'
alias pbpaste='xclip -selection primary -o'
alias xcliptemp='xclip -selection clipboard -o | xclip -selection primary && sleep 10 && echo -n | xclip -selection primary'
# FIXME: this is a workaround. Proper solution would be to save volume mute state and restore the state after
# alias slock='amixer set "Master" mute > /dev/null;slock;amixer set "Master" unmute > /dev/null; espeak "Unmuted." 2&> /dev/null'

# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '
export EDITOR=vim
export BROWSER=qutebrowser
# export ELM_HOME=./node_modules/elm/share

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

PATH="/home/akegalj/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/akegalj/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/akegalj/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/akegalj/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/akegalj/perl5"; export PERL_MM_OPT;
MATES_DIR="/home/akegalj/.mates"

# GPG agent
GPG_TTY=$(tty)
export GPG_TTY

# Wasienv
export WASIENV_DIR="/home/akegalj/.wasienv"
[ -s "$WASIENV_DIR/wasienv.sh" ] && source "$WASIENV_DIR/wasienv.sh"

# Wasmer
export WASMER_DIR="/home/akegalj/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[ -f "/home/akegalj/.ghcup/env" ] && source "/home/akegalj/.ghcup/env" # ghcup-env
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
if [ -e /home/akegalj/.nix-profile/etc/profile.d/nix.sh ]; then . /home/akegalj/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export DTK_PROGRAM=espeak

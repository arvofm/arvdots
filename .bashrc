#!/bin/bash

[[ $- != *i* ]] && return # if not interactive, return
shopt -s autocd     # autocd like zsh
bind -s 'set completion-ignore-case on'

# prompt
export PS1='\[\e[0;1;38;5;223m\][\[\e[0;38;5;204m\]\u\[\e[0;38;5;117m\]@\[\e[0;38;5;151m\]\h \[\e[0;2;38;5;251m\]\W\[\e[0;1;38;5;223m\]]\[\e[0;1;2;38;5;177m\]$ \[\e[0m\]'

# functions
dizathura () {
    zathura "$1" & disown
}

# alias
alias ls='lsd --group-directories-first --icon never'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -vrf'
alias mv='mv -v'
alias cp='rsync -rphv'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto -i -nH --null -e'
alias cat='bat'
#alias vim='nvim'
alias du='dust'
alias feh='feh -FZ'
alias fehl='feh -l'
alias sxiv='sxiv -fr'
alias mpv='mpv --fs'
alias q='exit'
alias sn='sudo poweroff'
alias rb='sudo reboot'
alias cg='cd ~/.config'
alias xi='sudo xbps-install -Su'
alias xq='xbps-query -l | grep'
alias xs='xbps-query -Rs'
alias xr='sudo xbps-remove -R'
alias zathura='dizathura'
alias ytdlpv="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'bv*+ba'"
alias ytdlpa="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'ba'"
alias ytdlppv="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs --download-archive videos.txt -f 'bv*+ba'"
alias ytdlppa="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs --download-archive videos.txt -f 'ba'"
alias webcam='\mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

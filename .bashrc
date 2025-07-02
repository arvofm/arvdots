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
alias ls='lsd -F -X --group-directories-first --icon never'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -vrf'
alias mv='mv -v'
alias cp='rsync -rphv'
alias mkdir='mkdir -pv'
alias grepp='grep --color=auto -i -nH --null -e'
alias catt='bat'
alias du='dust'
alias q='exit'
alias cg='cd ~/.config'
alias xi='sudo xbps-install -Su'
alias xq='xbps-query -s'
alias xs='xbps-query -Rs'
alias xf='xbps-query -f'
alias xr='sudo xbps-remove -R'
alias zathura='dizathura'
alias tarc='tar -czvf'
alias tarx='tar -xvzf'
alias tarl='tar -tzvf'
alias ytdlpv="yt-dlp -N 3 --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'bv*[height=1080]+ba/b[height=1080] / bv*+ba/b'"
alias ytdlpva="yt-dlp -N 3 --embed-metadata --embed-thumbnail -x --audio-quality 0"
alias ytdlpa="yt-dlp -N 3 --embed-metadata -x --audio-quality 0"
alias webcam='\mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

eval "$(zoxide init bash)"

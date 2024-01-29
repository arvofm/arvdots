#!/bin/fish

if status is-interactive
    function fish_mode_prompt
    end
    function fish_greeting
    end
else
    return 0
end

# prompt
function fish_prompt
    set_color -o "FFDEAD"
    printf "["
    set_color "CD5C5C"
    printf "%s" "$USER"
    set_color "87CEEB"
    printf "@"
    set_color "81A981"
    set HOSTNAME (hostname)
    printf "%s" "$HOSTNAME "
    set_color normal
    set_color -d "A9A9A9"
    set SHORT_PWD (prompt_pwd)
    printf "%s" "$SHORT_PWD"
    set_color normal
    set_color -o "FFDEAD"
    printf "]"
    set_color normal
    set_color -o -d "D499ED"
    printf "\$ "
    set_color normal
end

# functions
function __zathura
    nohup zathura $argv[1] >/dev/null 2>&1 &
end

# alias
alias ls='lsd --group-directories-first'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -vrf'
alias mv='mv -v'
alias cp='rsync -rphv'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto -i'
alias du='du -h'
alias cat='bat'
alias vim='nvim'
alias feh='feh -FZ'
alias fehl='feh -l'
alias sxiv='sxiv -fr'
alias mpv='mpv --fs'
alias speedtest='speedtest --secure'
alias zathura='__zathura'
abbr q 'exit'
abbr sn 'sudo poweroff'
abbr rb 'sudo reboot'
abbr cg 'cd ~/.config'
abbr xi 'sudo xbps-install -Su'
abbr xq 'xbps-query -l | grep'
abbr xs 'xbps-query -Rs'
abbr xr 'sudo xbps-remove -R'
abbr tarc 'tar -czvf'
abbr tarx 'tar -xvzf'
abbr tarl 'tar -tvf'
abbr win32 'WINEPREFIX=~/.new32prefix WINEARCH="win32"'
alias ytdlpv="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'bv*+ba'"
alias ytdlpa="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'ba'"
alias ytdlppv="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs --download-archive videos.txt -f 'bv*+ba'"
alias ytdlppa="yt-dlp --external-downloader=aria2c --embed-metadata --embed-thumbnail --embed-subs --write-subs --download-archive videos.txt -f 'ba'"
abbr webcam '\mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
abbr ffaudiorecord 'ffmpeg -f pulse -i 1'
abbr ffaudiocut 'ffmpeg -i input.m4a -ss 00:00:00 -t 00:00:10 -acodec copy output.m4a'

if status --is-login
    set -gx EDITOR "nvim"
    set -gx TERMINAL "st"
    set -gx BROWSER "librewolf"
    set -gx TEXLIVE "/usr/share"

    [ "$(tty)" = "/dev/tty1" ] && bash -c "startx"
end

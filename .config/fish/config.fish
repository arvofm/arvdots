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
alias ls='lsd -F -X --group-directories-first --icon never'
abbr la 'ls -a'
abbr ll 'ls -l'
abbr rm 'rm -vrf'
abbr mv 'mv -v'
abbr cp 'rsync -rphv'
abbr mkdir 'mkdir -pv'
abbr grepp 'grep --color=auto -i -nH --null -e'
abbr catt 'bat'
abbr du 'dust'
abbr q 'exit'
abbr cg 'cd ~/.config'
abbr xi 'sudo xbps-install -Su'
abbr xq 'xbps-query -s'
abbr xs 'xbps-query -Rs'
abbr xf 'xbps-query -f'
abbr xr 'sudo xbps-remove -R'
alias zathura='__zathura'
abbr tarc 'tar -czvf'
abbr tarx 'tar -xvzf'
abbr tarl 'tar -tzvf'
abbr ytdlpv "yt-dlp -N 3 --embed-metadata --embed-thumbnail --embed-subs --write-subs -f 'bv*[height=1080]+ba/b[height=1080] / bv*+ba/b'"
abbr ytdlpva "yt-dlp -N 3 --embed-metadata --embed-thumbnail -x --audio-quality 0"
abbr ytdlpa "yt-dlp -N 3 --embed-metadata -x --audio-quality 0"
abbr webcam 'mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
abbr ffaudiocut 'ffmpeg -i input.m4a -ss 00:00:00 -t 00:00:10 -acodec copy output.m4a'

if status --is-login

    [ "$(tty)" = "/dev/tty1" ] && bash -c "~/.scripts/startw"

end

zoxide init fish | source

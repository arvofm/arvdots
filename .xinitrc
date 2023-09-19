#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# merge in defaults and keymaps

[ -f $sysresources ] && xrdb -merge $sysresources

[ -f $sysmodmap ] && xmodmap $sysmodmap

[ -f "$sysresources" ] && xrdb -merge "$sysresources"

[ -f "$sysmodmap" ] && xmodmap "$sysmodmap"


# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# personal defaults
numlockx on
xset r rate 195 23
xset b off
setxkbmap -layout tr
export SCRIPTS_DIR="$HOME/.scripts"
export XDG_DATA_DIRS="usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
export $(dbus-launch)
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:${SCRIPTS_DIR}"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"



# initials
slstatus &
~/.fehbg &
batsignal -w 20 -c 10 -d 5 -W 'Battery Low' -C 'Battery Critical' -F 'Battery Charged' -M dunstify -b &
dbus-run-session pulseaudio &
mpd $HOME/.config/mpd/mpd.conf &
sxhkd &
picom &
xautolock -time 25 -locker slock &
exec dwm

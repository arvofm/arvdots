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
export XDG_DATA_DIRS="usr/local/share:/usr/share"
export XDG_CONFIG_HOME="$HOME/.config"
export JAVA_HOME="$HOME/.local/external/JDK/jdk8u352-full"
export PATH="${PATH}:${SCRIPTS_DIR}:${JAVA_HOME}/bin"


# initials
slstatus &
~/.fehbg &
batsignal -w 20 -c 10 -d 5 -W 'Battery Low' -C 'Battery Critical' -F 'Battery Charged' -M dunstify -b &
dbus-run-session pulseaudio &
mpd $HOME/.config/mpd/mpd.conf &
sxhkd &
picom &
exec dwm

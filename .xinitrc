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
setxkbmap -layout us


# environment variables
export GDK_BACKEND="x11"
export DL_VIDEODRIVER="x11"
export CLUTTER_BACKEND="x11"
export XDG_SESSION_TYPE="x11"

export LIBVA_DRIVER_NAME="nvidia"
export __GL_SYNC_TO_VBLANK=1
export __GLX_VENDOR_LIBRARY_NAME="nvidia"

export SCRIPTS_DIR="$HOME/.scripts"
export JAVA_HOME="/usr/lib/jvm/default-jre"
export JAVA_BIN="/usr/lib/jvm/default-jre/bin"
export XDG_DATA_DIRS="usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
export $(dbus-launch)
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${PATH}:${SCRIPTS_DIR}:${JAVA_BIN}"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"

# initials
#sh "$HOME/.fehbg"
#sxhkd &
picom &
#xautolock -secure -time 25 -locker slock &
qtile start -b x11

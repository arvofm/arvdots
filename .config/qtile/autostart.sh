#!/bin/sh

# OnStart
dunst &
dbus-run-session pulseaudio --start --log-level=error
batsignal -w 20 -c 10 -d 5 -W 'Battery Low' -C 'Battery Critical' -F 'Battery Charged' -M dunstify -b &
mpd "$HOME"/.config/mpd/mpd.conf &


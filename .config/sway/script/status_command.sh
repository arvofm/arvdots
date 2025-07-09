#!/bin/bash

### swaybar echo area

# mpd
mpd_song=$(mpc current)
mpd_label=$([[ "$(mpc status "%state%")" = "playing" ]] && echo "🎵 ${mpd_song#*- } - $(mpc status "%currenttime%/%totaltime%")")

# mic
mic_label=$([[ "$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q '\[MUTED\]' && echo "Muted" || echo "Unmuted")" = "Unmuted" ]] && echo "🎙️")

# audio
current_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
volume_label_prefix=$([[ "$(pactl list sinks | grep "Active Port:" | cut -d':' -f2 | xargs)" = "analog-output-headphones" ]] && echo "🎧" || echo "🔊")
volume_label=$([[ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q '\[MUTED\]' && echo "Muted" || echo "Unmuted")" = "Unmuted" ]] && echo "$volume_label_prefix $current_volume" || echo "🔇")

# brightness
brightness_label="🔆 $(brightnessctl | grep -oP "(?<=\().*(?=\%\))")"

# battery
battery_state=$(acpi -b)
battery_prefix=$([[ "$battery_state" == *Dis* ]] && echo "🔋" || echo "🔌")
battery_label="${battery_prefix} $(echo "$battery_state" | grep -oP "\d+(?=%)")"

# memory
memory_label="⚙️ $(free -h | awk 'NR==2 {print $3 "/" $2}')"

# internet
internet_label="🔗 $(nmcli -t -g NAME connection show --active | head -n 1)"

# date
date_label="⏲ $(date +'%I:%M %p')"

# echo area
echo "$mpd_label  $mic_label $volume_label   $brightness_label   $battery_label   $memory_label   $internet_label   $date_label  |   arvo "


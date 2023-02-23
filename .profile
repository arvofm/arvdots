#!/bin/sh

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

[ "$(tty)" = "/dev/tty1" ] && startx

# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

[ "$(tty)" = "/dev/tty1" ] && startx

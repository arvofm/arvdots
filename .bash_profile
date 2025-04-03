# .bash_profile

# Get the aliases and functions
[ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc

# Initialize environment
[ "$(tty)" = "/dev/tty1" ] && bash -c "$HOME/.scripts/startw"

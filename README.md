<h1 style="text-align: center;"> ArvDots </h1>


This is a collection of common dotfiles I use from time to time. Beware that when all the dotfiles are used in a single system, there will certainly be some configs you will not use. Please surf through the repository and manually use the ones you personally choose to.

### .config ?
There are all kinds of standard config files in `.config` directory, they are not ultimately customized, and serve as a general template for those who wants to further customize their system; or you can use them as they are.

### .local/external ?
These are the software that I prefer to install externally, which generally includes [Suckless](suckless.org)' software. This directory includes my configurations and patches which make the suckless software bearable. I don't know much about licensing; so if there is anything wrong, just warn me and I will fix the issue.

### scripts ?
My own scripts, some config files in `.config` and `.local/external` use these custom scripts to make life easier. If you want to use these, rename the directory name to `.scripts`, and make sure to add this path to `$PATH`.

### others ?
* `.xinitrc`: Just a copy of the official xinitrc with additional things, from the times I used dwm and X11.
* `.fehbg`: Sets wallpaper using feh, nowadays I use swaybg.
* `inst.txt`: I use these pieces of software nowadays.
* `guide.md`: A guide to build up from a base install of void linux, written for myself.
* `lez-rainbow3.png`: Just a wallpaper.

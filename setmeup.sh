#!/bin/bash

## Set all configs and home
printf "Setting up all configs into HOME folder and adjust executables. \n\n"
rm -vrf ./screenshots
rm -vrf ./git
rm -vrf ./README.md
cp -rv ./{.,}* "$HOME/"
cd "$HOME/.scripts" || exit
chmod 777 ./*
chmod 777 "$HOME/.fehbg"
cd "$HOME" || exit
sleep 3

echo "---------------------------------------------"

## Update all packages
printf "Updating local packages. \n\n"
sleep 3
sudo xbps-install -Syu
sudo xbps-install -S xbps
sudo xbps-install -Syu

echo "---------------------------------------------"

## Install necesary packages
printf "Installing necesary packages. \n\n"
sleep 3
sudo xbps-install -Sy \
pfetch \
NetworkManager \
NetworkManager-l2tp \
NetworkManager-openconnect \
NetworkManager-openvpn \
NetworkManager-pptp \
NetworkManager-strongswan \
Thunar \
wget \
acpi \
acpid \
acpilight \
adwaita-icon-theme \
alsa-lib \
alsa-plugins-pulseaudio \
alsa-utils \
apulse \
attr \
bat \
libreoffice \
binutils \
cairo \
cairomm \
batsignal \
gnome-calculator \
cava \
curl \
dbus \
dbus-glib \
dbus-libs \
dbus-x11 \
dejavu-fonts-ttf \
deluge \
deluge-gtk \
desktop-file-utils \
dunst \
dust \
elogind \
lsd \
feh \
figlet \
firefox \
flameshot \
font-util \
fontconfig \
fontconfig-devel \
freetype \
freetype-devel \
gawk \
base-devel \
gcc \
gedit \
git \
glib \
glib-networking \
glibc \
glibc-devel \
glibc-locales \
glibmm \
gnome-disk-utility \
gnome-font-viewer \
gnome-sound-recorder \
gtk+ \
gtk+3 \
gtk4 \
gzip \
htop \
intel-gmmlib \
intel-media-driver \
intel-video-accel \
json-c \
json-glib \
libatomic \
libSM \
libX11 \
libX11-devel \
libXScrnSaver \
libXau \
libXau-devel \
libXaw \
libXcomposite \
libXcursor \
libXdamage \
libXdmcp \
libXdmcp-devel \
libXext \
libXext-devel \
libXfixes \
libXfont2 \
libXfontcache \
libXft \
libXft-devel \
libXi \
libXinerama \
libXinerama-devel \
libXmu \
libXpm \
libXpresent \
libXrandr \
libXrender \
libXrender-devel \
libXt \
libXtst \
libXv \
libXvMC \
libXxf86misc \
libXxf86vm \
lua52 \
lxappearance \
make \
mesa \
mesa-dri \
mesa-vulkan-intel \
mpc \
mpd \
mpv \
ncmpcpp \
neovim \
nerd-fonts \
nicotine+ \
nodejs \
numlockx \
octave \
openvpn \
pamixer \
pavucontrol \
pciutils \
perl \
pkg-config \
polkit \
powerstat \
protonvpn-cli \
pulseaudio \
pulseaudio-utils \
python3 \
python3-adblock \
python3-dbus \
qt5 \
qutebrowser \
qv4l2 \
ranger \
rsync \
rtkit \
shellcheck \
speedtest-cli \
sxhkd \
texlive \
thunar-archive-plugin \
thunar-media-tags-plugin \
todoist \
tree \
tree-sitter \
unzip \
void-repo-nonfree \
vulkan-loader \
xarchiver \
xcb-util \
xclip \
xclipboard \
xcolor \
picom \
xdg-user-dirs \
xdg-utils \
xfontsel \
psmisc \
xorg \
yt-dlp \
zathura \
zathura-cb \
zathura-pdf-mupdf \
cmatrix \
btop

sudo xbps-install -Sy nvidia

echo "---------------------------------------------"


## Establish services
printf "Establishing services. \n\n"
sleep 3
sudo sv down dhcpcd
sudo sv down wpa_supplicant
sudo rm -vrf /var/service/dhcpcd
sudo rm -rvf /var/service/wpa_supplicant

sudo ln -s /etc/sv/acpid /var/service
sudo ln -s /etc/sv/alsa /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo sv up acpid
sudo sv up alsa
sudo sv up dbus
sudo sv up NetworkManager
sudo sv up polkitd

echo "---------------------------------------------"

## Place all externals
printf "External apps being installed.\n\n"
sleep 3
#### bitwarden
mkdir -pv "$HOME/.local/external/bitwarden"
cd "$HOME/.local/external/bitwarden" || exit
wget  --output-document=bitwarden.AppImage "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage"
chmod 777 bitwarden.AppImage
cd "$HOME" || exit
#### discord
mkdir -pv "$HOME/.local/external/discord"
cd "$HOME/.local/external" || exit
wget --output-document=discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
tar -xvf discord.tar.gz && rm discord.tar.gz
mv Discord discord
cd "$HOME" || exit
#### freetube
mkdir -pv "$HOME/.local/external/freetube"
cd "$HOME/.local/external/freetube" || exit
wget --output-document=freetube.AppImage "https://github.com/FreeTubeApp/FreeTube/releases/download/v0.18.0-beta/FreeTube_0.18.0_amd64.AppImage"
chmod 777 freetube.AppImage
cd "$HOME" || exit
#### obsidian
mkdir -pv "$HOME/.local/external/obsidian"
cd "$HOME/.local/external/obsidian" || exit
wget --output-document=obsidian.AppImage "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage"
chmod 777 obsidian.AppImage
cd "$HOME" || exit
#### JDK
mkdir -pv "$HOME/.local/external/JDK"
cd "$HOME/.local/external/JDK" || exit
wget --output-document=jdk17.tar.gz "https://download.bell-sw.com/java/17.0.5+8/bellsoft-jdk17.0.5+8-linux-amd64-full.tar.gz"
tar -xvf jdk17.tar.gz && rm jdk17.tar.gz
wget --output-document=jdk8.tar.gz "https://download.bell-sw.com/java/8u352+8/bellsoft-jdk8u352+8-linux-amd64-full.tar.gz"
tar -xvf jdk8.tar.gz && rm jdk8.tar.gz

cd "$HOME" || exit

echo "---------------------------------------------"

## themes and icons
printf "Installing themes and icons.\n\n"
sleep 3
mkdir -pv "$HOME/.themes"
cd "$HOME/.themes" || exit
wget --output-document=catpuccin.zip "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1645385518/Catppuccin-Mocha-BL.zip?response-content-disposition=attachment%3B%2520Catppuccin-Mocha-BL.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221207%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221207T014317Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=0525e6758e857a5344d025e4aa8cf9dd2cf36c93ec78b96b2c94f9e1e854b798"
unzip catpuccin.zip && rm catpuccin.zip
wget --output-document=kanagawa.zip "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1653852532/Kanagawa-BL.zip?response-content-disposition=attachment%3B%2520Kanagawa-BL.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221207%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221207T015119Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=abc50f03e53acd9920a844b5e253df828b309d8c2fcbd671f9857ea958ab37b4"
unzip kanagawa.zip && rm kanagawa.zip
cd "$HOME" || exit
mkdir -pv "$HOME/.icons"
cd "$HOME/.icons" || exit
wget --output-document=mocha.zip "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1645386593/Catppuccin-Mocha.zip?response-content-disposition=attachment%3B%2520Catppuccin-Mocha.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221207%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221207T015430Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=46daf09f7537624dd35dd3998a3885485940c12c5c65812f326688cbfb4742ba"
unzip mocha.zip && rm mocha.zip
wget --output-document=cursors.tar.gz "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1644133297/Plasma-Overdose.tar.gz?response-content-disposition=attachment%3B%2520Plasma-Overdose.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221207%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221207T015800Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=027b9f7d070b548a8c4f0604e52bc1a3bbafd5673c6d2a5cf1d59ea1cb822318"
tar -xvf cursors.tar.gz && rm cursors.tar.gz
cd "$HOME" || exit

echo "---------------------------------------------"

## setup home folders
printf "Setting up HOME folders.\n\n"
sleep 3
cd "$HOME" || exit
mkdir -pv downloads docs games music pics

echo "---------------------------------------------"

## setup wallpaper
printf "Setting up wallpaper.\n\n"
sleep 3
mkdir -pv "$HOME/pics/wps"
cd "$HOME/pics/wps" || exit
wget --output-document=minimal.png "https://raw.githubusercontent.com/archcraft-os/archcraft-wallpapers/main/archcraft-backgrounds-minimal/files/minimal-27.png"
cd "$HOME" || exit

echo "---------------------------------------------"

## update xinit
printf "Setting up xinit.\n\n"
sleep 3
cat "$HOME/.xinitrc" | sudo tee "/etc/X11/xinit/xinitrc"

echo "---------------------------------------------"

## install desktop essentials: dwm, dmenu, st, slstatus
printf "Installing desktop essentials.\n\n"
sleep 2
printf "Installing dwm.\n\n"
sleep 3
cd "$HOME/.local/external/dwm" || exit
sudo make clean install
echo "---------------------------------------------"
printf "Installing dmenu.\n\n"
sleep 3
cd "$HOME/.local/external/dmenu" || exit
sudo make clean install
echo "---------------------------------------------"
printf "Installing st.\n\n"
sleep 3
cd "$HOME/.local/external/st" || exit
sudo make clean install
echo "---------------------------------------------"
printf "Installing slstatus.\n\n"
sleep 3
cd "$HOME/.local/external/slstatus" || exit
sudo make clean install
cd "$HOME" || exit

echo "---------------------------------------------"
sleep 2
printf "Finishing up...\n\n"
sleep 5
rm -rf desktop .bash_history .wget-hsts
clear

## all set
printf "\n All set... Rebooting"
sleep 1
printf "."
sleep 1
printf "."
sleep 1
printf ".\n"
sleep 3
sudo reboot


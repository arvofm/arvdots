This file contains a somewhat consistent manual for a base install. For the installation of Void Linux, consult to [official Void Linux installation guide](https://docs.voidlinux.org/installation/live-images/guide.html).

Appearently, I'm in the groups "`wheel` `floppy` `audio` `video` `cdrom` `optical` `network` `kvm` `input` `xbuilder` `_seatd` ".

Additionaly, nowadays I use [Hyprland](https://hyprland.org/) as my window manager. If you would like to use a different environment, manage it yourself. 

On a base install of Void Linux, I have some network problems, here is a fix:
```bash
# Have a look at your network interface name, wifi interface is generally located in 3rd option, mine is named wlp7s0
ip a
# If the wifi interface is up, skip to establising a connection, otherwise set it up.
ip link set <interface_name> up
# If the output says "Operation not possible due to RF-kill", that means wifi is blocked. If this is the case, run the command below; otherwise skip this step.
rfkill unblock wifi
ip link set <interface_name> up
# Now we are ready to establish a connection, wpa_cli directs to its own interactive shell
wpa_cli -i <interface_name>
> scan
> scan_results
> add_network
> set_network 0 ssid <your_network_SSID>
> set_network 0 psk <your_network_password>
> enable_network 0
> list_networks
> save_config
> status
> quit
# Now you should be connected to a network
```

Establish a network connection, then enable [sudo](https://docs.voidlinux.org/config/users-and-groups.html#sudo), 

1. First, update xbps.
```bash
sudo xbps-install -S xbps
```

2. I want to use the LTS version of linux.
```bash
cd /etc/xbps.d/
sudo echo "ignorepkg=linux" >> xbps.conf
sudo echo "ignorepkg=linux-headers" >> xbps.conf

sudo xbps-install -S linux-base linux-lts linux-lts-headers
sudo reboot
```
After reboot, remove the latest kernel.
```bash
sudo xbps-remove -R linux linux-headers
```

3. Install other void repos.
```bash
sudo xbps-install -S void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree
```

5. Update the base system.
```bash
sudo xbps-install -Syu
```

4. Setup home folders.
```bash
cd
mkdir -pv docs downloads music pics temp
```

5. Move all configs and scripts to where they belong, rename `scripts` to `.scripts`, and make the necessary ones executable. Additionaly, move your wallpaper to `~/pics/wps/`

6. Install all necessary packages listed in `inst.txt`, including nvidia drivers.

7. Install desired flatpak apps, and switch them to wayland if needed. I currently use
   - Discord
   - Ungoogled Chromium
   - Flatseal
   - Freetube
   - LibreWolf
   - Obsidian

8. Establish services.
```bash
sudo sv down dhcpcd
sudo sv down wpa_supplicant
sudo rm -vrf /var/service/dhcpcd
sudo rm -rvf /var/service/wpa_supplicant

sudo ln -s /etc/sv/acpid /var/service
sudo ln -s /etc/sv/alsa /var/service
sudo ln -s /etc/sv/chronyd /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/docker /var/service

sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/seatd /var/service

sudo sv up acpid
sudo sv up alsa
sudo sv up chronyd
sudo sv up dbus
sudo sv up docker
sudo sv up polkitd
sudo sv up seatd

sudo ln -s /etc/sv/NetworkManager /var/service
sudo sv up NetworkManager
```

9. For seatd to work, add yourself to \_seatd group.
```bash
sudo usermod -a -G _seatd yourname
```

10. Change shell to fish.
```bash
chsh -s /usr/bin/fish
```

11. Install Hyprland, officially from [hyprland-void](https://github.com/Makrennel/hyprland-void), the script below may not be up to date, check it before using.
```bash
# Go to a directory to store your external repos
cd ~/.local/external

# Set up a void-packages clone for building templates files
git clone "https://github.com/void-linux/void-packages"
cd void-packages
./xbps-src binary-bootstrap

cd ..

# Clone the repo for hyprland-void
git clone "https://github.com/Makrennel/hyprland-void.git"
cd hyprland-void

# Append shared libraries to the end of void-packages shared libraries
cat common/shlibs >> ../void-packages/common/shlibs

# Copy srcpkgs to void-packages srcpkgs directory
cp -r srcpkgs/* ../void-packages/srcpkgs

cd ../void-packages

# Build and install packages
./xbps-src pkg hyprland
sudo xbps-install -R hostdir/binpkgs hyprland
```

12. Finally,

- Hyprland startup executable can be found in `~/.scripts/startw`.

- For NeoVim plugins to work, intall [packer](https://github.com/wbthomason/packer.nvim):
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
I also use Codeium for NeoVim, so apply the account token.

- I use a fish shell plugin called [z](https://github.com/jethrokuan/z?tab=readme-ov-file), along with the plugin manager [fisher](https://github.com/jorgebucaran/fisher).
```bash
# Install fisher, a plugin manager for fish shell
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install z
fisher install jethrokuan/z
```

- Choose themes and icons.

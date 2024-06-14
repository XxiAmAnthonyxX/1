
# DEPENDENCIES
sudo pacman -S neovim reflector git ufw sddm

# PACMAN
sudo pacman -Syu
sudo cp -r ~/1/pacman/pacman.conf /etc/pacman.conf
sudo reflector --latest 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

# YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# GRUB
sudo cp -r ~/1/grub/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# SDDM
sudo cp -r ~/1/sddm/default.conf /usr/lib/sddm/sddm.conf.d/default.conf
sudo systemctl enable sddm.service

# UFW
sudo systemctl enable ufw.service
sudo systemctl start ufw.service

# NVIDIA
yay -S linux-headers nvidia nvidia-utils lib32-nvidia-utils
sudo cp -r ~/1/mkinitcpio/mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -P

#PACKAGES
yay -S 
hyprland xdg-desktop-portal-hyprland polkit-kde-agent udiskie
bottles wine gamemode lib32-vulkan-intel 
google-chrome 
firefox python-pywalfox 
spotify spicetify-cli 
kitty fastfetch fish starship 
btop 
nsxiv 
mpv ani-cli 
wofi 
cliphist wl-clip-persist 
swaylock-effects 
swww python-pywal themix-theme-oomox-git ttf-iosevka-nerd bibata-cursor-theme 
pulseaudio-nextsink playerctl 
grimblast-git wf-recorder

#DIRECTORIES
mkdir ~/recordings
mkdir ~/screenshots
mkdir ~/recordings/area
mkdir ~/recordings/full
mkdir ~/screenshots/area
mkdir ~/screenshots/full
mkdir ~/screenshots/active

#CONFIGS
cp -r ~/1/btop ~/.config

cp -r ~/1/firefox/user.js ~/.mozilla/firefox/ #default-release
cp -r ~/1/firefox/chrome ~/.mozilla/firefox/ #default-release

cp -r ~/1/fish ~/.config
cp -r ~/1/gtk-3.0 ~/.config
cp -r ~/1/hypr ~/.config
cp -r ~/1/kitty ~/.config
cp -r ~/1/nvim ~/.config

cp -r ~/1/spicetify/pywal ~/.config/spicetify/Themes
cp -r ~/1/spicetify/adblock.js ~/.config/spicetify/Extensions
cp -r ~/1/spicetify/config-xpui.ini ~/.config/spicetify

cp -r ~/1/swaylock ~/.config
cp -r ~/1/wal ~/.config
cp -r ~/1/wallpapers ~/.config

#SPOTIFY
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify backup apply
spicetify apply

# VOLUME
pactl set-sink-volume @DEFAULT_SINK@ 100%

# GTK
gsettings set org.gnome.desktop.interface gtk-theme "oomox"
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic
gsettings set org.gnome.desktop.interface font-name 'Iosevka Nerd Font'

# SCRIPTS
cd ~/.config/hypr/scripts
sudo chmod +x theme.sh volume_spotify_down.py volume_spotify_up.py volume_firefox_down.py volume_firefox_up.py volume_mpv_up.py volume_mpv_down.py windows.sh

#REBOOT
sudo reboot

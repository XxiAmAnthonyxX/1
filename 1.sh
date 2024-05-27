
# DEPENDENCIES
sudo pacman -S neovim reflector git ufw sddm

# PACMAN
sudo pacman -Syu
sudo nvim /etc/pacman.conf
sudo reflector --latest 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

# YAY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# GRUB
sudo nvim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# SDDM
sudo nvim /usr/lib/sddm/sddm.conf.d/default.conf
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

# UFW
sudo systemctl enable ufw.service
sudo systemctl start ufw.service

# NVIDIA
yay -S linux-headers nvidia nvidia-utils lib32-nvidia-utils
sudo nvim /etc/mkinitcpio.conf
sudo mkinitcpio -P

#PACKAGES
yay -S hyprland xdg-desktop-portal-hyprland polkit-kde-agent bottles gamemode firefox python-pywalfox spotify spicetify-cli kitty fastfetch fish starship btop yazi nsxiv udiskie jrnl mpv mpv-mpris ani-cli mov-cli wofi cliphist wl-clip-persist swaylock-effects swww pywal-16-colors themix-theme-oomox-git ttf-iosevka-nerd bibata-cursor-theme pulseaudio-nextsink brightnessctl playerctl grimblast-git wf-recorder

#DIRECTORIES
mkdir ~/recordings
mkdir ~/screenshots
mkdir ~/recordings/area
mkdir ~/recordings/full
mkdir ~/screenshots/area
mkdir ~/screenshots/full
mkdir ~/screenshots/active

#CONFIGS
#cp -r ~/1/btop ~/.config

#cp -r ~/1/firefox/user.js ~/.mozilla/firefox/ #default-release
#cp -r ~/1/firefox/chrome ~/.mozilla/firefox/ #default-release

#cp -r ~/1/fish ~/.config
#cp -r ~/1/gtk-3.0 ~/.config
#cp -r ~/1/hypr ~/.config
#cp -r ~/1/kitty ~/.config
#cp -r ~/1/nvim ~/.config

#cp -r ~/1/spicetify/pywal ~/.config/spicetify/Themes
#cp -r ~/1/spicetify/adblock.js ~/.config/spicetify/Extensions
#cp -r ~/1/spicetify/config-xpui.ini ~/.config/spicetify

#cp -r ~/1/swaylock ~/.config
#cp -r ~/1/wal ~/.config
#cp -r ~/1/wallpapers ~/.config
#cp -r ~/1/yazi ~/.config

#SCRIPTS
#cd ~/.config/hypr/scripts
#sudo chmod +x theme.sh volume_spotify_down.py volume_spotify_up.py volume_firefox_down.py volume_firefox_up.py volume_mpv_up.py volume_mpv_down.py windows.sh

#SPOTIFY
#sudo chmod a+wr /opt/spotify
#sudo chmod a+wr /opt/spotify/Apps -R
#spicetify backup apply
#spicetify apply

#REBOOT
sudo reboot

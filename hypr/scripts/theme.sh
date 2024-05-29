
# PICK WALLPAPER
wallpaper=$(ls -1 ~/.config/wallpapers | grep ".png" | wofi --dmenu)

# GENERATE COLOR SCHEME
wal -i ~/.config/wallpapers/$wallpaper

# SET BACKGROUND
swww init
swww img ~/.config/wallpapers/$wallpaper
rm -rf ~/.cache/swww

# SPOTIFY
cp -r ~/.cache/wal/colors-spicetify.ini ~/.config/spicetify/Themes/Pywal
cd ~/.config/spicetify/Themes/Pywal
mv colors-spicetify.ini color.ini
pkill spicetify
spicetify -q watch -s & disown

# FIREFOX
pywalfox update
cp -r ~/.cache/wal/colors-config.json ~/.config/darkdreader
cd ~/.config/darkdreader
mv colors-config.json config.json

# SWAYLOCK
cp -r ~/.config/wallpapers/$wallpaper ~/.cache/current_wallpaper.png
cp -r ~/.cache/wal/colors-swaylock ~/.config/swaylock
cd ~/.config/swaylock
mv colors-swaylock config

# GTK
oomox-cli -o oomox ~/.cache/wal/colors-oomox

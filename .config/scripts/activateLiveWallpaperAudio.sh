#!/usr/bin/bash

currentWallpaper=$(cat "${HOME}/dotfiles/.config/.last_live_wallpaper.txt")
killall awww-daemon mpvpaper
mpvpaper -o "loop-file=inf hwdec=auto-safe" ALL "${currentWallpaper}" &

# Troca o tema de tudo
wal -i "${wall_dir}/${wall_selection}"
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/
~/dotfiles/.config/scripts/reloadWaybar.sh

exit 0

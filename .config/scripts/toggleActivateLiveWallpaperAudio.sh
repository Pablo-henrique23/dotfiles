#!/usr/bin/bash

wallpaperFile="${HOME}/dotfiles/.config/.last_live_wallpaper.txt"
currentState=$(sed -n '1p' "$wallpaperFile")
currentWallpaper=$(sed -n '2p' "$wallpaperFile")
audioParam=""

if [[ "$currentState" == "AUDIO" ]]; then
	newState="NO-AUDIO"
	audioParam="no-audio"
else
	newState="AUDIO"
fi

killall awww-daemon mpvpaper 2>/dev/null
mpvpaper -o "${audioParam} loop-file=inf hwdec=auto-safe" ALL "${currentWallpaper}" &

{
	echo "$newState"
	echo "$currentWallpaper"
} > "$wallpaperFile"

# Troca o tema de tudo
wal -i "${currentWallpaper}"
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/
~/dotfiles/.config/scripts/reloadWaybar.sh

exit 0

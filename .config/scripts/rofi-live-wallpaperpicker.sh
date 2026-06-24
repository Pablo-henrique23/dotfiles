#!/bin/bash
#
#
#  ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗
#  ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
#  ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
#  ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
#  ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
#   ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝
#
#  ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗███████╗██████╗
#  ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗
#  ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║█████╗  ██████╔╝
#  ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║██╔══╝  ██╔══██╗
#  ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║███████╗██║  ██║
#  ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#	originally written by: gh0stzk - https://github.com/gh0stzk/dotfiles
#	rewritten for hyprland by :	 develcooking - https://github.com/develcooking/hyprland-dotfiles
#	Info    - This script runs the rofi launcher, to select
#             the wallpapers included in the theme you are in.



# Set some variables
wall_dir="${HOME}/dotfiles/Imagens/images/Wallpapers/Animated"
cacheDir="${HOME}/.cache/jp/${theme}"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
        mkdir -p "${cacheDir}"
fi


physical_monitor_size=14
monitor_res=$(hyprctl monitors |grep -A2 Monitor |head -n 2 |awk '{print $1}' | grep -oE '^[0-9]+')
dotsperinch=$(echo "scale=2; $monitor_res / $physical_monitor_size" | bc | xargs printf "%.0f")
monitor_res=$(( $monitor_res * $physical_monitor_size / $dotsperinch ))

#rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"
rofi_override="element-icon{size:50px;border-radius:0px;}"

rofi_command="rofi -x11 -dmenu -theme ${HOME}/dotfiles/.config/rofi/config.rasi -theme-str ${rofi_override}"
# Convert images in directory and save to cache dir
for file in "$wall_dir"/*.{mp4,gif}; do
	[ -f "$file" ] || continue

	nombre_archivo=$(basename "$file")
	base_name="${nombre_archivo%.*}"
	thumb="${cacheDir}${base_name}.png"
	if [ ! -f "$thumb" ]; then
		ffmpeg -y -i "$file" -vf "scale=500:500:force_original_aspect_ratio=increase,crop=500:500" -frames:v 1 "$thumb"
    	fi

done



# Select a picture with rofi
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.mp4" -o -iname "*.gif" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"${A%.*}.png\n" ; done | $rofi_command)

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
killall awww-daemon mpvpaper
mpvpaper -o "loop-file=inf hwdec=auto-safe" ALL "${wall_dir}/${wall_selection}" &

# Troca o tema de tudo
wal -i "${wall_dir}/${wall_selection}"
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/
~/dotfiles/.config/scripts/reloadWaybar.sh

exit 0


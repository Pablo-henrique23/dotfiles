#!/bin/sh

# Determina a paleta de cores
wal -q -i ~/dotfiles/Imagens/images/Wallpapers/OneMonitor/

# Importa um arquivo do PyWal pra determinar o wallpaper
source ~/.cache/wal/colors.sh

# Copia a paleta de cores pros dotfiles
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/colors-waybar.css

# Limpa o cache e troca o wallpaper
killall mpvpaper
pgrep -x awww-daemon >/dev/null || awww-daemon --format xrgb &
awww clear-cache; awww img $wallpaper --transition-step 15 --transition-fps 30

# Recarrega a waybar
~/dotfiles/.config/scripts/reloadWaybar.sh

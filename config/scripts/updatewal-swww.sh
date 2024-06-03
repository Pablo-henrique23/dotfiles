#!/bin/sh

# Determina a paleta de cores
wal -q -i ~/Imagens/Wallpapers/OneMonitor/

# Importa um arquivo do PyWal pra determinar o wallpaper
source "/home/pablo/.cache/wal/colors.sh"

# Copia a paleta de cores pros dotfiles
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/config/waybar/

# Limpa o cache e troca o wallpaper
swww clear-cache; swww img $wallpaper --transition-step 20 --transition-fps 20

# Recarrega a waybar
~/dotfiles/config/waybar/scripts/reloadWaybar.sh

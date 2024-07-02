#!/bin/sh

# Determina a paleta de cores
wal -q -i ~/Imagens/Wallpapers/OneMonitor/

# Importa um arquivo do PyWal pra determinar o wallpaper
source ~/.cache/wal/colors.sh

# Copia a paleta de cores pros dotfiles
cp ~/.cache/wal/colors-waybar.css ~/dotfiles/.config/waybar/colors-waybar.css

# Limpa o cache e troca o wallpaper
swww clear-cache; swww img $wallpaper --transition-step 30 --transition-fps 60 -t random

# Recarrega a waybar
~/dotfiles/.config/scripts/reloadWaybar.sh

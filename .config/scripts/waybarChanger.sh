#!/bin/bash

CONFIG_DIR="$HOME/dotfiles/.config/waybar/configs"
STYLE_DIR="$CONFIG_DIR"

OPTIONS=( $(ls "$CONFIG_DIR" | grep '\.jsonc$' | sed 's/\.jsonc$//') )
STYLES=( $(ls "$STYLE_DIR" | grep '\.css$' | sed 's/\.css$//') )

SELECTION=$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -p "Escolha um perfil")

STYLE_SELECTION=$(printf "%s\n" "${STYLES[@]}" | rofi -dmenu -p "Escolha um estilo")

if [[ -n "$SELECTION" && -f "$CONFIG_DIR/$SELECTION.jsonc" && -n "$STYLE_SELECTION" && -f "$STYLE_DIR/$STYLE_SELECTION.css" ]]; then
    
    echo "$CONFIG_DIR/$SELECTION.jsonc" > $HOME/dotfiles/.config/waybar/current_config.jsonc
    echo "$CONFIG_DIR/$STYLE_SELECTION.css" > $HOME/dotfiles/.config/waybar/current_style.css

    killall waybar
    ~/dotfiles/.config/scripts/reloadWaybar.sh "$CONFIG_DIR/$SELECTION.jsonc" "$STYLE_DIR/$STYLE_SELECTION.css"

else
    notify-send -t 2000 "Waybar" "Nenhuma configuração ou estilo válido selecionado."
fi


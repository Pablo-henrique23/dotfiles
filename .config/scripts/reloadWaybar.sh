#!/bin/bash

CONFIG_FILE="$HOME/.config/waybar/current_config.jsonc"
STYLE_FILE="$HOME/.config/waybar/current_style.css"

DEFAULT_CONFIG="$HOME/dotfiles/.config/waybar/configs/config2.jsonc"
DEFAULT_STYLE="$HOME/dotfiles/.config/waybar/configs/colored.css"

if [[ -f "$CONFIG_FILE" ]]; then
    CONFIG_PATH=$(cat "$CONFIG_FILE")
else
    CONFIG_PATH=$DEFAULT_CONFIG
fi

if [[ -f "$STYLE_FILE" ]]; then
    STYLE_PATH=$(cat "$STYLE_FILE")
else
    STYLE_PATH=$DEFAULT_STYLE
fi


killall waybar
waybar -c "$CONFIG_PATH" -s "$STYLE_PATH" &


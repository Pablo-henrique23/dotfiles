#!/bin/bash

# Definição dos valores padrão
DEFAULT_CONFIG="$HOME/dotfiles/.config/waybar/configs/config2.jsonc"
DEFAULT_STYLE="$HOME/dotfiles/.config/waybar/configs/colored.css"

# Obtém os argumentos da linha de comando ou usa os padrões
CONFIG_PATH=${1:-$DEFAULT_CONFIG}
STYLE_PATH=${2:-$DEFAULT_STYLE}

# Mata a Waybar e inicia com os arquivos especificados
killall waybar
waybar -c "$CONFIG_PATH" -s "$STYLE_PATH" &

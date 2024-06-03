#!/bin/bash

pasta_imagens="/home/pablo/Imagens/Wallpapers/OneMonitor/"

imagem_aleatoria=$(ls "$pasta_imagens"*.jpg "$pasta_imagens"*.jpeg "$pasta_imagens"*.png 2>/dev/null | shuf -n 1)

export SWWW_TRANSITION_STEP=3
export SWWW_TRANSITION_FPS=60
killall randomWallpaper.sh & killall swww_randomize.sh; swww img $imagem_aleatoria
swww img $imagem_aleatoria
echo poa

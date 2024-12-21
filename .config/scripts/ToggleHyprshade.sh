#!/bin/bash

saida=$(hyprshade current)

if [[ -n "$saida" ]]; then
    hyprshade off
    notify-send -e -u low -t 1500 "Hyprshade Off"
else
    hyprshade auto
    notify-send -e -u low -t 1500 "Hyprshade On"
fi


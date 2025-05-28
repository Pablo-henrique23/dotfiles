#!/bin/bash

saida=$(hyprshade current)

if [[ -z "$saida" ]]; then
    hyprshade auto || hyprshade on blue-light-filter
    notify-send -e -u low -t 1500 "Hyprshade On"
else
    hyprshade off
    notify-send -e -u low -t 1500 "Hyprshade Off"
fi


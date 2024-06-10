#!/bin/bash
if pgrep -x "hypridle"
then
    pkill hypridle && notify-send -t 5000 -a Hypridle "Hypridle desligado"
else
    hypridle & notify-send -t 5000 -a Hypridle "Hypridle ligado"
fi

#!/usr/bin/bash

sudo pacman -Syu stow hyprland waybar swww dunst hyprlock rofi hypridle hyprpicker xdg-desktop-portal-hyprland pipewire wireplumber hyprcursor cliphist grim slurp gwenview python-pywal sddm network-manager-applet fastfetch zsh ghostty bc

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay -Y --gendb && yay -Syu --devel

yay -S hyprshade pokemon-colorscripts-git

#!/usr/bin/bash

sudo pacman -Syu git stow hyprland waybar swww dunst hyprlock rofi hypridle hyprpicker xdg-desktop-portal-hyprland pipewire wireplumber hyprcursor cliphist grim slurp gwenview python-pywal sddm network-manager-applet fastfetch zsh ghostty bc ninja meson cmake make alacritty yazi pcmanfm btop

if ! command -v yay &> /dev/null; then
	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && yay -Y --gendb && yay -Syu --devel

yay -S hyprshade pokemon-colorscripts-git

stow .

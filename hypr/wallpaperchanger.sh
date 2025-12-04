#!/bin/bash

# Configuration
directory=~/.config/hypr/wallpapers/ # Change this to your folder
monitor="eDP-1"
interval=300

while true; do
  random_background=$(find "$directory" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

  hyprctl hyprpaper preload "$random_background"

  hyprctl hyprpaper wallpaper "$monitor,$random_background"

  sleep $interval

  hyprctl hyprpaper unload "$random_background"
done

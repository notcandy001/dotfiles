#!/bin/bash
hour=$(date +'%H')

if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
    IMG="$HOME/Pictures/wallpapers/morning.jpg"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
    IMG="$HOME/Pictures/wallpapers/noon.jpg"
else
    IMG="$HOME/Pictures/wallpapers/night.jpg"
fi

swww img "$IMG" --transition-type any
wal -i "$IMG"
killall waybar
waybar &

#!/bin/bash
# toggle between light/dark
state_file="$HOME/.theme_mode"
mode="dark"
[ -f "$state_file" ] && mode=$(cat "$state_file")
if [ "$mode" = "dark" ]; then
    wal -i ~/Pictures/wallpapers/default.jpg --saturate 1.2
    echo "light" > "$state_file"
else
    wal -i ~/Pictures/wallpapers/default.jpg
    echo "dark" > "$state_file"
fi
killall waybar
waybar &

#!/bin/bash
player="spotify"

if pgrep "$player" > /dev/null; then
    notify-send "Music Player" "Bringing $player to front..."
    hyprctl dispatch togglespecialworkspace music
else
    notify-send "Music Player" "Starting $player..."
    setsid $player > /dev/null 2>&1 &
    sleep 2
    hyprctl dispatch togglespecialworkspace music
fi

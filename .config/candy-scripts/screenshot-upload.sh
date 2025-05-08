#!/bin/bash
file="/tmp/screenshot_$(date +%s).png"
grim "$file"
if command -v curl &> /dev/null; then
    url=$(curl -F "image=@$file" https://0x0.st)
    echo "$url" | wl-copy
    notify-send "Screenshot uploaded!" "$url"
else
    notify-send "Screenshot saved" "$file"
fi

#!/bin/bash
chosen=$(echo -e "  Power Off\n  Reboot\n  Suspend\n  Lock\n  Logout" | rofi -dmenu -i -p "Power Menu")

case "$chosen" in
    "  Power Off") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "  Suspend") systemctl suspend ;;
    "  Lock") swaylock ;;
    "  Logout") hyprctl dispatch exit ;;
esac

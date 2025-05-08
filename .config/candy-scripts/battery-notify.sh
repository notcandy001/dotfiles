#!/bin/bash
level=$(cat /sys/class/power_supply/BAT*/capacity)
status=$(cat /sys/class/power_supply/BAT*/status)

if [[ "$status" == "Discharging" && "$level" -le 15 ]]; then
    notify-send -u critical "Battery Low" "${level}% remaining!"
fi

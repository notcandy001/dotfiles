#!/bin/bash
hour=$(date +'%H')
if [ "$hour" -ge 20 ] || [ "$hour" -lt 6 ]; then
    brightnessctl set 30%
else
    brightnessctl set 70%
fi

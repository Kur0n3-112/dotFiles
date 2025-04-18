#!/bin/sh
swayidle -d -w \
                timeout 60 'hyprctl dispatch dpms off' \
                resume 'hyprctl dispatch dpms on' &

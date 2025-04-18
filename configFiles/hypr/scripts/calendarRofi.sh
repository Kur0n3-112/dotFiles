#!/bin/bash

cal -y $(date +"%Y")| rofi -i -dmenu -config ~/.config/rofi/config-calendar.rasi

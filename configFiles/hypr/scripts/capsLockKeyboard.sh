#!/bin/bash

sleep 0.5s

capsState=$(hyprctl devices | grep -m3 -b3 "keychron-keychron-q11" | tail -n1 | cut -d ' ' -f2)

if [ "$capsState" == "no" ]; then
    notify-send -t 650 -e -u low -i info "capsLock" "The caps lock state has been altered: OFF"
else
    notify-send -t 650 -e -u low -i info "capsLock" "The caps lock state has been altered: ON"
fi

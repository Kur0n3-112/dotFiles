#!/usr/bin/env bash

# Intenta detener hypridle, o inicia si no estaba funcionando
pkill hypridle || hypridle &

# Envía señal a waybar para recargar
kill -SIGRTMIN+10 $(pgrep waybar)

# Agregar un breve retraso para permitir que el estado del proceso cambie
sleep 0.5

# Verifica si hypridle está funcionando después de los cambios
if pgrep -x "hypridle" > /dev/null; then
    notify-send -t 650 -e -u low -i info "hypridle" "Idle mode OFF"
else
    notify-send -t 650 -e -u low -i info "hypridle" "Idle mode ON"
fi

#!/bin/bash
# Detecta si la ventana activa es flotante o tileada, y actúa diferente en cada caso

floating=$(hyprctl activewindow -j | jq -r '.floating')

if [ "$floating" = "true" ]; then
    # Flotante: la manda al fondo de la pila de ventanas superpuestas
    hyprctl dispatch alterzorder bottom
else
    # Tileada: la intercambia de lugar con la siguiente en el mosaico
    hyprctl dispatch layoutmsg swapnext
fi

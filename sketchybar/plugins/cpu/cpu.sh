#!/bin/bash

CPU=(
    update_freq=2.5
    icon="🧠"
    icon.padding_right=2.5
    icon.padding_left=5
    script="$PLUGIN_DIR/cpu/script.sh"
)

sketchybar --add item cpu right \
           --set cpu "${CPU[@]}" 

#!/bin/bash

BATTERY=(
    update_freq=15
    script="$PLUGIN_DIR/battery/script.sh"
)

sketchybar --add item battery right \
           --set battery "${BATTERY[@]}"

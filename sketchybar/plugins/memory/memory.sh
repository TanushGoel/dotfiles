#!/bin/bash

MEMORY=(
    update_freq=2.5
    icon="🐏"
    icon.padding_right=2.5
    icon.padding_left=7.5
    script="$PLUGIN_DIR/memory/script.sh"
)

sketchybar --add item memory right \
           --set memory "${MEMORY[@]}"

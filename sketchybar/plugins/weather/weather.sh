#!/bin/bash

WEATHER=(
    update_freq=90
    icon.padding_right=2.5
    icon.padding_left=7.5
    script="$PLUGIN_DIR/weather/script.sh"
    click_script="open -a 'Weather'" 
)

sketchybar --add item weather right \
           --set weather "${WEATHER[@]}"

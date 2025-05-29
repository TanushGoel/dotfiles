#!/bin/bash

CAL=(
    padding_left=5
    update_freq=15
    script=$PLUGIN_DIR/calendar/script.sh
    click_script="open -a 'Calendar'"
)

sketchybar --add item calendar right \
           --set calendar "${CAL[@]}"

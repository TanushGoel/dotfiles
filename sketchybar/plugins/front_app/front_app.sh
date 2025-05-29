#!/bin/sh

FRONT_APP=(
  icon.background.drawing=on
  display=active
  script="$PLUGIN_DIR/front_app/script.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left \
           --set front_app "${FRONT_APP[@]}" \
           --subscribe front_app front_app_switched

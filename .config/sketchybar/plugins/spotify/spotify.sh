#!/bin/sh

SPOTIFY=(
    scroll_texts=on
    icon=♫
    icon.color="$GREEN"
    icon.padding_left=5
    icon.padding_right=7.5
    label.max_chars=30
    associated_display=active
    updates=on
    script="$PLUGIN_DIR/spotify/script.sh"
    click_script="open -a 'Spotify'"
)

sketchybar --add item spotify q \
           --set spotify "${SPOTIFY[@]}" \
           --subscribe spotify media_change

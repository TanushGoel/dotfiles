#!/bin/sh

STATE="$(echo "$INFO" | jq -r '.state')"
APP="$(echo "$INFO" | jq -r '.app')"

if [ "$STATE" = "playing" ] && [ "$APP" == "Spotify" ]; then
    TITLE="$(echo "$INFO" | jq -r '.title' | sed -e ':a' -e 's/([^()]*)//g; ta' -e 's/\[[^]]*\]//g' -e 's/[()]//g' -e 's/  */ /g' -e 's/^ *//' -e 's/ *$//')"
    ARTIST="$(echo "$INFO" | jq -r '.artist' | cut -d ',' -f1 | sed -e 's/^ *//' -e 's/ *$//')"
    MEDIA="$TITLE - $ARTIST"
    sketchybar --set "$NAME" label="$MEDIA" drawing=on
else
    sketchybar --set "$NAME" drawing=off
fi

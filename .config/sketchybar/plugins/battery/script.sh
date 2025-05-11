#!/bin/bash

BATTERY_PERCENT=$(pmset -g batt | grep -o '\d\{1,3\}%' | tr -d '%')
TIME_REMAINING=$(pmset -g batt | grep -o '\d\+:\d\+')

if [ "$BATTERY_PERCENT" -ge 80 ]; then
    ICON="⚡"
elif [ "$BATTERY_PERCENT" -ge 20 ]; then
    ICON="🔋"
else
    ICON="🪫"
fi

if pmset -g batt | grep -q 'AC Power'; then
    ICON="🔌$ICON"
fi

sketchybar --set $NAME icon="$ICON" label="$BATTERY_PERCENT% $TIME_REMAINING"

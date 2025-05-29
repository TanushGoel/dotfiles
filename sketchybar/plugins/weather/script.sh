#!/bin/bash

CITY=$(curl --silent ipinfo.io | jq -r ".city")
API_KEY=$(cat $(dirname "$0")/../weather/.api_key) # https://home.openweathermap.org/statistics/onecall_30

IFS=', ' read -r LAT LON <<< $(curl -s "http://api.openweathermap.org/geo/1.0/direct?q=$CITY&limit=5&appid=$API_KEY" | jq -r '.[0] | "\(.lat),\(.lon)"')

WTTR=$(curl -s "https://api.openweathermap.org/data/3.0/onecall?lat=$LAT&lon=$LON&exclude=minutely,hourly,daily,alerts&appid=$API_KEY&units=imperial")
TEMP=$(bc <<< "scale=0; ($(jq -r '.current.temp' <<< "$WTTR") + 0.5) / 1")
ICON_CODE=$(echo "$WTTR" | jq -r '.current.weather[0].icon')
UVI=$(echo $(printf "%.1f" $(jq -r '.current.uvi' <<< "$WTTR")) | sed 's/\.0$//')

# https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2
case "$ICON_CODE" in
  "01d") ICON="🌕" ;;
  "01n") ICON="🌑" ;;
  "02d") ICON="⛅" ;;
  "02n") ICON="🌑☁️" ;;
  "03d" | "03n") ICON="☁️";;
  "04d" | "04n") ICON="☁️☁️" ;;
  "09d" | "09n") ICON="🌧️" ;;
  "10d") ICON="🌦️" ;;
  "10n") ICON="🌑🌧️" ;;
  "11d" | "11n") ICON="🌩️" ;;
  "13d" | "13n") ICON="❄️" ;;
  "50d" | "50n") ICON="🌫️" ;;
  *) ICON="❓" ;;
esac

sketchybar --set $NAME icon="$ICON" label="$TEMP $UVI"

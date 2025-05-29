#!/bin/bash

total_memory=$(sysctl -n hw.memsize)

free_pages=$(vm_stat | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
inactive_pages=$(vm_stat | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')

page_size=$(sysctl -n hw.pagesize)

free_memory=$((free_pages * page_size))
inactive_memory=$((inactive_pages * page_size))

used_memory=$(($total_memory - $free_memory - $inactive_memory))
used_percentage=$(echo "scale=2; $used_memory / $total_memory * 100" | bc)

sketchybar --set $NAME label="${used_percentage%.*}%"

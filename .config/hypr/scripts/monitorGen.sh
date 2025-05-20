#!/bin/bash

# Requirements:
# - jq
# - bc
# - hyprland

# Monitor Information
HOME_PRIMARY="H1AK500000"
WORK_PRIMARY=""
WORK_SECONDARY=""

monitor_commands=()

# Get monitor info as JSON
monitors=$(hyprctl monitors -j)

# Loop over each monitor
while read -r monitor; do
    name=$(echo "$monitor" | jq -r '.name')
    serial=$(echo "$monitor" | jq -r '.serial')
    model=$(echo "$monitor" | jq -r '.model')
    available_modes=$(echo "$monitor" | jq -r '.availableModes[]')

    if [[ "$name" == "eDP-1" ]]; then
        if [[ $model == "0x419D" ]]; then
            # Asus Zenbook Duo
            monitor_commands+=("eDP-1,2800x1800@120,0x0,1")
        else
            # Safe to assume default to be 1080p @ 60
            monitor_commands+=("eDP-1,1920x1080@60,0x0,1")
        fi
        continue
    fi

    if [[ "$name" == "eDP-2" ]]; then
        # Asus Zenbook Duo contains 2 screens
        # If eDP-2 is present, assume it's the ZenBook Duo
        # will manually enable it when needed
        monitor_commands+=("eDP-2,disable")
        continue
    fi

    if [[ "$serial" == "$HOME_PRIMARY" ]]; then
        max_hz=0
        for mode in $available_modes; do
            resolution="${mode%@*}"
            if [[ "$resolution" == "5120x1440" ]]; then
                hz_raw="${mode#*@}"
                hz="${hz_raw%Hz}" 
                if (( $(echo "$hz > $max_hz" | bc -l) )); then
                    max_hz=$hz
                fi
            fi
        done
        monitorString="$name,5120x1440@$max_hz,0x-1440"
        monitor_commands+=("$monitorString")
        continue
    fi
done < <(echo "$monitors" | jq -c '.[]')

# Output result
for item in "${monitor_commands[@]}"; do
    hyprctl keyword monitor $item
done
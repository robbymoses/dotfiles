#!/bin/bash

# Requirements:
# - jq
# - bc
# - hyprland

enable_duo_screen=false

if [ "$1" == "enable_duo" ]; then
    enable_duo_screen=true
fi

# Monitor Information
HOME_PRIMARY="H1AK500000"
WORK_PRIMARY=""
WORK_SECONDARY=""

# Use this flag to determine if external displays are present
external_displays=false

monitor_commands=()
workspace_commands=()

# Function to create workspaces
create_workspace_commands(){
    # Assign monitor value for visability
    monitor_assignee=$1
    # Read list of workspaces
    IFS=',' read -r -a arr <<< "$2"  # Convert comma-separated string into an array
    for workspace in "${arr[@]}"; do
        # move workspaces to desginated area
        workspaceString="hyprctl dispatch moveworkspacetomonitor $workspace $monitor_assignee"
        echo $workspaceString
        workspace_commands+=("$workspaceString")
    done
}

# Get monitor info as JSON
monitors=$(hyprctl monitors all -j)

# Loop over each monitor
while read -r monitor; do
    name=$(echo "$monitor" | jq -r '.name')
    serial=$(echo "$monitor" | jq -r '.serial')
    model=$(echo "$monitor" | jq -r '.model')
    available_modes=$(echo "$monitor" | jq -r '.availableModes[]')

    if [[ "$name" == "eDP-1" ]]; then
        if [[ $model == "0x419D" ]]; then
            # Asus Zenbook Duo
            edp_width=2800
            monitor_commands+=("eDP-1,2800x1800@120,0x0,2")
        else
            edp_width=1920
            # Safe to assume default to be 1080p @ 60
            monitor_commands+=("eDP-1,1920x1080@60,0x0,1")
        fi
        continue
    fi

    if [[ "$name" == "eDP-2" ]]; then
        # Asus Zenbook Duo contains 2 screens
        # optional flag, if true is passed, set up the
        # second screen, if not disable it.
        if [ "$enable_duo_screen" == true ]; then
            monitor_commands+=("eDP-2,2800x1800@120,auto-down,2")
        else
            monitor_commands+=("eDP-2,disable")
        fi
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
        # Assign Variables
        external_displays=true
        external_primary_width=5120
        external_primary_height=1440
        offset_x=$(( (external_primary_width - edp_width) / 2 * -1 ))
        offset_y=$(( -1 * external_primary_height ))

        # Create the commands to be executed and add them to the array
        monitorString="$name,5120x1440@$max_hz,${offset_x}x${offset_y},1"
        monitor_commands+=("$monitorString")

        create_workspace_commands $name "1,2,3"
        create_workspace_commands "eDP-1" "4,5,6"
        #create_workspace_commands "eDP-1" "6,7,8,9"
        continue
    fi
done < <(echo "$monitors" | jq -c '.[]')

# Output result
for item in "${monitor_commands[@]}"; do
    hyprctl keyword monitor $item
done

if [ "$external_displays" == true ]; then
    for command in "${workspace_commands[@]}"; do
        $command
    done
else
    create_workspace_commands $name "1,2,3,4,5,6,7,8,9"
fi

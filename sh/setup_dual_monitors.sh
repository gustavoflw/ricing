#!/bin/bash

# Get a list of connected monitors
connected_monitors=($(xrandr | grep " connected " | awk '{ print $1 }'))

# Display the list of connected monitors
echo "Connected monitors:"
for ((i=0; i<${#connected_monitors[@]}; i++)); do
    echo "$i: ${connected_monitors[i]}"
done

# Ask the user to select a primary monitor
read -p "Select the primary monitor (enter the corresponding number): " primary_monitor_index

if ! [[ $primary_monitor_index =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

if (( primary_monitor_index < 0 || primary_monitor_index >= ${#connected_monitors[@]} )); then
    echo "Invalid monitor index. Please select a valid number."
    exit 1
fi

# Ask the user to select a secondary monitor
read -p "Select the secondary monitor (enter the corresponding number): " secondary_monitor_index

if ! [[ $secondary_monitor_index =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a valid number."
    exit 1
fi

if (( secondary_monitor_index < 0 || secondary_monitor_index >= ${#connected_monitors[@]} )); then
    echo "Invalid monitor index. Please select a valid number."
    exit 1
fi

# Ask the user to select the position (left or right)
read -p "Position of the secondary monitor (left or right of the primary monitor): " position
if [[ "$position" != "left" && "$position" != "right" ]]; then
    echo "Invalid position. Please enter 'left' or 'right'."
    exit 1
fi

# Generate the xrandr command based on the selected position and save it to a file
primary_monitor="${connected_monitors[primary_monitor_index]}"
secondary_monitor="${connected_monitors[secondary_monitor_index]}"

if [ "$position" == "left" ]; then
    xrandr_command="xrandr --output $primary_monitor --auto --output $secondary_monitor --auto --left-of $primary_monitor"
else
    xrandr_command="xrandr --output $primary_monitor --auto --output $secondary_monitor --auto --right-of $primary_monitor"
fi

echo "Generated xrandr command:"
echo "$xrandr_command"

# Save the xrandr command to a file
path_output=$HOME/monitors.sh
echo "$xrandr_command" > $path_output
echo "The xrandr command has been saved to $path_output"

# Make the file executable
chmod +x $path_output

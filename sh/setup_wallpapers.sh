#!/bin/bash

# Check if DIR_WALLPAPERS environment variable is set
if [ -z "$DIR_WALLPAPERS" ]; then
    echo "DIR_WALLPAPERS environment variable is not set."
    exit 1
fi

# Check if the specified directory exists
if [ ! -d "$DIR_WALLPAPERS" ]; then
    echo "Directory specified in DIR_WALLPAPERS does not exist."
    exit 1
fi

# List MP4 files in the directory and assign an index to each
files=($(find "$DIR_WALLPAPERS" -type f -name "*.mp4"))
num_files=${#files[@]}

if [ "$num_files" -eq 0 ]; then
    echo "No MP4 files found in the directory."
    exit 1
fi

# Display the list of MP4 files with index numbers
echo "Available MP4 files in $DIR_WALLPAPERS:"
for ((i=0; i<num_files; i++)); do
    echo "  $i: ${files[i]}"
done

output_file=$HOME/wallpapers.sh

# Setup file
echo ''
echo "Making file $output_file"
chmod +x $output_file
echo "echo 'Setting up wallpapers'" > $output_file

# Kill xwinwrap before proceeding
echo "killall xwinwrap" >> $output_file
echo "sleep 0.3" >> $output_file

# Get a list of connected monitors
connected_monitors=($(xrandr | grep " connected " | awk '{ print $1 }'))

# Iterate through connected monitors
for monitor in "${connected_monitors[@]}"; do
    echo ''
    echo "Display: $monitor"
    
    # Get the monitor's resolution and position
    monitor_info=$(xrandr | grep "$monitor connected")
    resolution=$(echo "$monitor_info" | grep -oP '(?<= )[0-9]+x[0-9]+')
    position=$(echo "$monitor_info" | grep -oP '(?<=\+)[0-9]+\+[0-9]+')
    resolution_position="$resolution+$position"
    echo "  - Monitor info: $monitor_info"
    echo "  - Resolution: $resolution"
    echo "  - Position: $position"
    echo "  - Resolution + position: $resolution_position"

    # Choose wallpaper
    read -p "  - Enter the index number of the MP4 file you want to set as the wallpaper: " file_index
    if ! [[ "$file_index" =~ ^[0-9]+$ ]] || ((file_index < 0)) || ((file_index >= num_files)); then
        echo "  - Invalid input. Please enter a valid index number."
        exit 1
    fi
    WALLPAPER="${files[file_index]}"
    echo "  - WALLPAPER is set to: $WALLPAPER"
    
    # Create an xwinwrap instance for the current monitor
    output_command="xwinwrap -ov -g $resolution_position -- \
    mpv -wid WID "$WALLPAPER" --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer \
    --hwdec=vdpau --no-audio --panscan=1.0 --no-input-default-bindings &"
    echo "  - Output command: $output_command"
    
    echo "  - Writing command to $output_file"
    echo $output_command >> $output_file

done

$output_file

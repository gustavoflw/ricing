#!/bin/sh
export WALLPAPER="$HOME/Pictures/wallpapers/live/itachi.mp4"
killall xwinwrap
sleep 0.3
xwinwrap -fs -ov -argb -fdt -ni -b -nf -un -o 1.0 -debug -- \
mpv -wid WID --loop --no-audio $WALLPAPER &

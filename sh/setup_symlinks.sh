#!/bin/sh

mkdir "$HOME/.config/picom"
mkdir "$HOME/.config/i3"
mkdir "$HOME/.config/i3status"
mkdir "$HOME/.config/polybar"
mkdir "$HOME/.config/polybar/modules"
mkdir "$HOME/.config/dunst"

ln -s -i "$DIR_RICING/config/picom/picom.conf"			"$HOME/.config/picom/picom.conf"
ln -s -i "$DIR_RICING/config/i3status/config"			"$HOME/.config/i3status/config"
ln -s -i "$DIR_RICING/config/i3/config" 			"$HOME/.config/i3/config"
ln -s -i "$DIR_RICING/config/polybar/config" 			"$HOME/.config/polybar/config"
ln -s -i "$DIR_RICING/config/polybar/modules/now-playing.py"    "$HOME/.config/polybar/modules/now-playing.py"
ln -s -i "$DIR_RICING/config/polybar/modules/playerctl.sh" 	"$HOME/.config/polybar/modules/playerctl.sh"
ln -s -i "$DIR_RICING/config/polybar/modules/aurhelper.sh"      "$HOME/.config/polybar/modules/aurhelper.sh"
ln -s -i "$DIR_RICING/config/polybar/modules/usb.sh"      	"$HOME/.config/polybar/modules/usb.sh"
ln -s -i "$DIR_RICING/config/polybar/modules/bluetooth.sh"	"$HOME/.config/polybar/modules/bluetooth.sh"
ln -s -i "$DIR_RICING/config/dunst/dunstrc"      		"$HOME/.config/dunst/dunstrc"

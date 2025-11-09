#!/bin/bash
D=/home/archi/.config/swww/wallpaper

WALLPAPER=`ls $D | shuf | head -n 1`

swww img "$D/$WALLPAPER" --transition-type center --transition-step 100 --transition-fps 60

wal -n -i $D/$WALLPAPER
themecord -p

# exec "~/.config/waybar/launch.sh"


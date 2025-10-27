#!/usr/bin/env bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/
#
# -----------------------------------------------------
# Quit all running waybar instances
# ----------------------------------------------------
if pgrep -x "waybar" > /dev/null; then
    # If running, kill the waybar process, and reload it
    pkill -x "waybar"
    waybar 
else
    # If not running, start waybar
    waybar 
fi


# -c ~/dotfiles/waybar/config.jsonc -s ~/dotfiles/waybar/style.css &

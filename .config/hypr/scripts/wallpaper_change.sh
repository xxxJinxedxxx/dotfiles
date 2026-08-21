#!/bin/bash
d=/home/archi/.wallpaper
history_back=/home/archi/.wallpaper/wall_history_back.txt
history_front=/home/archi/.wallpaper/wall_history_front.txt
wallpaper=`ls $d | shuf -n 1`

get_current() {
	awww query | grep -oP 'image: \K.*' | head -n 1
}

delete_history() {
	sed -i 'd' "$history_back" 
	sed -i 'd' "$history_front" 
}


new_wall() {
	wall_history_back=$(get_current)
	echo $wall_history_back >> "$history_back"
	if [ "$(wc -l < "$history_front")" -eq 0 ] ; then
		change_wall "$d/$wallpaper"
	else 
		new_wall=$(tail -n 1 "$history_front") 
		sed -i '$ d' "$history_front"
		change_wall $new_wall
	fi
		 
}


old_wall() {
	wall_history_front=$(get_current)
	echo $wall_history_front >> "$history_front"
	
	old_wall=$(tail -n 1 "$history_back")
	sed -i '$ d' "$history_back"
	echo $old_wall
	change_wall $old_wall
}

change_wall(){
	matugen image $1 --source-color-index 0
	awww img $1 --transition-type center --transition-step 100 --transition-fps 60
} 



if [[ "$1" == "--new" ]]; then
    new_wall
elif [[ "$1" == "--old" ]]; then
    old_wall
elif [[ "$1" == "--del" ]]; then
	delete_history
fi




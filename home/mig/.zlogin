
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	clear && XKB_DEFAULT_LAYOUT=us XCURSOR_THEME=capitaine-cursors exec sway --my-next-gpu-wont-be-nvidia &> /dev/null
fi

#!/bin/bash          

# Updating user directories so the copy goes smooth.
xdg-user-dirs-update

# Copy configuration files to your user folder.
cp -rT home/mig ~/

# Launching mako
chmod +x ~/.config/mako/launch.sh

if [[ ! -e ~/.config/mako/config ]]; then
	# Setting wallpaper with wal
	wal -i /home/mig/dotfiles/default.png
	ln -s ~/.cache/wal/mako.conf ~/.config/mako/config
fi

if [[ ! -d "ttf-material-design-icons-git" ]]; then
	# Installing the required icon pack so waybar functions correctly.
	cd ~/dotfiles
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-design-icons-git
	makepkg -si
fi

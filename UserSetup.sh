#!/bin/bash          

# Updating user directories so the copy goes smooth.
xdg-user-dirs-update

# Copy configuration files to your user folder.
cp -rT home/mig ~/

# Setting mako executable
chmod +x ~/.config/mako/launch.sh

# Setting wallpaper with wal
if [[ ! -e ~/.config/mako/config ]]; then
	wal -i /home/mig/dotfiles/default.png
	ln -s ~/.cache/wal/mako.conf ~/.config/mako/config
fi

# Installing the required icon pack so waybar functions correctly.
if [[ ! -d "ttf-material-design-icons-git" ]]; then
	cd ~/dotfiles
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-design-icons-git
	makepkg -si
fi

# Installing user packages
sudo pacman -S --needed $(comm -12 <(pacman -Slq|sort) <(sort pacmanPkg.list) )
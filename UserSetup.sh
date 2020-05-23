#!/usr/bin/env bash

echo 'Updating user directories so the copy goes smooth.'
xdg-user-dirs-update

echo 'Copying user configuration files to your user folder.'
cp -rT home/mig ~/
chmod +x ~/.config/mako/launch.sh

echo 'Setting wallpaper with wal'
wal -i /home/mig/dotfiles/default.png
ln -s ~/.cache/wal/mako.conf ~/.config/mako/config

echo 'To change your wallpaper (which will theme your system to match), run
	$ wal -i /path/to/image.jpg'

if [[ ! -e "ttf-material-design-icons-git" ]]; then
	echo "Installing the required icon pack so waybar functions correctly."
	cd ~/dotfiles
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-design-icons-git
	makepkg -si
fi

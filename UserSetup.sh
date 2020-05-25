#!/bin/bash 

cd ~/dotfiles

# Updating user directories so the copy goes smooth.
xdg-user-dirs-update

# Copy configuration files to your user folder.
cp -rT home/mig ~/

# Setting mako executable
chmod +x ~/.config/mako/launch.sh

# Setting theme with wal
if [[ ! -e ~/.config/mako/config ]]; then
	wal -i $XDG_CONFIG_HOME/wallpaper.png
	ln -s ~/.cache/wal/mako.conf ~/.config/mako/config
fi
	
# Installing the required icon pack so waybar functions correctly.
if [[ ! -d "ttf-material-design-icons-git" ]]; then
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-design-icons-git
	makepkg -si
	cd ../
fi

# Installing user packages
sudo pacman -S --needed - < userPkg.list &&
	chsh -s /bin/zsh mig # piggy back onto this sudo execuation so we don't get asked for pw again

# Install antigen
if [[ ! -e ~/antigen.zsh ]]; then
	curl -L git.io/antigen > ~/antigen.zsh
fi
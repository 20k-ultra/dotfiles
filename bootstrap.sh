#!/bin/sh

if [ ! -d "$HOME/dotfiles" ]; then
	echo "Installing 20k-ultra dotifles"

	# TODO: Modify pacman.conf to uncomment multilib
	
	# Install minimal packages to get started 
	sudo pacman -Syu -needed git base-devel
	
	# Install Paru
	git clone https://aur.archlinux.org/paru.git "$HOME/paru"
	cd paru
	makepkg -si
	cd $HOME

	# Clone dotfiles repo
	git clone --depth=1 git@github.com:20k-ultra/dotfiles.git "$HOME/dotfiles"
	
	# Run apply script
	./apply.sh 

	echo "Done!"
else
	echo "dotfiles are already installed...run apply.sh to apply again"
fi

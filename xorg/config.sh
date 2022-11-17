#!/bin/sh

# Symlink xorg config for nvidia drivers
sudo ln -sf "$HOME/dotfiles/xorg/20-nvidia.conf" /etc/X11/xorg.conf.d
sudo ln -sf "$HOME/dotfiles/xorg/30-touchpad.conf" /etc/X11/xorg.conf.d
sudo ln -sf "$HOME/dotfiles/xorg/xorg.conf" /etc/X11

# Symlink for autorandr
mkdir -p "$HOME/.config/autorandr"
ln -sf "$HOME/dotfiles/xorg/docked" "$HOME/.config/autorandr"
ln -sf "$HOME/dotfiles/xorg/mobile" "$HOME/.config/autorandr"

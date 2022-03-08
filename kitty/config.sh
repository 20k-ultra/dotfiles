#!/bin/bash

# Make sure kitty config is created 
mkdir -p $HOME/.config/kitty

# Link theme
ln -sf ~/dotfiles/kitty/DimmedMonokai.conf $HOME/.config/kitty/theme.conf

# Link config
ln -sf ~/dotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

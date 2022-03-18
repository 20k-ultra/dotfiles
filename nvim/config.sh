#!/bin/sh

git clone https://github.com/kabinspace/AstroVim ~/.config/nvim

mkdir ~/.config/nvim/lua/user
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/lua/user
nvim +PackerSync

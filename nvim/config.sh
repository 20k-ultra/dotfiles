#/bin/sh

git clone https://github.com/kabinspace/AstroVim ~/.config/nvim
nvim +PackerSync

ln -sf ~/dotfiles/nvim/settings.lua ~/.config/nvim/lua/user

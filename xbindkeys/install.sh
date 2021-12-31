# Install packages
paru -S --needed xbindkeys

# Link config
ln -sf ~/dotfiles/xbindkeys/xbindkeysrc.symlink ~/.xbindkeysrc

# Reload
xbindkeys --poll-rc

#/bin/sh

# Symlink xorg config for nvidia drivers
sudo ln -sf $HOME/dotfiles/xorg/20-nvidia.conf /etc/X11/xorg.conf.d
sudo ln -sf $HOME/dotfiles/xorg/30-touchpad.conf /etc/X11/xorg.conf.d
sudo ln -sf $HOME/dotfiles/xorg/xorg.conf /etc/X11

# Disable trackpad
xinput set-prop "Synaptics TM3512-010" "Device Enabled" 0

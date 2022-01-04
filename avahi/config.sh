#/bin/sh

# Disable systemd-resolve
sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service

# Symlink config
sudo ln -sf ~/dotfiles/avahi/nsswitch.conf /etc/nsswitch.conf

# Start and enable avahi
sudo systemctl enable avahi-daemon.service 
sudo systemctl start avahi-daemon.service


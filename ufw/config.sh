#!/usr/bin/env bash

# Rules for a desktop (no need to open ports unless machine is hosting)
sudo ufw default deny incoming
sudo ufw default allow outgoing
# Only allow SSH out (I won't be SSHing into this machine)
sudo ufw allow ssh
sudo ufw deny in 22/tcp

# Enable UFW
sudo ufw enable

# Show rules added
sudo ufw status verbose

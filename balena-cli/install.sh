#/bin/sh

# Exit early if already installed
command -v balena >/dev/null && { echo "balena-cli already installed...skipping"; exit 0; } 

# Download CLI 
curl -Lo /tmp/balena-cli.zip "https://github.com/balena-io/balena-cli/releases/download/v13.1.6/balena-cli-v13.1.6-linux-x64-standalone.zip"

# Install unzip
paru -S --needed unzip

# Extract source
unzip -x /tmp/balena-cli.zip -d $HOME/.local

# Symlink exectuable to bin
ln -sF $HOME/.local/balena-cli/balena $HOME/.local/bin

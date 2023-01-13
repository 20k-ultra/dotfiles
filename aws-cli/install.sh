#!/bin/sh

# Exit early if already installed
command -v aws >/dev/null && {
	echo "aws-cli already installed...skipping"
	exit 0
}

# Download CLI
curl -Lo /tmp/aws-cli.zip "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"

# Install unzip
paru -S --needed unzip

# Extract source
unzip -x /tmp/aws-cli.zip -d "$HOME/.local"

# Symlink exectuable to bin
ln -sF "$HOME/.local/aws/dist/aws" "$HOME/.local/bin"

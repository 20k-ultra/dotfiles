#/bin/sh

# Initialize nvm so we can use it
source /usr/share/nvm/init-nvm.sh

NODE_VERSION=16.13.1

# Install node 16
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION # Set default in case other versions were previously installed 
nvm use $NODE_VERSION # Set $NODE_VERSION to active version

# Install NPM packages
if [[ $(cat "$HOME/dotfiles/nvm/npmPkg.list" | wc -l) > 0 ]]; then
	echo "Installing $(cat $HOME/dotfiles/nvm/npmPkg.list)"
	npm install --global --production $(cat $HOME/dotfiles/nvm/npmPkg.list)
else
	echo "No packages to install."
fi

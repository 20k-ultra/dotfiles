#/bin/sh

# Initialize nvm so we can use it
source /usr/share/nvm/init-nvm.sh

NODE_VERSION=16.13.1

# Install node 16
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION # Set default in case other versions were previously installed 
nvm use $NODE_VERSION # Set $NODE_VERSION to active version

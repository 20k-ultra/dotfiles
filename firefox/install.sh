# Create location to store firefox--developer-edition files
mkdir -p ~/.local/opt

# Create location to store firefox--developer-edition binary executable 
mkdir -p ~/.local/bin

# Move to install location
cd ~/.local/opt

# Download and extract firefox-developer-edition
curl --location \
	"https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" \
	| tar --extract --verbose --preserve-permissions --bzip2

# Symlink firefox-developer-edition binary
ln -s ~/.local/opt/firefox/firefox ~/.local/bin/firefox-dev

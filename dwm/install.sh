
cd ~/

git clone git://git.suckless.org/dwm

cd dwm

ln -sf ~/dotfiles/dwm/config.h ~/dwm

sudo make clean install

cd -

# Install other useful things for making stuff pretty
paru -S --needed pywal-git

# Generate pywal theme
wal -i ~/dotfiles/dwm/bg.jpg
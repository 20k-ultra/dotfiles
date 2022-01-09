
cd ~/

git clone git://git.suckless.org/dwm

cd dwm

ln -sf ~/dotfiles/dwm/config.h ~/dwm

# Apply patch
patch -p1 < ~/dotfiles/dwm/dwm-attachbottom-6.2.diff

sudo make clean install

cd -

# Install other useful things for making stuff pretty
paru -S --needed pywal-git

# Generate pywal theme
wal -i ~/dotfiles/dwm/bg.jpg

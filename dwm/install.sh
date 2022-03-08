
cd ~/

git clone git://git.suckless.org/dwm

cd dwm

ln -sf ~/dotfiles/dwm/config.h ~/dwm

# Apply patch
patch -p1 < ~/dotfiles/dwm/dwm-attachbottom-6.2.diff
patch -p1 < ~/dotfiles/dwm/dwm-centeredmaster-6.1.diff

# Build dwm
sudo make clean install

cd -

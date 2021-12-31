
cd ~/

git clone git://git.suckless.org/dwm

cd dwm

ln -sf ~/dotfiles/zdwm/config.h ~/dwm

sudo make clean install

cd -

# Install feh for setting background but gets applied in xinitrc
sudo paru -S --needed feh


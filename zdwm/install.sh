
cd ~/

git clone git://git.suckless.org/dwm

cd dwm

ln -sf ~/dotfiles/zdwm/config.h ~/dwm

sudo make clean install

cd -

sudo paru -S --needed feh

feh --bg-scale ~/dotfiles/zdwm/bg.jpg

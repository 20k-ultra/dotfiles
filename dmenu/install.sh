
cd ~/

git clone git://git.suckless.org/dmenu

cd dmenu

ln -sf ~/dotfiles/dmenu/config.h ~/dmenu

sudo make clean install

cd -

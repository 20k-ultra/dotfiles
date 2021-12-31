
cd ~/

git clone git://git.suckless.org/dmenu

cd dmenu

ln -sf ~/dotfiles/zdmenu/config.h ~/dmenu

sudo make clean install

cd -

# Add user to video group so we can control screen brightness
sudo usermod -a -G video $(whoami)

mkdir -p ~/.mpv
ln -s ~/dotfiles/system/mpv/input.conf ~/.mpv/input.conf

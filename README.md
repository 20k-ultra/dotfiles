# dotfiles

### Installation

There are setup scripts in the base dir which can be run from a fresh install or an existing one.

```sh
sudo pacman -Syu git

git clone https://github.com/20k-ultra/dotfiles

cd dotfiles

# Review both RootSetup.sh and UserSetup.sh.

# If you're on an existing system, disable your display manager and change the wallpaper path in UserSetup.sh.

sudo sh RootSetup.sh

sh UserSetup.sh

# REBOOT

# If you ever want to change your wallpaper, do so with wal.

wal -i /path/to/image.jpg
```
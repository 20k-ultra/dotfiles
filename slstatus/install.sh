#!/bin/bash

cd ~/ || exit

git clone git://git.suckless.org/slstatus

cd slstatus || exit

ln -sf ~/dotfiles/slstatus/config.h ~/slstatus

sudo make clean install

cd - || exit

#!/bin/bash

# Install and set zsh as shell
if command -v zsh >/dev/null; then
	sudo chsh -s "$(which zsh)" "$(whoami)"
else
	echo "zsh is not installed, please install it before continuing"
fi

ZDOTDIR=~/.config/zsh

if [ ! -d "$ZDOTDIR" ]; then
	echo "Setting up zdot config"
	git clone https://github.com/getantidote/zdotdir $ZDOTDIR
fi

if [ ! -d "$ZDOTDIR/.antidote" ]; then
	echo "Setting up antidote"
	git clone --depth=1 https://github.com/mattmc3/antidote.git "$ZDOTDIR/.antidote"
fi

ln -sf "$ZDOTDIR/.zshenv" ~/.zshenv

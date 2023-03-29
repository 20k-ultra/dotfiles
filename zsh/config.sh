#!/bin/bash

# Install and set zsh as shell
if command -v zsh >/dev/null; then
	sudo chsh -s "$(which zsh)" "$(whoami)"

	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
else
	echo "zsh is not installed, please install it before continuing"
fi

# Plugins
if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi

if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-completions" ]; then
	git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/plugins/zsh-completions
fi

if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-vi-mode" ]; then
	git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/plugins/zsh-vi-mode
fi

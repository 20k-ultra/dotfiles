# dotfiles

This repository is for my X1E laptop running Arch and so the install scripts use pacman with specific configurations for this machine. 

Repo is heavily inspired by https://github.com/holman/dotfiles structure. 

## Setup

On a fresh Arch install run:
 
```
git clone https://github.com/20k-ultra/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

This will go into each topic and install the packages + symlink the appropriate files in .dotfiles to your home directory. 

Everything is configured and tweaked within ~/.dotfiles.

## Structure

Each folder is a topic with several special files supported that will be processed differently when the installer runs.

    bin/: Anything in bin/ will get added to your $PATH and be made available everywhere.
    topic/*.zsh: Any files ending in .zsh get loaded into your environment.
    topic/path.zsh: Any file named path.zsh is loaded first and is expected to setup $PATH or similar.
    topic/completion.zsh: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
    topic/install.sh: Any file named install.sh is executed when you run script/install. To avoid being loaded automatically, its extension is .sh, not .zsh.
    topic/*.symlink: Any file ending in *.symlink gets symlinked into your $HOME. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run script/bootstrap.


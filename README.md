# dotfiles

This repository is for my X1E laptop running Debian. 

Repo is heavily inspired by https://github.com/holman/dotfiles structure. 

## Prerequisites

Just install git: `apt install git`.

## Setup

Run the following to install all the packages and configure them:
 
```
git clone https://github.com/20k-ultra/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

This will go into each topic and install the packages and configure them by symlinking dotfiles or running custom configure scripts. See [Structure](#structure). 

Everything is configured and tweaked within ~/.dotfiles which will automatically apply changes since they are symlinks! A prompt will ask you what to do if a symlink already exists.

## Structure

Each folder is a topic with several special files that will be processed differently when the bootstrap script runs.

The bootstrap.sh script just iterates over the topics and installs their packages and then configures using apt to install and symlinking dotfiles. See [Special file types](#special-file-types) for more. Additional install/configure overrides can be seen at [Special execution files](#special-execution-files)!

NOTE: Files in topics that end with *.zsh are sourced in zsh/zsh.symlink. The installer will not symlink `.zsh` files.

### Special topics:

 - **bin/**: Anything in bin/ will get added to your $PATH and be made available everywhere.
 - **profile/**: User profile configurations such as additional $PATH values, ENV vars, aliases, and functions.
 - **system/**: System wide configurations that are installed with root. 

### Special execution files:

 - **topic/config.sh**: Any file named config.sh within a topic will be executed after any files matching *.symlinks are symlinked.
 - **topic/install.sh**: Any file named install.sh within a topic will be executed when you run bootstrap.sh instead of just passing a topicPkg.list to apt.
 
### Special file types:

 - **topic/*.zsh**: Any files ending in .zsh get loaded into your environment.
 - **topic/path.zsh**: Any file named path.zsh is loaded first and is expected to setup $PATH or similar.
 - **topic/completion.zsh**: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
 - **topic/topicPkg.list**: Contains all the packages related to the topic. Can be a single package.
 - **topic/*.symlink**: Any file ending in *.symlink gets symlinked into your $HOME. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run bootstrap.sh.


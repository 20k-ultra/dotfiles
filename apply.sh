#!/usr/bin/env bash
#
# apply.sh will go into each topic and pass the topicPkg.list file to paru to be downloaded and installed. 
# After that any *smylink will be symlinked.
#
# If a topic has an install.sh or config.sh then those will be ran instead of the generic install/link.

DOTFILES_ROOT=$(pwd -P)

set -e

echo "  --- Modifying system ---"

info () {
    printf "\r  [ \033[00;34mINFO\033[0m ] $1\n"
}

progress () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then

        local currentSrc="$(readlink $dst)"

        if [ "$currentSrc" == "$src" ]
        then

          skip=true;

        else

          echo "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
          [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
          read -n 1 action

          case "$action" in
            o )
              overwrite=true;;
            O )
              overwrite_all=true;;
            b )
              backup=true;;
            B )
              backup_all=true;;
            s )
              skip=true;;
            S )
              skip_all=true;;
            * )
              ;;
          esac

        fi

      fi

      overwrite=${overwrite:-$overwrite_all}
      backup=${backup:-$backup_all}
      skip=${skip:-$skip_all}

      if [ "$overwrite" == "true" ]
      then
        rm -rf "$dst"
        success "removed $dst"
      fi

      if [ "$backup" == "true" ]
      then
        mv "$dst" "${dst}.backup"
        success "moved $dst to ${dst}.backup"
      fi

      if [ "$skip" == "true" ]
      then
        success "skipped $src"
      fi
    fi

    if [ "$skip" != "true" ]  # "false" or empty
    then
      ln -s "$1" "$2"
      success "linked $1 to $2"
    fi
}

install_packages () {
    progress "      Installing $1 packages."
    if [[ $(cat "$DOTFILES_ROOT/$1/topicPkg.list" | wc -l) > 0 ]]; then
		paru -Sq --needed $(cat "$DOTFILES_ROOT/$1/topicPkg.list")
    else
        progress "      No packages to install."
    fi
}

link_dotfiles () {
    progress "      Linking $1 dotfiles."

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -H "$DOTFILES_ROOT/$1" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
    do
        dst="$HOME/.$(basename "${src%.*}")"
        link_file "$src" "$dst"
    done
}

install_topic () {
    progress "  Running installers..."
    if [ -f $1/install.sh ]; then
        bash "$1/install.sh"
    elif [ -f $1/topicPkg.list ]; then
        install_packages $1
    else
        progress "      No installers found..."
    fi
}

configure_topic() {
    progress "  Configuring..."
    
    if [[ $(find ./$1 -maxdepth 1 -name "*.symlink") ]]; then 
        link_dotfiles $1
    else
        progress "       No files to link..."
    fi

    if [ -f $1/config.sh ]; then
        bash "$1/config.sh"
    fi 
}

apply_topic() {
    install_topic $1
    configure_topic $1
}

# Ensure exectuable file exists in $HOME
mkdir -p $HOME/.local/bin

# Update packages
paru

# If a topic was provided than just apply logic for that one
if [ "$#" -eq  "0" ]
    then
    info "Applying all topics..."
    for topic in */ ; do
        info "Found ${topic%/} topic!"
        apply_topic ${topic%/}
    done
 else
    if [ -d $1 ]; then
        info "Applying $1 topic..."
        apply_topic $1
    else
        info "Did not find $1 topic..."
        exit 1
    fi
fi


echo "  --- System is ready ---"

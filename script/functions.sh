#!/usr/bin/env bash
#
# common functions

set -e

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

install_dotfiles () {

  src="$1"
  dest="$HOME/.`basename \"${src%.*}\"`"

  if [ -f $dest ] || [ -d $dest ]
  then

    overwrite=false
    backup=false
    skip=false

    user "File already exists: `basename $src`, what do you want to do? [s]kip, [o]verwrite, [b]ackup?"
    read -n 1 action

    case "$action" in
      o )
        overwrite=true;;
      b )
        backup=true;;
      s )
        skip=true;;
      * )
        ;;
    esac

    if [ "$overwrite" == "true" ]
    then
      rm -rf $dest
      success "removed $dest"
    fi

    if [ "$backup" == "true" ]
    then
      mv $dest $dest\.backup
      success "moved $dest to $dest.backup"
    fi

    if [ "$skip" == "false" ]
    then
      link_files $src $dest
    else
      success "skipped $src"
    fi

  else
    link_files $src $dest
  fi

}

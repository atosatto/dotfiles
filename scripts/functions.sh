#!/usr/bin/env bash

##
# common functions
##

title () {
  echo -e "📝 $1"
}

info () {
  echo -e "📍 $1"
}

warn () {
  echo -e "🚨 $1"
}

user () {
  echo -e "❓ $1"
}

success () {
  echo -e "✅ $1"
}

fail () {
  echo -e "🚫 \"$1\""
  echo ""
  exit 1
}

link_files () {
  ln -s $1 $2
  success "Linked $1 to $2"
}

sudo_link_files () {
  sudo ln -s $1 $2
  success "Linked $1 to $2"
}

install_dotfiles () {

  src="$1"
  dest="$2"
  root="$3"

  if [ -L $dest ] || [ -f $dest ]; then

    overwrite=false
    backup=false
    skip=false

    while true
    do

      user "File already exists: $src, what do you want to do? [s]kip, [o]verwrite, [b]ackup?"
      read -n 1 action

      case "$action" in
        o )
          overwrite=true
          break
          ;;
        b )
          backup=true
          break
          ;;
        s )
          skip=true
          break
          ;;
        * )
          warn "Invalid input: \"$action\""
          ;;
      esac
    done

    if [ "$overwrite" == "true" ]; then
      if [ -n "$root" ]; then
        sudo rm -rf $dest
      else
        rm -rf $dest
      fi
      success "removed $dest"
    fi

    if [ "$backup" == "true" ]; then
      mv $dest $dest\.backup
      success "moved $dest to $dest.backup"
    fi

    if [ "$skip" == "false" ]; then
      if [ -n "$root" ]; then
        sudo_link_files $src $dest
      else
        link_files $src $dest
      fi
    else
      success "skipped $src"
    fi

  else
    if [ -n "$root" ]; then
      sudo_link_files $src $dest
    else
      link_files $src $dest
    fi
  fi

}

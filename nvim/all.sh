#!/bin/bash
#
# nvim
#
# Installs nvim configurations and dependencies

set -e


basepath="$(dirname $0)"
cd "$basepath" || exit

mkdir -p ~/.config/nvim
for f in $(ls -d *.vim)
do 
  if [ ! -L ~/.config/nvim/$f ]
  then
    echo "   Installing $f"
    ln -s "$(pwd $basepath)/$f" ~/.config/nvim
  fi
done

exit 0

#!/bin/bash
#
# APT
#
# This installs some of the common dependencies needed (or at least desired)
# using APT.

set -e

cd "$(dirname "$0")"

# Extra Repos
REPOS=

# In-repo packages
PACKAGES=(
		youtube-dl
		git
		git-flow
    svn
		wget
		nmap
		python
		python3
		nodejs
    ruby
    virtualbox
)

# On-web packages
DEBS=(
		https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb	# google-chrome
		https://atom.io/download/deb	# atom
		https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.2_amd64.deb	# dropbox
		http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb	# skype
    https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb  # vagrant
)

# Script requirements
sudo apt-get install -y curl python-software-properties

# Standard procedure to add new repos
for repo in ${REPOS[@]}
do
		sudo add-apt-repository $repo
done

# Custom procedures to add repos
curl -sL https://deb.nodesource.com/setup | sudo bash -

# Updating everything
sudo apt-get update

# Installing packages via apt
sudo apt-get install -y ${PACKAGES[@]}

# Installing packages via dpks
for deb in ${DEBS[@]}
do
		FILE=`mktemp`
    wget "$deb" -qO $FILE
    CMD="sudo dpkg -i $FILE"
    if ! $CMD;
    then
        sudo apt-get install -f
        $CMD
    fi
    rm $FILE
done

exit 0

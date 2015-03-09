#!/bin/bash
#
# APT
#
# This installs some of the common dependencies needed (or at least desired)
# using APT.

set -e

cd "$(dirname "$0")"

# Extra Repos
REPOS=(
	"ppa:webupd8team/java"
	"ppa:ansible/ansible"
	"ppa:cwchien/gradle"
	"deb http://repository.spotify.com stable non-free"
	"deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) non-free contrib"
)

# In-repo packages
PACKAGES=(
	youtube-dl
	spotify-client
	vim
	zsh
	wget
	nmap
	git
	git-flow
	subversion
	python python-pip python-dev
	python3
	nodejs
	ruby
	oracle-java8-installer oracle-java8-set-default
	gradle
	ansible
	lxc-docker
	virtualbox-4.3
	network-manager-openvpn network-manager-openvpn-gnome
	nfs-kernel-server
)

# On-web packages
DEBS=(
	https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 	# google-chrome
	https://atom.io/download/deb							# atom
	https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_1.6.2_amd64.deb	# dropbox
	http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb	# skype
	https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb  		# vagrant
	# https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip		# packer
	http://downloads.typesafe.com/scala/2.11.5/scala-2.11.5.deb  			# scala
)

# Script requirements
sudo apt-get install -y curl software-properties-common

# Standard procedure to add new repos
for repo in ${REPOS[@]}
do
		sudo add-apt-repository $repo
done

# Custom procedures to add repos
## NodeJS
curl -sL https://deb.nodesource.com/setup | sudo bash -
## Docker
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
## Spotify (adding the missing key)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
## Virtualbox
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -

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
        sudo apt-get install -fy
        $CMD
    fi
    rm $FILE
done

exit 0

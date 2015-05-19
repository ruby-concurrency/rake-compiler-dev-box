#!/usr/bin/env bash

set -e
echo 'Running Ubuntu bootstrap script...'

sudo apt-get -qy update
sudo apt-get -qy upgrade
sudo apt-get -qy purge --auto-remove puppet
sudo apt-get -qy purge --auto-remove chef 

sudo apt-get -y install build-essential \
	tree \
	curl \
	ack-grep \
	git-core \
	git \
	unzip \
	htop \
	ntp \
	vim \
	bash-completion 

mkdir -p ~/bin

# Use all available CPU cores for compiling
if [[ $(nproc) -gt 1 ]] && ! grep -q "make -j" ~/.bash_profile; then
  echo 'export MAKE="make -j$(nproc)"' >> ~/.bash_profile
  source ~/.bash_profile
fi

echo '[[ -f ~/.personal/bash_aliases ]] && source ~/.personal/bash_aliases' >> .bash_aliases

mkdir -p ~/.bash_completion.d
cat >> ~/.bash_completion << EOF
#
# Source all the files in the ~/.bash_completion.d folder
#
for completion in ~/.bash_completion.d/*
do
	source "\${completion}"
done
EOF

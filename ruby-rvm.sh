#!/usr/bin/env bash

set -e
echo 'Running ruby-rvm script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'
touch $home/.bash_profile

# do not generate documentation for gems
$as_vagrant 'echo "gem: --no-ri --no-rdoc" >> ~/.gemrc'

# install rvm
$as_vagrant 'curl -L https://get.rvm.io | bash -s stable'

# source rvm for usage outside of package scripts
rvm_path="$home/.rvm/scripts/rvm"

if ! grep -q "$rvm_path" $home/.bash_profile; then
  echo "source $rvm_path" >> $home/.bash_profile
  source $home/.bash_profile
fi

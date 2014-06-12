#!/usr/bin/env bash

echo 'Running Solaris bootstrap script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'
touch $home/.profile

# disable the sendmail service
svcadm disable sendmail

## install gnu tools
#pkg install archiver/gnu-tar \
  #file/gnu-coreutils \
  #file/gnu-findutils \
  #text/gawk text/gnu-diffutils \
  #text/gnu-grep \
  #text/gnu-sed

# install development tools
pkg install web/curl \
  web/wget \
  developer/base-developer-utilities \
  developer/gcc-45 \
  developer/versioning/git

# add /vagrant/bin to the PATH
if ! grep -q "/vagrant/bin" $home/.profile; then
  echo "export PATH=\$PATH:/vagrant/bin" >> $home/.profile
fi

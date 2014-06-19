#!/usr/bin/env bash

# http://tecadmin.net/install-ruby-2-1-on-centos-rhel/#

set -e
echo 'Running CentOS bootstrap script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'
touch $home/.bash_profile

# Use all available CPU cores for compiling
if [[ $(nproc) -gt 1 ]] && ! grep -q "make -j" $home/.bash_profile; then
  echo 'export MAKE="make -j$(nproc)"' >> $home/.bash_profile
  source $home/.bash_profile
fi

# http://maverickgeekstuffs.blogspot.com/2013/03/installing-libyaml-devel-in-centos.html
# Add EPL repos for libyaml-devel
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh --replacepkgs remi-release-6*.rpm epel-release-6*.rpm 

yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel 
yum install -y libyaml-devel libffi-devel openssl-devel make 
yum install -y bzip2 autoconf automake libtool bison iconv-devel
yum install -y glibc.i686
yum install -y libyaml-devel

# add /vagrant/bin to the PATH
if ! grep -q "/vagrant/bin" $home/.bash_profile; then
  echo "export PATH=\$PATH:/vagrant/bin" >> $home/.bash_profile
fi

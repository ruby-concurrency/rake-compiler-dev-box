#!/usr/bin/env bash

set -e
echo 'Running ruby-install script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'

install='/installers'
mkdir -p $install

# download and compile ruby
rubyver='2.1.2'
cd $install
wget -nc http://cache.ruby-lang.org/pub/ruby/2.1/ruby-$rubyver
tar xzf ruby-$rubyver
cd ruby-$rubyver
./configure --enable-shared --with-opt-dir=/usr/local/lib
make
make install

# download and install rubygems
gemver='2.2.2'
cd $install
wget -nc http://production.cf.rubygems.org/rubygems/rubygems-$gemver.tgz
tar xzf rubygems-$gemver.tgz
cd rubygems-$gemver
/usr/local/bin/ruby setup.rb 

# add ruby to the path
$as_vagrant 'echo "PATH=\$PATH:/usr/local/bin" >> ~/.bashrc'
$as_vagrant 'source ~/.bashrc'

# do not generate documentation for gems
$as_vagrant 'echo "gem: --no-ri --no-rdoc" >> ~/.gemrc'

## install minimal set of useful gems
#gem install bigdecimal
#gem install gem-wrappers
#gem install io-console
#gem install json
#gem install rake
#gem install bundler
#gem install rdoc
#gem install test-unit

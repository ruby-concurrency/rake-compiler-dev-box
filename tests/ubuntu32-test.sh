#!/usr/bin/env bash

VERSION="0.7.0.rc0"
EXAMPLES="/vagrant/tests"
PKG="/vagrant/concurrent-ruby/pkg"

echo "concurrent-ruby-$VERSION-x86-linux.gem"
echo "concurrent-ruby-$VERSION.gem"

source "$HOME/.rvm/scripts/rvm"

rvm use 1.9.3@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-x86-linux.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

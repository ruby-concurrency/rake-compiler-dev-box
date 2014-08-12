#!/usr/bin/env bash

VERSION="0.7.0.rc3"
EXAMPLES="/vagrant/tests"
PKG="/vagrant/concurrent-ruby/pkg"

echo "concurrent-ruby-$VERSION-x86-solaris-2.11.gem"
echo "concurrent-ruby-$VERSION.gem"

gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-x86-solaris-2.11.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

#!/usr/bin/env bash

VERSION="0.7.0.rc3"
EXAMPLES="/vagrant/tests"
PKG="/vagrant/concurrent-ruby/pkg"

echo "concurrent-ruby-$VERSION-x86_64-linux.gem"
echo "concurrent-ruby-$VERSION.gem"
echo "concurrent-ruby-$VERSION-java.gem"

source "$HOME/.rvm/scripts/rvm"

#####################################################################
# Ruby 1.9.3
echo '###############################################################'

rvm use 1.9.3@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-x86_64-linux.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# Ruby 2.0
echo '###############################################################'

rvm use 2.0@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-x86_64-linux.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# Ruby 2.1
echo '###############################################################'

rvm use 2.1@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-x86_64-linux.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# JRuby 1.7.12
echo '###############################################################'

rvm use jruby-1.7.12@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION-java.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
ruby $EXAMPLES/bench_atomic.rb
gem uninstall concurrent-ruby -I -a -x

######################################################################
## Rubinius 2.2.7
#echo '###############################################################'

#rvm use rbx-2.2.7@concurrent-ruby-test --create
#gem uninstall concurrent-ruby -I -a -x

#ruby -v

#gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
#ruby $EXAMPLES/bench_atomic.rb
#gem uninstall concurrent-ruby -I -a -x

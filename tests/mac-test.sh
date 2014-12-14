#!/usr/bin/env bash

source "$HOME/.rvm/scripts/rvm"

VERSION="0.8.0.pre1"
EXT_VERSION="0.1.0.pre1"
EXAMPLES="./concurrent-ruby/examples"
PKG="./concurrent-ruby/pkg"

echo "concurrent-ruby-$VERSION.gem"
echo "concurrent-ruby-$VERSION-java.gem"
echo "concurrent-ruby-ext-$EXT_VERSION.gem"

#####################################################################
# Ruby 1.9.3
echo '###############################################################'

rvm use 1.9.3@concurrent-ruby-test --create
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
gem install $PKG/concurrent-ruby-ext-$EXT_VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# Ruby 2.0.0-p598
echo '###############################################################'

rvm use 2.0.0-p598@concurrent-ruby-test --create
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
gem install $PKG/concurrent-ruby-ext-$EXT_VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# Ruby 2.1.5
echo '###############################################################'

rvm use 2.1.5@concurrent-ruby-test --create
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
gem install $PKG/concurrent-ruby-ext-$EXT_VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby-ext -I -a -x
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# JRuby 1.7.16.1
echo '###############################################################'

rvm use jruby-1.7.16.1@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION-java.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

#####################################################################
# Rubinius 2.2.10
echo '###############################################################'

rvm use rbx-2.2.10@concurrent-ruby-test --create
gem uninstall concurrent-ruby -I -a -x

ruby -v

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

gem install $PKG/concurrent-ruby-$VERSION.gem --no-ri --no-rdoc
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/bench_atomic.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_boolean.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
ruby $EXAMPLES/benchmark_atomic_fixnum.rb
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
gem uninstall concurrent-ruby -I -a -x

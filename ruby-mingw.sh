#!/usr/bin/env bash

set -e
echo 'Running ruby-mingw script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'
touch $home/.bash_profile

# Use all available CPU cores for compiling
if [[ $(nproc) -gt 1 ]] && ! grep -q "make -j" $home/.bash_profile; then
  echo 'export MAKE="make -j$(nproc)"' >> $home/.bash_profile
  source $home/.bash_profile
fi

apt-get -y update
apt-get install -y mingw32

# Download mingw-w64 compilers
mingw32='i686-w64-mingw32-gcc-4.7.2-release-linux64_rubenvb.tar.xz'
mingw64='x86_64-w64-mingw32-gcc-4.7.2-release-linux64_rubenvb.tar.xz'

$as_vagrant 'mkdir -p ~/mingw'

if [ ! -d "$home/mingw/mingw32/bin" ]; then
  $as_vagrant "curl -L http://downloads.sourceforge.net/mingw-w64/$mingw32 -o ~/mingw/$mingw32"
  $as_vagrant "tar -C ~/mingw -xf ~/mingw/$mingw32"
fi

if [ ! -d "$home/mingw/mingw64/bin" ]; then
  $as_vagrant "curl -L http://downloads.sourceforge.net/mingw-w64/$mingw64 -o ~/mingw/$mingw64"
  $as_vagrant "tar -C ~/mingw -xf ~/mingw/$mingw64"
fi

# Install wrappers for strip commands
if [ ! -f "$home/mingw/mingw32/bin/i686-w64-mingw32-strip.bin" ]; then
  echo "Install wrapper for i686-w64-mingw32-strip"
  mv $home/mingw/mingw32/bin/i686-w64-mingw32-strip $home/mingw/mingw32/bin/i686-w64-mingw32-strip.bin
  cp /vagrant/bin/strip_wrapper $home/mingw/mingw32/bin/i686-w64-mingw32-strip
fi

if [ ! -f "$home/mingw/mingw64/bin/x86_64-w64-mingw32-strip.bin" ]; then
  echo "Install wrapper for x86_64-w64-mingw32-strip"
  mv $home/mingw/mingw64/bin/x86_64-w64-mingw32-strip $home/mingw/mingw64/bin/x86_64-w64-mingw32-strip.bin
  cp /vagrant/bin/strip_wrapper $home/mingw/mingw64/bin/x86_64-w64-mingw32-strip
fi

if [ ! -f "/usr/bin/i586-mingw32msvc-strip.bin" ]; then
  echo "Install wrapper for i586-mingw32msvc-strip"
  mv /usr/bin/i586-mingw32msvc-strip /usr/bin/i586-mingw32msvc-strip.bin
  cp /vagrant/bin/strip_wrapper /usr/bin/i586-mingw32msvc-strip
fi

# add mingw-w64 to the PATH
mingw_w64_paths="$home/mingw/mingw32/bin:$home/mingw/mingw64/bin"

if ! grep -q $mingw_w64_paths $home/.bash_profile; then
  echo "export PATH=\$PATH:$mingw_w64_paths" >> $home/.bash_profile
fi

#!/usr/bin/env bash

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='mac'
elif [[ "$unamestr" == 'MINGW32_NT_6.1' ]]; then
  platform='windows'
fi

rm -R concurrent-ruby/pkg

vagrant up ubuntu64 --provision
vagrant ssh ubuntu64 --command 'package_all concurrent-ruby'
vagrant halt ubuntu64

vagrant up ubuntu32 --provision
vagrant ssh ubuntu32 --command 'package_native concurrent-ruby'
vagrant halt ubuntu32

vagrant up solaris --provision
vagrant ssh solaris --command 'package_native concurrent-ruby'
vagrant halt solaris

#if [[ $platform == 'mac' ]]; then
  #bin/package_native concurrent-ruby
#fi

#!/usr/bin/env bash

rm -R concurrent-ruby/pkg

vagrant up ubuntu64 --provision
vagrant ssh ubuntu64 --command 'package_all concurrent-ruby'
vagrant halt ubuntu64

vagrant up ubuntu32 --provision
vagrant ssh ubuntu32 --command 'package_native concurrent-ruby'
vagrant halt ubuntu32

#vagrant up solaris --provision
#vagrant ssh solaris --command 'package_native concurrent-ruby'
#vagrant halt solaris

if [[ `uname` == 'Darwin' ]]; then
  ./bin/package_darwin concurrent-ruby
fi

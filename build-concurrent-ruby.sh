#!/usr/bin/env bash

rm -R concurrent-ruby/pkg

vagrant up ubuntu64
vagrant ssh ubuntu64 --command 'package_all concurrent-ruby'
vagrant halt ubuntu64

vagrant up ubuntu32
vagrant ssh ubuntu32 --command 'package_native concurrent-ruby'
vagrant halt ubuntu32

vagrant up solaris
vagrant ssh solaris --command 'package_native concurrent-ruby'
vagrant halt solaris

bin/package_native concurrent-ruby

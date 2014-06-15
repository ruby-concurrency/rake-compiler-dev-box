#!/usr/bin/env bash

tests/mac-test.sh

vagrant up ubuntu64
vagrant ssh ubuntu64 --command '/vagrant/tests/ubuntu64-test.sh'
vagrant halt ubuntu64

vagrant up ubuntu32
vagrant ssh ubuntu32 --command '/vagrant/tests/ubuntu32-test.sh'
vagrant halt ubuntu32

vagrant up solaris
vagrant ssh solaris --command 'sudo /vagrant/tests/solaris-test.sh'
vagrant halt solaris

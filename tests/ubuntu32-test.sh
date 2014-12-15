#!/usr/bin/env bash

source "$HOME/.rvm/scripts/rvm"

TEST_RUNNER="/vagrant/concurrent-ruby/build-tests/runner.rb"

rvm use 2.0.0-p598@concurrent-ruby-test --create
$TEST_RUNNER

rvm use 2.1.5@concurrent-ruby-test --create
$TEST_RUNNER

#rvm use rbx-2.2.10@concurrent-ruby-test --create
#$TEST_RUNNER

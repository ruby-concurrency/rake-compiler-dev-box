#!/usr/bin/env bash

source "$HOME/.rvm/scripts/rvm"

TEST_RUNNER="/vagrant/concurrent-ruby/build-tests/runner.rb"

rvm use ruby-2.2.0@concurrent-ruby-test --create
$TEST_RUNNER

rvm use ruby-1.9.3-p551@concurrent-ruby-test --create
$TEST_RUNNER

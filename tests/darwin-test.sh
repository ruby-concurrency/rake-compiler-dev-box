#!/usr/bin/env bash

source "$HOME/.rvm/scripts/rvm"

TEST_RUNNER="./concurrent-ruby/build-tests/runner.rb"

rvm use ruby-2.2.0@concurrent-ruby-test --create
$TEST_RUNNER

rvm use jruby-1.7.18@concurrent-ruby-test --create
$TEST_RUNNER

rvm use rbx-2.2.10@concurrent-ruby-test --create
$TEST_RUNNER

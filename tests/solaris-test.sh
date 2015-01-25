#!/usr/bin/env bash

TEST_RUNNER="/vagrant/concurrent-ruby/build-tests/runner.rb"

ruby -v

$TEST_RUNNER

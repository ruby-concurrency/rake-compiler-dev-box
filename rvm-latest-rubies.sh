#!/usr/bin/env bash

set -e
echo 'Running rvm-latest-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# install rubies
$as_vagrant 'rvm install 2.1'
$as_vagrant 'rvm install jruby'
$as_vagrant 'rvm install rbx'

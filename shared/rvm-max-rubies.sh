#!/usr/bin/env bash

set -e
echo 'Running rvm-max-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# install rubies
$as_vagrant 'rvm install jruby'
$as_vagrant 'rvm install 2.1'
$as_vagrant 'rvm install 2.0.0'
$as_vagrant 'rvm install 1.9.3'
$as_vagrant 'rvm install 1.8.7'

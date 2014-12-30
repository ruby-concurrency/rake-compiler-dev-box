#!/usr/bin/env bash

set -e
echo 'Running rvm-min-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# update rvm and rubygems
$as_vagrant 'rvm get stable'
$as_vagrant 'gem update --system'

# install rubies
$as_vagrant 'rvm install ruby'
$as_vagrant 'rvm install 2.0.0'

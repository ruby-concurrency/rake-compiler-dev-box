#!/usr/bin/env bash

set -e
echo 'Running rvm-min-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# update rvm and rubygems
$as_vagrant 'rvm get stable'

# install rubies
$as_vagrant 'rvm install ruby-2.2.0'
$as_vagrant 'rvm install ruby-1.9.3-p551'

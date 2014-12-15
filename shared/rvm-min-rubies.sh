#!/usr/bin/env bash

set -e
echo 'Running rvm-min-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# install rubies
$as_vagrant 'rvm install ruby'

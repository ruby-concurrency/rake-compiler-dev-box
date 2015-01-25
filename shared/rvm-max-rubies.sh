#!/usr/bin/env bash

set -e
echo 'Running rvm-max-rubies script...'

as_vagrant='sudo -u vagrant -H bash -l -c'

# update rvm and rubygems
$as_vagrant 'rvm get stable'

# install rubies
$as_vagrant 'rvm install ruby-2.2.0'
$as_vagrant 'rvm install ruby-2.1.5'
$as_vagrant 'rvm install ruby-2.0.0-p598'
$as_vagrant 'rvm install ruby-1.9.3-p551'
$as_vagrant 'rvm install ruby-1.8.7-p374'
$as_vagrant 'rvm install jruby-1.7.18'
# RVM is currently having problems installing Rbx on Ubuntu
#$as_vagrant 'rvm install rbx'


# https://github.com/wayneeseguin/rvm/issues/3218
$as_vagrant 'wget https://github.com/rubygems/rubygems/archive/v2.0.15.tar.gz'
$as_vagrant 'mv v2.0.15.tar.gz ~/.rvm/archives/rubygems-2.0.15.tgz'
$as_vagrant 'rvm install ruby-1.8.7-p374'

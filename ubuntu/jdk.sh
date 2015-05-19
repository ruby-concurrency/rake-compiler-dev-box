#!/usr/bin/env bash

set -e
echo 'Running jdk script...'

# install Oracle Java 8
add-apt-repository ppa:webupd8team/java
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
apt-get -y update
apt-get install -y oracle-java8-installer oracle-java8-set-default ant maven

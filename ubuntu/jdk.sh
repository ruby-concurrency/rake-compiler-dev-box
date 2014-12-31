#!/usr/bin/env bash

set -e
echo 'Running jdk script...'

# install Oracle Java 8
add-apt-repository ppa:webupd8team/java
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
apt-get -y update
apt-get install -y oracle-java8-installer oracle-java8-set-default ant maven

# install maven 3
# http://www.sysads.co.uk/2014/05/install-apache-maven-3-2-1-ubuntu-14-04/
apt-get remove -y maven2
add-apt-repository "deb http://ppa.launchpad.net/natecarlson/maven3/ubuntu precise main"
apt-get -y update
apt-get install -y maven3

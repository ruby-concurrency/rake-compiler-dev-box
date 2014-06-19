#!/usr/bin/env bash

set -e
echo 'Running jdk script...'

as_vagrant='sudo -u vagrant -H bash -l -c'
home='/home/vagrant'
touch $home/.bash_profile

# http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/
# Download latest Java SE Development Kit 8 release from its official download page
echo 'Downloading JDK...'
mkdir -p /opt
cd /opt/
wget --no-cookies \
  --no-check-certificate \
  --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie' \
  --output-document 'jdk-8u5-linux-i586.tar.gz' \
  'http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-i586.tar.gz'

# Now extract downloaded archive file
echo 'Extracting archive...'
tar xzf jdk-8u5-linux-i586.tar.gz

# After extracting archive file use alternatives command to install it
echo 'Install using `alternatives` command...'
cd /opt/jdk1.8.0_05/
alternatives --install /usr/bin/java java /opt/jdk1.8.0_05/bin/java 2
# alternatives --config java

# Setup Environment Variables
echo 'Set environment variables...'
if ! grep -q 'JAVA_HOME' $home/.bash_profile; then
  echo 'export JAVA_HOME=/opt/jdk1.8.0_05' >> $home/.bash_profile
  echo 'JRE_HOME=/opt/jdk1.8.0_05/jre' >> $home/.bash_profile
  echo 'PATH=$PATH:/opt/jdk1.8.0_05/bin:/opt/jdk1.8.0_05/jre/bin' >> $home/.bash_profile
  source $home/.bash_profile
fi

# Check the installed version of java using following command
java -version

echo 'Done.'

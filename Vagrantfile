# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.6'

Vagrant.configure('2') do |config|

  config.vm.define :ubuntu64, primary: true do |cfg|

    cfg.vm.box = 'ubuntu/trusty64'

    cfg.vm.provision :shell, :path => 'ubuntu/bootstrap.sh'
    #cfg.vm.provision :shell, :path => 'ubuntu/jdk.sh'
    cfg.vm.provision :shell, :path => 'ubuntu/ruby-mingw.sh'
    cfg.vm.provision :shell, :path => 'shared/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'shared/rvm-max-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-64'
      v.memory = 2048
      v.cpus = 1
      #v.gui = true
    end

    cfg.vm.synced_folder '../concurrent-ruby', '/home/vagrant/concurrent-ruby'
    cfg.vm.synced_folder '../heroku-tester', '/home/vagrant/heroku-tester'
  end

  config.vm.define :ubuntu32 do |cfg|

    cfg.vm.box = 'ubuntu/trusty32'

    cfg.vm.provision :shell, :path => 'ubuntu/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'shared/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'shared/rvm-min-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-32'
      v.memory = 2048
      v.cpus = 1
      #v.gui = true
    end

    cfg.vm.synced_folder '../concurrent-ruby', '/home/vagrant/concurrent-ruby'
  end

  ## http://www.oracle.com/technetwork/server-storage/solaris11/vmtemplates-vmvirtualbox-1949721.html
  ## http://blog.devork.be/2013/12/vagrant-solaris-python.html
  ## `vagrant package --base "ruby-concurrency-dev-box-solaris-11" --output ./boxes/oracle-solaris-11.box`
  ## https://s3-us-west-2.amazonaws.com/ruby-concurrency-boxes/oracle-solaris-11.box
  config.vm.define 'solaris' do |cfg|

    cfg.vm.box = 'ruby-concurrency/oracle-solaris-11'
    #cfg.vm.box_url = './boxes/oracle-solaris-11.box'

    cfg.vm.provision :shell, :path => 'solaris/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'shared/ruby-install.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-solaris-11'
      v.memory = 2048
      v.cpus = 1
      #v.gui = true
    end
  end

  config.vm.define 'centos64' do |cfg|

    cfg.vm.box = 'box-cutter/centos65'

    cfg.vm.provision :shell, :path => 'centos/bootstrap.sh'
    #cfg.vm.provision :shell, :path => 'centos/jdk.sh'
    cfg.vm.provision :shell, :path => 'shared/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'shared/rvm-max-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-centoss-6_5-64'
      v.memory = 2048
      v.cpus = 1
    end
  end

  config.vm.define 'centos32' do |cfg|

    cfg.vm.box = 'box-cutter/centos65-i386'

    cfg.vm.provision :shell, :path => 'centos/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'shared/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'shared/rvm-min-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-centoss-6_5-32'
      v.memory = 2048
      v.cpus = 1
    end
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version '>= 1.6'

Vagrant.configure('2') do |config|

  config.vm.define :ubuntu64, primary: true do |cfg|

    cfg.vm.box = 'ubuntu/trusty64'

    cfg.vm.provision :shell, :path => 'ubuntu/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'ubuntu/jdk.sh'
    cfg.vm.provision :shell, :path => 'ubuntu/ruby-mingw.sh'
    cfg.vm.provision :shell, :path => 'ubuntu/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'rvm-max-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-64'
      v.memory = 2048
    end
  end

  config.vm.define :ubuntu32 do |cfg|

    cfg.vm.box = 'ubuntu/trusty32'

    cfg.vm.provision :shell, :path => 'ubuntu/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'ubuntu/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'rvm-min-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-32'
      v.memory = 2048
    end
  end

  ## http://www.oracle.com/technetwork/server-storage/solaris11/vmtemplates-vmvirtualbox-1949721.html
  ## http://blog.devork.be/2013/12/vagrant-solaris-python.html
  ## `vagrant package --base "ruby-concurrency-dev-box-solaris-11" --output ./boxes/oracle-solaris-11.box`
  config.vm.define 'solaris' do |cfg|

    #cfg.vm.box = 'ruby-concurrency/oracle-solaris-11'
    cfg.vm.box = 'ruby-concurrency-dev-box-oracle-solaris-11'
    cfg.vm.box_url = './boxes/oracle-solaris-11.box'

    cfg.vm.provision :shell, :path => 'solaris/bootstrap.sh'
    cfg.vm.provision :shell, :path => 'solaris/ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'rvm-latest-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-solaris-11'
      v.memory = 2048
    end
  end
end

Vagrant.require_version '>= 1.6'

Vagrant.configure('2') do |config|

  config.vm.define :ubuntu64, primary: true do |cfg|

    cfg.vm.box = 'ubuntu/trusty64'
    cfg.vm.provision :shell, :path => 'bootstrap.sh'
    cfg.vm.provision :shell, :path => 'jdk.sh'
    cfg.vm.provision :shell, :path => 'ruby-mingw.sh'
    cfg.vm.provision :shell, :path => 'ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'rvm-max-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-64'
      v.memory = 2048
    end
  end

  config.vm.define :ubuntu32 do |cfg|

    cfg.vm.box = 'ubuntu/trusty32'
    cfg.vm.provision :shell, :path => 'bootstrap.sh'
    cfg.vm.provision :shell, :path => 'ruby-rvm.sh'
    cfg.vm.provision :shell, :path => 'rvm-min-rubies.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ruby-concurrency-dev-box-ubuntu-32'
      v.memory = 2048
    end
  end
end

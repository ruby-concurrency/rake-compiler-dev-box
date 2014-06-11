Vagrant.require_version '>= 1.6'

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.provision :shell, :path => 'bootstrap.sh'

  config.vm.provider 'virtualbox' do |v|
    v.name = 'ruby-concurrency-dev-box'
    v.memory = 2048
    v.cpus = 1
  end
end

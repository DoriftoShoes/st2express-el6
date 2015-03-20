VAGRANT_API_VERSION = '2'

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  config.vm.box = 'maestro_RHEL6'
  config.vm.hostname = 'workstation'
  config.vm.boot_timeout = 3000

  config.vm.define 'maestro-dev02' do |q|
  end

  #Configure VirtualBox VM settings
  config.vm.provider :virtualbox do |vb|
    vb.name = 'maestro-dev02'
    vb.memory = '4096'
    vb.cpus = 4
  end

  #Configure network as private
  config.vm.network "private_network", ip: "172.168.90.72"

  #Configure sync folders
  # config.vm.synced_folder '.', '/vagrant', disabled: true
  # config.vm.synced_folder './packs', '/home/maestro/packs', owner: 'maestro', group: 'maestro'
  # config.vm.synced_folder './vagrant', '/home/maestro/vagrant', owner: 'maestro', group: 'maestro'

  #Provision StackStorm
  config.vm.provision :shell, path: 'vagrant/bootstrap.sh'
  config.vm.provision :shell, :inline => "puppet apply /vagrant/fullinstall.pp --debug --verbose"
  config.vm.provision :shell, :inline => "st2ctl reload"
  config.vm.provision :shell, :inline => "st2ctl restart"
end
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "centos65-x86_64-20140116"
    config.vm.hostname = "st2express-el6"

    config.vm.define "st2p-test" do |q|
    end

    config.vm.provider :virtualbox do |vb|
      vb.name = "st2express-el6"
      vb.memory = 4096
      vb.cpus = 2
    end

    # Configure a private network
    config.vm.network "private_network", ip: "172.168.100.51"

    # Start shell provisioning
    config.vm.provision :shell, :path => "bootstrap_puppet.sh"
    config.vm.provision :shell, :inline => "puppet apply /vagrant/fullinstall.pp --debug --verbose"
    config.vm.provision :shell, :inline => "st2ctl reload"
    config.vm.provision :shell, :inline => "st2ctl restart"
end

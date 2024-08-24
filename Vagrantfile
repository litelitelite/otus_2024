# -*- mode: ruby -*-
# vi: set ft=ruby :

home = ENV['HOME']

Vagrant.configure(2) do |config|
  config.vm.define "salt-master" do |main|
    main.vm.network "private_network", adapter: 2, :device => "eth1", auto_config: false, virtualbox__intnet: "internal-net"
    main.vm.network "private_network", adapter: 3, :device => "eth2", ip: '192.168.56.215', netmask: "255.255.255.0"
    main.vm.hostname = "salt-master"
    main.vm.box = "centos/7"
    main.vm.box_version = "2004.01"
    main.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "salt-master"
      virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
      virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  config.vm.define "salt-minion1" do |main|
    main.vm.network "private_network", adapter: 2, :device => "eth1", auto_config: false, virtualbox__intnet: "internal-net"
    main.vm.network "private_network", adapter: 3, :device => "eth2", ip: '192.168.56.216', netmask: "255.255.255.0"
    main.vm.hostname = "salt-minion1"
    main.vm.box = "centos/7"
    main.vm.box_version = "2004.01"
    main.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "salt-minion1"
      virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
      virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  config.vm.define "salt-minion2" do |main|
    main.vm.network "private_network", adapter: 2, :device => "eth1", auto_config: false, virtualbox__intnet: "internal-net"
    main.vm.network "private_network", adapter: 3, :device => "eth2", ip: '192.168.56.217', netmask: "255.255.255.0"
    main.vm.hostname = "salt-minion2"
    main.vm.box = "centos/7"
    main.vm.box_version = "2004.01"
    main.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "salt-minion2"
      virtualbox.customize ["modifyvm", :id, "--memory", "1024"]
      virtualbox.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    mkdir -p ~root/.ssh
    cp ~vagrant/.ssh/auth* ~root/.ssh
  SHELL

  config.vm.provision "ansible" do |ansible|
   ansible.compatibility_mode = "2.0"
   ansible.playbook = "site.yaml"
   ansible.verbose = "false"
   ansible.become = "true"
  end
end
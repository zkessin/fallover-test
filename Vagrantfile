# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/bionic64"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.network "public_network", bridge: ["eno1","wlp58s0", "eth0", "en0", "en0: Wi-Fi (AirPort)"]

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo '192.168.0.2 alpha alpha.ex' >> /etc/hosts
    echo '192.168.0.3 bravo bravo.ex' >> /etc/hosts
    echo '192.168.0.4 charlie charlie.ex' >> /etc/hosts
    echo '192.168.0.5 delta delta.ex' >> /etc/hosts
  SHELL

  config.vm.define "alpha", primary: true do |ex|
    ex.vm.hostname = "alpha"
    ex.vm.network "private_network", ip: "192.168.0.2"

    ex.vm.provision "shell", path: "bootstrap/system.sh"

    ex.vm.provision "shell", inline: <<-SHELL
    cd /vagrant
    mix local.hex --force
    MIX_ENV=prod REPLACE_OS_VARS=true mix do deps.get, compile, release
  SHELL
  end

  config.vm.define "bravo" do |ex|
    ex.vm.hostname = "bravo"
    ex.vm.network "private_network", ip: "192.168.0.3"
  end

  config.vm.define "charlie" do |ex|
    ex.vm.hostname = "charlie"
    ex.vm.network "private_network", ip: "192.168.0.4"
  end
  config.vm.define "delta" do |ex|
    ex.vm.hostname = "delta"
    ex.vm.network "private_network", ip: "192.168.0.5"
  end

  config.vm.provision "shell", inline: <<-SHELL
  su vagrant -c /vagrant/start.sh
  SHELL


end

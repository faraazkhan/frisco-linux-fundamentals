# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#
$script = <<SCRIPT
yum install epel-release -y
yum update -y
yum install git wget vim numactl nmap psmisc vnstat ncdu initscripts htop ack lsof net-tools bind-utils -y
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_version = "1801.02"
  config.vm.provision "shell", inline: $script
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
  config.vm.define "master", primary: true do |master|
    master.vm.network "private_network", ip: "10.1.0.4"
    master.vm.hostname = "friscolinux-master"
  end
  config.vm.define "node0" do |node|
    node.vm.network "private_network", ip: "10.1.0.254"
    node.vm.hostname = "friscolinux-node0"
  end
end



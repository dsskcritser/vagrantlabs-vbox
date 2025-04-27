# -*- mode: ruby -*-
# vi: set ft=ruby :

################################################
### OPENHPC 2.x Virtual Lab 
###
### A Contribution by the Advanced Computer Engineering (ACE) Lab 
### on behalf of the CHPC's HPC Ecosystems Project
###
### Developed by:
### Lara Timm, HPC Engineer (ACE Lab)
### Eugene de Beste, Senior Cloud/HPC Engineer (ACE Lab)
### Bryan Johnston, Senior Technologist (ACE Lab)
###
################################################

Vagrant.configure("2") do |config|

	config.ssh.username = "vagrant"
    config.vm.define "smshost", primary: true do |smshost|

    smshost.vm.box = "rockylinux/9"
    smshost.vm.box_version = "4.0.0" 
    smshost.vm.hostname = "smshost"

    smshost.vm.network "forwarded_port", guest: 22, host: 2299, host_ip: "127.0.0.1", id: "ssh"
    smshost.vm.network "private_network", ip: "172.16.0.2",virtualbox__intnet: "hpcnet"
    smshost.vm.synced_folder "./warewulf-sandbox", "/warewulf", create: true
    smshost.vm.provider "virtualbox" do |vb|
    
      vb.name = "smshost"
      vb.cpus = 2
      vb.memory = "8192"
      vb.gui = false

    end

    smshost.vm.provision "shell" do |s|
      s.inline = "sudo yum install vim git tmux -y; sed -i '/smshost/d' /etc/hosts"
      end

  end

  config.vm.define "compute01", autostart: false do |compute01|

    compute01.vm.box = "file://./compute-node.box"
    compute01.vm.hostname = "compute01"
    compute01.vm.network "private_network", :adapter=>1, ip: "172.16.0.101", mac: "080027F9F3B1", virtualbox__intnet: "hpcnet"
    compute01.vm.communicator = ""

    compute01.vm.provider "virtualbox" do |vb|
    
      vb.name = "compute01"
      vb.cpus = 2
      vb.memory = "3072"
      vb.gui = false

    end

  end

  config.vm.define "compute02", autostart: false do |compute02|

    compute02.vm.box = "file://./compute-node.box"
    compute02.vm.hostname = "compute02"
    compute02.vm.network "private_network", :adapter=>1, ip: "172.16.0.102", mac: "080027F59A31", virtualbox__intnet: "hpcnet"
    compute02.vm.communicator = ""

    compute02.vm.provider "virtualbox" do |vb|
    
      vb.name = "compute02"
      vb.cpus = 2
      vb.memory = "3072"
      vb.gui = false

    end

  end

end

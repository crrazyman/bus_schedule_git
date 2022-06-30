# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
    config.vm.define 'wks' do |wks|
      wks.vm.box = 'generic/centos8'
      wks.vm.provision 'shell', path: 'scripts/prepare_wks.sh'
      wks.vm.network 'private_network', ip: '192.168.33.10'
      wks.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
        vb.cpus = '1'
      end
    end
    config.vm.define 'jenkins' do |jks|
      jks.vm.box = 'generic/centos8'
      jks.vm.provision 'shell', path: 'scripts/jenkins.sh'
      jks.vm.network 'private_network', ip: '192.168.33.11'
      jks.vm.network 'forwarded_port', guest: 8080, host: 8080
      jks.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
        vb.cpus = '1'
      end
    end
    config.vm.define 'staging' do |node|
      node.vm.box = 'generic/centos8'
      node.vm.provision 'shell', path: 'scripts/prepare_agent.sh'
      node.vm.network 'private_network', ip: '192.168.33.12'
      node.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
        vb.cpus = '1'
      end
    end
    config.vm.define 'prod' do |node|
      node.vm.box = 'generic/centos8'
      node.vm.provision 'shell', path: 'scripts/prepare_agent.sh'
      node.vm.network 'private_network', ip: '192.168.33.13'
      node.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
        vb.cpus = '1'
      end
    end
  end
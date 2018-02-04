# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

  # Box
  config.vm.box = "ubuntu/trusty64"

  # Provisioning
  # Update & upgrade, remove system Ruby, NodeJS
  config.vm.provision :shell, path: "provision/install-utilities.sh", privileged: false
  # RVM
  config.vm.provision :shell, path: "provision/install-rvm.sh", args: "stable", privileged: false
  # Ruby 2.3.0
  config.vm.provision :shell, path: "provision/install-ruby.sh", args: "2.3.0 bundler", privileged: false
  # Mailcatcher
  config.vm.provision :shell, path: "provision/install-mailcatcher.sh", privileged: false
  # PostgreSQL
  config.vm.provision :shell, path: "provision/install-pgsql.sh", args: "9.3", privileged: false

  # Ports Forwarded
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # Rails
  config.vm.network "forwarded_port", guest: 1080, host: 1080 # Mailcatcher
  config.vm.network "forwarded_port", guest: 5432, host: 5432 # PostgreSQL

end

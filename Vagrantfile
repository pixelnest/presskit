# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Misc.
  config.vm.hostname = 'presskit'
  config.vm.network :forwarded_port, host: 3003, guest: 80

  # Provisioning.
  config.vm.provision "shell", path: "up.sh"
end

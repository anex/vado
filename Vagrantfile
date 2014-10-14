# -*- mode: ruby -*-

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

vms = {
  "test.aphu.com.ve" => "192.168.42.5",
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  vms.each do | name, ip |
    config.vm.define name do | machine |
      machine.vm.box = "debian7"
      machine.vm.box_check_update = false
      machine.vm.network "private_network", ip: ip
      machine.vm.hostname = name
      
      # This sections fail in Debian Wheezy, please report and solve.
      # Require nfs-kernel-server package in Debian
      machine.nfs.map_uid = 0
      machine.nfs.map_gid = 0
      
      machine.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--name", name ]
      end
    end
  end
end

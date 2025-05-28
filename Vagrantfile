Vagrant.configure("2") do |config|
  config.vm.box = "alvistack/ubuntu-20.04"
  config.vm.box_version = "20250526.1.1"


  config.vm.define "VmManual" do |mn|
    mn.vm.hostname = "VmManual"
    mn.vm.network "private_network", ip: "192.168.56.10"
    mn.vm.network "forwarded_port", guest: 8080, host: 8080
    mn.vm.synced_folder "./config", "/home/vagrant/config", create: true
    mn.vm.provider "virtualbox" do |v|
      v.name = "VmManual"
      v.memory = 2048
      v.cpus = 2
      v.check_guest_additions = false
    end
  end

  config.vm.define "VmBash" do |bsh|
    bsh.vm.hostname = "VmBash"
    bsh.vm.network "private_network", ip: "192.168.56.11"
    bsh.vm.network "forwarded_port", guest: 6379, host: 6379
    bsh.vm.synced_folder "./config", "/home/vagrant/config", create: true
    bsh.vm.provision "shell", path: "config/VmBash.sh"
    bsh.vm.provider "virtualbox" do |v|
      v.name = "VmBash"
      v.memory = 2048
      v.cpus = 2
      v.check_guest_additions = false
    end
 end

  config.vm.define "VmAnsible" do |ans|
    ans.vm.hostname = "VmAnsible"
    ans.vm.network "private_network", ip: "192.168.56.12"
    ans.vm.network "forwarded_port", guest: 5432, host: 5432
    ans.vm.synced_folder "./config", "/home/vagrant/config", create: true
    ans.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "config/playbook.yml"
    end
    ans.vm.provider "virtualbox" do |v|
      v.name = "VmAnsible"
      v.memory = 2048
      v.cpus = 2
      v.check_guest_additions = false
    end
  end
end

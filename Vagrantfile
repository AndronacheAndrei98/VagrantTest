Vagrant.configure("2") do |config|
  config.vm.box = "generic-x64/ubuntu2304"
  config.vm.box_version = "4.3.12"
  config.vm.hostname = "VmManual"
  config.vm.define "VmManual"
  config.vm.provider "virtualbox" do |v|
    v.name= "VmManual"
    v.memory = 2048
    v.cpus = 2
    v.check_guest_additions = false
  end
end


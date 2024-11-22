Vagrant.configure("2") do |config|
    config.vm.define "dev" do |dev|
        dev.vm.box = "ubuntu/jammy64"
        dev.vm.hostname = "dev"
    
        dev.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.cpus = 2
        end
    
        dev.vm.network "private_network", type: "dhcp"
        dev.vm.provision "shell", path: "provision.sh"
        dev.vm.synced_folder ".", "/vagrant"
    end
end

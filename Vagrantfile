Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  # Ansible provisioner configuration
  config.vm.provision "ansible_local" do |ansible|

    ansible.playbook ="provisioning/playbook.yml"

  end
end

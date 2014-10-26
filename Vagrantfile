Vagrant.configure("2") do |config|

    config.vm.define "spellstruck" do |box|
        box.vm.provider :virtualbox do |machine|
            machine.name = "Spellstruck"
            machine.customize ["modifyvm", :id, "--memory", 2048]
        end

        box.vm.box = "ubuntu/trusty64"

        box.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"

        box.vm.network :private_network, ip: "192.168.33.99"

        box.hostsupdater.aliases = [ "spellstruck.nl", "www.spellstruck.nl" ]

        config.ssh.forward_agent = true

        box.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
        end

        box.vm.synced_folder "./", "/vagrant", type: "nfs"
    end
end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  config.vm.box_url = "http://files.vagrantup.com/centos64.box"

  config.vm.define "web" do |web|
    web.vm.box = "centos64"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.222.11"
    web.vm.network :forwarded_port, guest: 80, host: 8808
  end

  config.vm.define "db1" do |db1|
    db1.vm.box = "centos64"
    db1.vm.hostname = "db1"
    db1.vm.network "private_network", ip: "192.168.222.12"
  end

  config.vm.define "db2" do |db2|
    db2.vm.box = "centos64"
    db2.vm.hostname = "db2"
    db2.vm.network "private_network", ip: "192.168.222.13"
  end
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.sudo = true
  end
end

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.synced_folder "working/wwwroot", "/srv/apache/"
  config.vm.provider "virtualbox" do |vb|
    # vb.gui = true
    # vb.memory = "1024"
  end
  config.vm.provision "shell", path: "bootstrap.sh"
end

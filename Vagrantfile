# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$install = <<SCRIPT
set -e 
mkdir -p /opt/bin /var/lib/dotbox
cp /home/core/dotfiles/dotbox.sh /opt/bin/dotbox
chmod +x /opt/bin/dotbox
dotbox bash -i -c 'echo -e \"\033[0;31m <3 \033[0m \"'
sudo chown -R core:core /var/lib/dotbox/dotfiles-latest/root
rsync -av /home/core/dotfiles /var/lib/dotbox/dotfiles-latest/root/
dotbox bash -i -c 'cd /root/dotfiles && ./install.sh'
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "yungsang/coreos"
  config.vm.provision "shell", inline: $install

  config.vm.synced_folder ".", "/home/core/dotfiles"
#  config.vm.network "private_network", ip: "192.168.33.10"
#  config.vm.box_check_update = false
#  config.ssh.forward_agent = true

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end

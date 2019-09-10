# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box_check_update = false
    config.vbguest.auto_update = false

    config.vm.define :bionic do |machine|
        machine.vm.box = "ubuntu/xenial64"
        machine.vm.network "private_network", ip: "192.168.33.10"
        machine.vm.synced_folder ".", "/home/vagrant/promptlib-zsh"

        machine.vm.provider "virtualbox" do |vb|
            vb.gui = false
            vb.memory = 512
        end

        machine.vm.provision "shell", privileged: false, inline: <<-SHELL
            sudo apt-get update
            sudo apt-get install -y wget ca-certificates

            wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
            sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
            sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
            sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

            sudo apt-get update
            sudo apt-get install -y git zsh mysql-server postgresql postgresql-contrib

            __line_num=$(grep -nr 'vagrant:' /etc/passwd | awk -F':' '{print $1}')
            sudo sed -i "${__line_num}s|/bin/bash|$(which zsh)|g" /etc/passwd

            wget 'https://raw.githubusercontent.com/eendroroy/loki-bootstrap/master/recipes/docker.sh' -O - | bash
            wget 'https://raw.githubusercontent.com/eendroroy/loki-bootstrap/master/recipes/vagrant.sh' -O - | bash
        SHELL
    end
end

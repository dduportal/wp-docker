# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "dduportal/boot2docker"

	# HTTPS/HTTPS
	config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
	config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true
	
	# MySQL (for admin)
	config.vm.network "forwarded_port", guest: 3306, host: 5306, auto_correct: true

	# Build the docker image we'll use to run fig command 
	config.vm.provision "shell", inline: "docker build -t fig /vagrant/"
	config.vm.provision "shell", inline: "docker run -v /vagrant:/vagrant -t fig up -d"

end

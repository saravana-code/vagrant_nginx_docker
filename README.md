# vagrant-nginx-docker
USAGE:
commands should be run in "vagrant directory"
    cd vagrant/centos7

Download the vagrant box using below link:
wget http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-Vagrant-1508-x86_64-01.box


Add the vagrant box 
vagrant box add CentOS-7-Vagrant-1508-x86_64-01.box --name centos7

Now create Vagrantfile needed to start the vm:
 vagrant init
 
 A vagrant file will get created now, replace that vagrant file with the one available on this repo
 vagrant up
 
 login to to vagranx box and do a git clone of this repo.
 
 vagrant ssh
 
Commands should be executed inside docker directory

cd docker

Start environment:

docker-compose up -d

Login in a container:

docker-compose exec <service> bash

Container logs:

docker-compose logs -f -t <service>

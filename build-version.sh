#!/bin/bash

set -ex


mkdir -p ~/.ssh
touch ~/.ssh/id_rsa
touch ~/.ssh/id_rsa.pub
touch ~/.ssh/known_hosts

echo $ID_RSA | base64 -d > ~/.ssh/id_rsa
echo $ID_PUB | base64 -d > ~/.ssh/id_rsa.pub
echo $KNOWN_HOSTS | base64 -d > ~/.ssh/known_hosts.pub

echo $ID_RSA | base64 -d | ssh-add -




cat ~/.ssh/id_rsa

# Cloning magma repo:
git clone -b release/1.9.0 git@bitbucket.org:radtonics/rt-core.git --depth 1

# Install prerequisites
pip3 install ansible fabric3 jsonpickle requests PyYAML
vagrant plugin install vagrant-vbguest vagrant-disksize vagrant-vbguest vagrant-mutate





# Cloning magma repo:
#git clone -b $1 https://github.com/magma/magma --depth 1



# Open up network interfaces for VM
sudo mkdir -p /etc/vbox/
sudo touch /etc/vbox/networks.conf
sudo sh -c "echo '* 192.168.0.0/16' > /etc/vbox/networks.conf"

MAGMA_ROOT=${PWD}/magma

# start building magma
cd ${MAGMA_ROOT}/lte/gateway
sed -i '' 's/1.1.20210928/1.1.20210618/' Vagrantfile

fab $2 package:vcs=git

# copy magma packages to github runner
vagrant ssh -c "cp -r magma-packages /vagrant"

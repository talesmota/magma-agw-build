#!/bin/bash

set -ex

mkdir -p ~/.ssh
touch ~/.ssh/id_rsa
touch ~/.ssh/id_rsa.pub

echo $ID_RSA | base64 -d > ~/.ssh/id_rsa
echo $ID_PUB | base64 -d > ~/.ssh/id_rsa.pub

cat ~/.ssh/id_rsa.pub

# Install prerequisites
#pip3 install ansible fabric3 jsonpickle requests PyYAML
#vagrant plugin install vagrant-vbguest



# Cloning magma repo:
#git clone -b release/1.9.0 git@bitbucket.org:radtonics/rt-core.git --depth 1

# start building magma
cd magma/lte/gateway
sed -i '' 's/1.1.20210928/1.1.20210618/' Vagrantfile
#fab release package:vcs=git

# copy magma packages to github runner
#vagrant ssh -c "cp -r magma-packages /vagrant"

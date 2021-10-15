#!/bin/bash

set -ex

# Install prerequisites
pip3 install ansible fabric3 jsonpickle requests PyYAML
vagrant plugin install vagrant-vbguest

# Cloning magma repo:
git clone -b $1 https://github.com/magma/magma --depth 1

# start building magma
cd lte/gateway
#sed -i '' 's/1.1.20210928/1.1.20210618/' Vagrantfile
fab $2 package:vcs=git

# copy magma packages to github runner
vagrant ssh -c "cp -r magma-packages /vagrant"

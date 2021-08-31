#!/bin/bash

pip3 install ansible fabric3 jsonpickle requests PyYAML
vagrant plugin install vagrant-vbguest

MAGMA_ROOT=${PWD}/magma

# Cloning magma repo:
git clone https://github.com/magma/magma.git --depth 1

cd ${MAGMA_ROOT}/lte/gateway

fab release package:vcs=git

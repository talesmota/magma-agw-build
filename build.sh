#!/bin/bash

MAGMA_ROOT=${PWD}/magma

# Cloning magma repo:
git clone https://github.com/magma/magma.git --depth 1

${MAGMA_ROOT}/lte/gateway/fabfile.py

#!/bin/bash

MAGMA_ROOT=${PWD}/magma

# Cloning magma repo:
git clone https://github.com/magma/magma.git --depth 1

cd ${MAGMA_ROOT}/lte/gateway

fab release package:vcs=git

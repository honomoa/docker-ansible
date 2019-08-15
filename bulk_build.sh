#!/bin/sh

VERSIONS="2.5.15 2.6.18 2.7.12 2.8.0 2.8.1 2.8.2 2.8.3"

for VER in ${VERSIONS}
do
  make build-ansible-${VER}
done
for VER in ${VERSIONS}
do
  make push-ansible-${VER} && make clean-ansible-${VER}
done

make push-base && make clean-base

#!/bin/sh

VERSIONS="2.6.19 2.6.20 2.7.13 2.7.14 2.7.15 2.8.5 2.8.6 2.8.7 2.9.0 2.9.1 2.9.2"

for VER in ${VERSIONS}
do
  make build-ansible-${VER}
done
for VER in ${VERSIONS}
do
  make push-ansible-${VER} && make clean-ansible-${VER}
done

make push-base && make clean-base

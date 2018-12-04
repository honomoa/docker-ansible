#!/bin/sh

ANSIBLE_VERSION=${1:-2.7.4}

docker build \
  --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
  -t honomoa/jenkins-ansible:${ANSIBLE_VERSION}-alpine \
  .

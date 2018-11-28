#!/bin/sh

ANSIBLE_VERSION=2.7.2

docker build \
  --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
  -t honomoa/jenkins-ansible:${ANSIBLE_VERSION}-alpine \
  .

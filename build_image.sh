#!/bin/sh

ANSIBLE_VERSION=2.7.0

docker build \
  --build-arg ANSIBLE_VERSION=${ANSIBLE_VERSION} \
  -t honomoa/docker-jenkins-ansible:${ANSIBLE_VERSION}-alpine \
  .

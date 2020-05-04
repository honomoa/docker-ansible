#!/bin/sh

VERSIONS="2.7.17 2.8.9 2.8.10 2.8.11 2.9.5 2.9.6 2.9.7"

for VERSION in ${VERSIONS}
do
  BUILD_VERSION=${VERSION} make
  BUILD_VERSION=${VERSION} make push
done

#!/bin/sh

VERSIONS="2.7.16 2.8.8 2.9.3 2.9.4"

for VERSION in ${VERSIONS}
do
  BUILD_VERSION=${VERSION} make
  BUILD_VERSION=${VERSION} make push
done

FROM alpine:3.8

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.7.2}

RUN apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ upgrade     && \
    apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ add            \
    python py-pip openssl ca-certificates python-dev libffi-dev openssl-dev build-base         \
    sshpass openssh-client rsync bash git openssh                                           && \
    pip install --upgrade pip                                                               && \
    pip install --upgrade pycrypto cffi ansible==${ANSIBLE_VERSION}                         && \
    rm -rf /tmp/*

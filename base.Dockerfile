FROM alpine:3.8

ENV ALPINE_REPOSITORY=http://dl-cdn.alpinelinux.org/alpine/v3.8/main/

RUN apk --no-cache --repository $ALPINE_REPOSITORY upgrade     && \
    apk --no-cache --repository $ALPINE_REPOSITORY add            \
    python3 openssl ca-certificates python3-dev                   \
      libffi-dev openssl-dev build-base                           \
    sshpass openssh-client rsync bash git openssh              && \
    ln -s /usr/bin/python3 /usr/bin/python                     && \
    pip3 install --upgrade pip                                 && \
    pip3 install --upgrade pycrypto cffi boto3                 && \
    rm -rf /tmp/*

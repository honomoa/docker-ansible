FROM honomoa/ansible:base-alpine3.8

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.7.4}

RUN pip install --upgrade ansible==${ANSIBLE_VERSION}                     && \
    rm -rf /tmp/*                                                         && \
    adduser -D ansible

USER ansible

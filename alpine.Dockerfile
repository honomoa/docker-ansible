ARG REGISTRY_ENDPOINT
FROM ${REGISTRY_ENDPOINT}/ansible:base-alpine3.8                                                                                                                                                                                                         

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION}

RUN pip3 install --upgrade ansible==${ANSIBLE_VERSION}                    && \
    rm -rf /tmp/*

USER ansible

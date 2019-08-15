DOCKER:=docker

.PHONY: build

build: build-ansible-2.8.1 build-ansible-2.8.0 build-ansible-2.7.11 build-ansible-2.6.17 build-ansible-2.5.15

build-base:
		$(DOCKER) build -t honomoa/ansible:base-alpine3.8 -f base.Dockerfile .

build-ansible-%: build-base
		$(DOCKER) build -t honomoa/ansible:$* --build-arg ANSIBLE_VERSION=$* -f Dockerfile .

clean: clean-ansible-2.8.1 clean-ansible-2.8.0 clean-ansible-2.7.11 clean-ansible-2.6.17 clean-ansible-2.5.15

clean-base:
		$(DOCKER) rmi honomoa/ansible:base-alpine3.8 || true

clean-ansible-%:
		$(DOCKER) rmi honomoa/ansible:$* || true

push: push-base push-ansible-2.8.1 push-ansible-2.8.0 push-ansible-2.7.11 push-ansible-2.6.17 push-ansible-2.5.15

push-base:
		$(DOCKER) push honomoa/ansible:base-alpine3.8

push-ansible-%:
		$(DOCKER) push honomoa/ansible:$*

pull: pull-ansible-2.8.1 pull-ansible-2.8.0 pull-ansible-2.7.11 pull-ansible-2.6.17 pull-ansible-2.5.15

pull-ansible-%:
		$(DOCKER) pull honomoa/ansible:$*

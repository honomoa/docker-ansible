
BUILD_VERSION ?= 2.9.4
build-no-cache : NO_CACHE = --no-cache
build-cache : NO_CACHE =

REGISTRY_URL = honomoa

IMAGE_URL_BASE = $(REGISTRY_URL)/ansible:base-alpine3.10
IMAGE_URL_VERSION = $(REGISTRY_URL)/ansible:$(BUILD_VERSION)
IMAGE_URL_LATEST = $(REGISTRY_URL)/ansible:latest

DOCKER:=docker
BUILD_ARG := --build-arg REGISTRY_ENDPOINT=$(REGISTRY_URL) --build-arg ANSIBLE_VERSION=$(BUILD_VERSION)

.DEFAULT_GOAL := build-cache

.PHONY: build
build:
		$(DOCKER) build $(NO_CACHE) -t $(IMAGE_URL_BASE) -f base-alpine3.10.Dockerfile .
		$(DOCKER) build $(BUILD_ARG) $(NO_CACHE) -t $(IMAGE_URL_VERSION) -t $(IMAGE_URL_LATEST) -f alpine.Dockerfile .

.PHONY: build-no-cache
build-no-cache: clean build

.PHONY: build-cache
build-cache: pull build

.PHONY: clean
clean:
		$(DOCKER) rmi $(IMAGE_URL_VERSION) || true
		$(DOCKER) rmi $(IMAGE_URL_BASE) || true
		$(DOCKER) rmi alpine:3.10 || true

.PHONY: pull
pull:
		$(DOCKER) pull $(IMAGE_URL_BASE) || true

.PHONY: push
push:
		$(DOCKER) push $(IMAGE_URL_BASE)
		$(DOCKER) push $(IMAGE_URL_VERSION)
		$(DOCKER) push $(IMAGE_URL_LATEST)

.PHONY: show
show:
	@echo $(IMAGE_URL_VERSION) \
		$(IMAGE_URL_LATEST) \
		$(IMAGE_URL_BASE) \
		alpine:3.10

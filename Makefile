
DOCKER_TAG = $(shell date -u '+%Y%m%d-%H%M')
DOCKER_REPO ?= slayer/idrive
DOCKER_IMAGE ?= $(DOCKER_REPO):$(DOCKER_TAG)
DOCKER_IMAGE_LATEST ?= $(DOCKER_REPO):latest
DOCKERFILE = Dockerfile

.PHONY: all run build push exec backup config up down logs

all: build push

### Docker
build:
	docker build -f $(DOCKERFILE) -t $(DOCKER_IMAGE) .
	docker tag $(DOCKER_IMAGE) $(DOCKER_IMAGE_LATEST)

push:
	docker push $(DOCKER_IMAGE)
	docker push $(DOCKER_IMAGE_LATEST)


init:
	mkdir -p ./config ./backup
	docker-compose exec idrive ./account_setting.pl

config:
	docker-compose exec idrive ./edit_supported_files.pl

backup:
	docker-compose exec idrive ./Backup_Script.pl

sh:
	docker-compose exec idrive bash

up:
	mkdir -p ./config ./backup
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

# run:
# 	docker run --rm \
# 			-it \
# 			--name idrive-backuper \
# 			-v $(PWD)/secrets:/root/secrets/ \
# 			$(DOCKER_IMAGE) /bin/bash
#

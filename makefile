cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

export GIT_COMMIT=$(shell git rev-parse HEAD)
export GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD | sed 's/\//-/g')

.PHONY: all

all:
	@echo "make <cmd>"
	@echo ""
	@echo "commands:"
	@echo "  dev - start wolfpack dev server in docker container"
	@echo "  docker-cleanup - prunes and removes dangling docker images & containers (Note: this will do ALL your docker resources, not just this project)"

dev:
	@docker-compose up --build

docker-cleanup:
	@docker container prune -f
	@docker image prune -f

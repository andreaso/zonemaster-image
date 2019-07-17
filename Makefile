REPOSITORY := 933741135092.dkr.ecr.eu-north-1.amazonaws.com/zonemaster

default:
	@apt-get moo

build:
	docker build --pull --tag "$(REPOSITORY):latest" .

push: build
	docker push "$(REPOSITORY):latest"

.PHONY: default build push

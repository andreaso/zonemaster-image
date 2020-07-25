default:
	@apt-get moo

build:
	docker build --pull --tag "127.0.0.1/zonemaster:latest" .

.PHONY: default build

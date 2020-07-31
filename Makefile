default:
	@apt-get moo

local:
	docker build --pull --tag "127.0.0.1/zonemaster-cli:latest" .

.PHONY: default local

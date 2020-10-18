.PHONY: build
build:
	docker-compose -f docker-compose.dev.yaml build

.PHONY: start
start: build
	docker-compose -f docker-compose.dev.yaml up -d

.PHONY: stop
stop:
	docker-compose -f docker-compose.dev.yaml down

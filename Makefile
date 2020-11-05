.PHONY: build
build:
	docker-compose -f docker-compose.dev.yaml build

.PHONY: start
start: build
	docker-compose -f docker-compose.dev.yaml up -d

.PHONY: start-back
start-back:
	docker-compose -f docker-compose.dev.yaml build backend
	docker-compose -f docker-compose.dev.yaml up -d backend

.PHONY: stop
stop:
	docker-compose -f docker-compose.dev.yaml down

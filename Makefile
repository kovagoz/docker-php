TAG ?= kovagoz/php:7.2-apache

.PHONY: build
build:
	docker build -t $(TAG) --target base .
	docker build -t $(TAG)-dev .

.PHONY: test
test:
	docker run --rm -it $(TAG)

.PHONY: push
push:
	docker push $(TAG)
	docker push $(TAG)-dev

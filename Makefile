TARGET ?= kovagoz/php:7.2-alpine

.PHONY: build
build:
	docker build -t $(TARGET) .

.PHONY: test
test:
	docker run --rm -it $(TARGET)

.PHONY: release
release:
	docker push $(TARGET)

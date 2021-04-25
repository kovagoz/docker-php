FROM php:8.0-apache AS base

ARG DEBIAN_FRONTEND=noninteractive

# Install locales
RUN set -x && \
	apt-get update && \
	apt-get install locales -y --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*

# Install APCu
RUN set -x && \
	mkdir /root/tmp && \
	pear config-set temp_dir /root/tmp && \
	printf "\n" | pecl install apcu-5.1.19 && \
	docker-php-ext-enable apcu

# Install the PDO MySQL driver
RUN docker-php-ext-install pdo_mysql

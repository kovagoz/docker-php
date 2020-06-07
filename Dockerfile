FROM php:7.2-apache AS base

RUN set -x && \
	apt-get update && \
	apt-get install -y --no-install-recommends libpq-dev && \
	docker-php-ext-install pdo_mysql pdo_pgsql && \
	rm -rf /var/lib/apt/lists/*

FROM base AS dev

ARG DEBIAN_FRONTEND=noninteractive

RUN set -x && \
	apt-get update && \
	apt-get install -y --no-install-recommends make zsh git netcat && \
	rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-2.6.1 && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sL https://getcomposer.org/download/1.8.3/composer.phar > /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Install PHPUnit
RUN curl -sL https://phar.phpunit.de/phpunit-8.phar > /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit

# Install PHP_CodeSniffer
RUN curl -sL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar > /usr/local/bin/phpcs
RUN chmod +x /usr/local/bin/phpcs

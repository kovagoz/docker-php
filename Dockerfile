FROM php:7.2-alpine

RUN apk add make zsh --no-cache
RUN docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sL https://getcomposer.org/download/1.8.3/composer.phar > /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Install PHPUnit
RUN curl -sL https://phar.phpunit.de/phpunit-8.phar > /usr/local/bin/phpunit
RUN chmod +x /usr/local/bin/phpunit

# Install PHP_CodeSniffer
RUN curl -sL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar > /usr/local/bin/phpcs
RUN chmod +x /usr/local/bin/phpcs

ENTRYPOINT ["/usr/local/bin/php"]

CMD ["-a"]

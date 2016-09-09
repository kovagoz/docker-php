FROM php:5.6-alpine

RUN set -ex \

    # Install build dependencies
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        openssl-dev \
        g++ \
        make \

    # Install PHP mongo and imagick modules
    && pecl install mongo \
    && docker-php-ext-enable mongo \
    && rm -rf /tmp/pear \

    # Remove build dependencies
    && apk del --purge .build-deps

CMD ["php", "-a"]

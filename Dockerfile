FROM php:7.1.9-apache

COPY resources/docker/app/php.ini /usr/local/etc/php
COPY resources/docker/app/xdebug.ini /usr/local/etc/php/conf.d/xdebug-dev.ini
COPY . /srv/app
COPY resources/docker/app/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN docker-php-ext-install pdo_mysql opcache \
    && pecl install xdebug-2.5.1 \
    && docker-php-ext-enable xdebug \
    && a2enmod rewrite
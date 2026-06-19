FROM php:8-apache

RUN apt update && apt upgrade -y

RUN apt install -y libpq-dev

RUN docker-php-ext-install pdo_pgsql pgsql mysqli pdo_mysql

RUN pecl install redis

RUN docker-php-ext-enable redis

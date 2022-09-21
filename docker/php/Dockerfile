FROM php:8.1-fpm

COPY conf /usr/local/etc/php/conf.d

# install composer
RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer
RUN apt-get update && apt-get install -y git zip unzip vim

RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo_mysql pdo_pgsql

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

WORKDIR /var/www/html

EXPOSE 9001
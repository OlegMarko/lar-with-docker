FROM php:7.3-fpm

RUN apt-get update -y \
    && apt-get install -y libmcrypt-dev mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pdo_mysql

WORKDIR /var/www

COPY . /var/www

RUN chown -R www-data:www-data \
        /var/www/storage \
        /var/www/bootstrap/cache

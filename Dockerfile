FROM php:5.6

RUN apt-get update -yqq \
&& apt-get install git wget unzip zlibc zlib1g zlib1g-dev libxml2-dev libssl-dev mongodb-server -yqq
RUN docker-php-ext-install pdo_mysql \
&& docker-php-ext-install mbstring \
&& docker-php-ext-install zip \
&& docker-php-ext-install soap \
&& docker-php-ext-install opcache
RUN pecl install xdebug

RUN docker-php-ext-enable xdebug

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

RUN printf "%s\n" \
        "date.timezone = \"America/Chicago\"" \
        >> /usr/local/etc/php/conf.d/timezone.ini
FROM php:8.3.8-fpm

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    # curl \
    # git \
    libcurl4-openssl-dev \
    libexif-dev \
    libfreetype6-dev \
    libgd-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libonig-dev \
    libpng-dev \
    libpq-dev \
    libssl-dev \
    libzip-dev \
    zlib1g-dev

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install -j$(nproc) \
    curl \
    exif \
    fileinfo \
    gd \
    intl \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    zip

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY /config/php.ini /usr/local/etc/php/

ENTRYPOINT [ "php-fpm" ]
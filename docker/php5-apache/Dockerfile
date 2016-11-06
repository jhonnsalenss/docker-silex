# Adapted from webgriffe/php-apache-base

FROM php:5.6-apache
MAINTAINER Jhonn Salenss <jhonnsalenss@gmail.com>

RUN apt-get update

# Install GD
#RUN apt-get install -y \
#    libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install gd

# Install MCrypt
#RUN apt-get install -y libmcrypt-dev \
#    && docker-php-ext-install mcrypt

# Install Intl
#RUN apt-get install -y libicu-dev \
#    && docker-php-ext-install intl

# Install XDebug
ENV XDEBUG_ENABLE 0
RUN pecl install -o -f xdebug \
    && rm -rf /tmp/pear
COPY ./99-xdebug.ini.disabled /usr/local/etc/php/conf.d/

# Install Mysql
RUN docker-php-ext-install mysql mysqli pdo_mysql
RUN apt-get install -y mysql-client


# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install mbstring
#RUN docker-php-ext-install mbstring

# Install soap
#RUN apt-get install -y libxml2-dev \
#    && docker-php-ext-install soap

# Install opcache
RUN docker-php-ext-install opcache

# Install PHP zip extension
#RUN docker-php-ext-install zip

# Install Git
RUN apt-get install -y git

# Install xsl
#RUN apt-get install -y libxslt-dev \
#    && docker-php-ext-install xsl

# Define PHP_TIMEZONE env variable
#ENV PHP_TIMEZONE Europe/Rome
#ENV PHP_TIMEZONE America/La_Paz
# Let's set the default timezone in both cli and apache configs
#RUN sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ America\/La_Paz/' /etc/php5/apache2/php.ini
    #sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ America\/La_Paz/' /etc/php5/cli/php.ini &&

# Install editor
RUN apt-get install -y nano

# Configure Apache Document Root
ENV APACHE_DOC_ROOT /var/www/html
WORKDIR $APACHE_DOC_ROOT
RUN chown -R www-data:www-data $APACHE_DOC_ROOT

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Additional PHP ini configuration
COPY ./999-php.ini /usr/local/etc/php/conf.d/


# Sample index.php with phpinfo() and entrypoint
#COPY ./index.php /var/www/html/index.php


ADD ./vhost.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite vhost.conf

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
########################################################################################################################

# Start!
COPY ./start.sh /usr/local/bin/start
RUN chmod 755 /usr/local/bin/start
CMD ["start"]

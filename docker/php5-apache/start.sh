#!/usr/bin/env bash

set -e

# Configure PHP date.timezone
#echo "date.timezone = $PHP_TIMEZONE" > /usr/local/etc/php/conf.d/timezone.ini

# Configure Apache Document Root
#mkdir -p $APACHE_DOC_ROOT
#chown www-data:www-data $APACHE_DOC_ROOT

# Enable XDebug if needed
if [ "$XDEBUG_ENABLE" = "1" ]; then
    docker-php-ext-enable xdebug
    mv /usr/local/etc/php/conf.d/99-xdebug.ini.disabled /usr/local/etc/php/conf.d/99-xdebug.ini
    # Configure XDebug remote host
    if [ -z "$HOST_IP" ]; then
        # Allows to set HOST_IP by env variable because could be different from the one which come from ip route command
        HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
    fi;
    echo "xdebug.remote_host=$HOST_IP" > /usr/local/etc/php/conf.d/xdebug_remote_host.ini
fi;

exec "apache2-foreground"

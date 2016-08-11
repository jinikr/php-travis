#!/bin/bash
export FPM_LISTEN=${FPM_LISTEN:-"0.0.0.0:9000"}
export FPM_USER=${FPM_USER:-"www-data"}
export FPM_GROUP=${FPM_GROUP:-"www-data"}
export USE_DOCKERIZE=${USE_DOCKERIZE:-"yes"}
export PHP_INI_DIR=${PHP_INI_DIR:-"/etc/php"}
export EXTRACONF=${EXTRACONF:-";"}

dockerize -template /etc/php/php-fpm.tmpl > /etc/php/php-fpm.conf

export UPSTREAM=${UPSTREAM:-"localhost:9000"}
export DOMAIN=${DOMAIN:-"localhost"}
export LOCATION=${LOCATION:-"#ADD_LOCATION"}
export USE_DOCKERIZE=${USE_DOCKERIZE:-"yes"}
export WEBROOT=${WEBROOT:-"/var/www/public"}

rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-available/default-ssl

mkdir -p /etc/nginx/sites-available

if [ $USE_SSL ];
then
    dockerize -template /etc/nginx/default-ssl.tmpl > /etc/nginx/sites-available/default-ssl
fi

if [ $USE_SSL != "only" ];
then
	dockerize -template /etc/nginx/default.tmpl > /etc/nginx/sites-available/default
fi

nginx &

/usr/local/sbin/php-fpm-env >> /etc/php/php-fpm.conf
/usr/local/sbin/php-fpm -c ${PHP_INI_DIR} --nodaemonize

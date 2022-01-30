#!/bin/sh
chown www-data:root -R /var/www/html
chown www-data:www-data .htaccess

/entrypoint.sh apache2-foreground


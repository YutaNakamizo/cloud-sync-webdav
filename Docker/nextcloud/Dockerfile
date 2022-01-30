FROM nextcloud:stable-apache

COPY ./entrypoint.sh /usr/src/app/
RUN chmod 744 /usr/src/app/entrypoint.sh

ENTRYPOINT "/usr/src/app/entrypoint.sh"

WORKDIR /var/www/html/


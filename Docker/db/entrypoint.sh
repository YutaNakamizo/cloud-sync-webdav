#!/bin/sh
chown mysql:mysql -R /var/lib/mysql

/usr/local/bin/docker-entrypoint.sh mariadbd --skip-innodb-read-only-compressed


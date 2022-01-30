FROM mariadb:10-focal

WORKDIR /usr/src/mariadb/
COPY ./entrypoint.sh .
RUN chmod 744 ./entrypoint.sh

ENTRYPOINT "/usr/src/mariadb/entrypoint.sh"

WORKDIR /


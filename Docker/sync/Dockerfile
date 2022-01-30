FROM rclone/rclone:latest

RUN adduser -S rclone-sync
RUN mkdir -p /var/spool/cron/crontabs/
COPY ./cron.d/sync /var/spool/cron/crontabs/rclone-sync

WORKDIR /usr/src/sync/

COPY ./scripts ./scripts

COPY ./entrypoint.sh .
RUN chmod 744 ./entrypoint.sh

ENTRYPOINT "./entrypoint.sh"


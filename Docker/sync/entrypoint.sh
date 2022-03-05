#!/bin/sh

obscure_password=`rclone obscure $SYNC_WEBDAV_PASSWORD`
rclone config create \
  webdav webdav \
  url="http://webdav/" \
  user "$SYNC_WEBDAV_USERNAME" \
  pass "$obscure_password" \
  --config ./config/default/rclone.config

chown rclone-sync:root -R /var/log/rclone-sync
chown root:root /usr/src/sync/config
chown root:root /usr/src/sync/config/default
chown rclone-sync:root /usr/src/sync/config/default/rclone.config

crond -f


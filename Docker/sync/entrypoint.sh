#!/bin/sh

rclone config create \
  samba local \
  --config ./config/default/rclone.config

chown rclone-sync:root -R /var/log/rclone-sync
chown root:root /usr/src/sync/config
chown root:root /usr/src/sync/config/default
chown rclone-sync:root /usr/src/sync/config/default/rclone.config

crond -f


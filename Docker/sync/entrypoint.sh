#!/bin/sh

obscure_password=`rclone obscure $NEXTCLOUD_ADMIN_PASSWORD`
rclone config create \
  nextcloud webdav \
  url="http://nextcloud/remote.php/dav/files/$NEXTCLOUD_ADMIN_USER/" \
  vendor "nextcloud" \
  user "$NEXTCLOUD_ADMIN_USER" \
  pass "$obscure_password" \
  --config ./config/default/rclone.config

crond -f


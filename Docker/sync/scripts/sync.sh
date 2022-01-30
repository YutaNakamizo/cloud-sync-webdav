#!/bin/sh

log_file=/var/log/rclone-sync/rclone-sync.log
ROOT=/usr/src/sync

add_log () {
  msg="[$(date)] $*"
  echo $msg >> $log_file
  echo $msg
}

add_log "Start exec rclone."

# Check file "targets" exists
targets="$ROOT/config/from-nextcloud/targets"
if [ ! -e $targets ]; then
  add_log "File \"targets\" does not exist."
  exit 1
fi

# Exec rclone for each target
cat $targets | while read line; do
  add_log "rclone $line"
  add_log `rclone $line -vv --config "$ROOT/config/default/rclone.config"`
done

add_log "Finished exec rclone."


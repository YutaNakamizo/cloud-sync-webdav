#!/bin/sh

log_file=/var/log/rclone-sync/rclone-sync.log
ROOT=/usr/src/sync

add_log () {
  msg="[$(date)] $*"
  echo $msg >> $log_file
  echo $msg
}

if [ -e ./sync.pid ]; then
  add_log "Skipping jobs (still working)"
  exit 1
fi

echo $$ > ./sync.pid

add_log "Start exec rclone."

# Check file "targets" exists
targets="$ROOT/config/share/targets"
if [ ! -e $targets ]; then
  add_log "File \"targets\" does not exist."
  rm ./sync.pid
  exit 1
fi

# Exec rclone for each target
cat $targets | while read line; do
  command=`echo $line | sed -e 's/local:\//local:\/share\/Root\//'`
  add_log $line
  add_log "rclone $command"
  add_log `rclone $command -vv --config "$ROOT/config/default/rclone.config"`
done

rm ./sync.pid

add_log "Finished exec rclone."


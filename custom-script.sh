#!/bin/sh

echo "Running custom script with $PUID and $PGID"

echo "Create borg-data directory"

mkdir -p /borg-data

echo "Change owner of borg-data directory"

chown -R $PUID:$PGID /borg-data

echo "Scheduling cronjob with $CRON_TIME"

echo "$CRON_TIME /backup-script" > /etc/crontabs/abc
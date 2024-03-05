#!/bin/sh

echo "Running CRON Job with time $CRON_TIME"

echo "$CRON_TIME /backup-script" > /etc/crontabs/root

crond -f -l 8
#!/bin/sh

echo "$CRON_TIME /backup-script" > /etc/crontabs/root

crond -f -l 8
#!/bin/sh

echo "Scheduling backup script with schedule $CRON_TIME"
echo "$CRON_TIME BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes BORG_BASE_DIR=/borg-data /backup-script" > /etc/crontabs/root
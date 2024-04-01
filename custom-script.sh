#!/bin/sh

echo "Running custom script with cron schedule $CRON_TIME"

echo "Create upload and backup directories"
mkdir -p $BACKUP_PATH $UPLOAD_LOCATION

echo "Borg environment variables"
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes
export BORG_BASE_DIR=/borg-data

echo "Scheduling backup script"
echo "$CRON_TIME /backup-script" > /etc/crontabs/root
#!/bin/sh

echo "Running custom script with cron schedule $CRON_TIME"

echo "Creating upload and backup directories"
mkdir -p $BACKUP_PATH $UPLOAD_LOCATION

echo "Setting Borg environment variables"
export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes
export BORG_BASE_DIR=/borg-data

echo "Downloading backup script"
wget $BORG_BACKUP_SCRIPT -O /backup-script && chmod +x /backup-script

echo "Scheduling backup script"
echo "$CRON_TIME /backup-script" > /etc/crontabs/root
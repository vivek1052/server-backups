#!/bin/sh

echo "Running custom script with cron schedule $CRON_TIME"

echo "Creating upload and backup directories"
mkdir -p $BACKUP_PATH $UPLOAD_LOCATION

echo "Downloading backup script"
wget $BORG_BACKUP_SCRIPT -O /backup-script && chmod +x /backup-script

echo "Scheduling backup script"
echo "$CRON_TIME BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes BORG_BASE_DIR=/borg-data /backup-script" > /etc/crontabs/root
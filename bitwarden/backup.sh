#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/bitwarden-borg"

mkdir -p $BORG_DATA_PATH

export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes

export BORG_BASE_DIR=$BORG_DATA_PATH

borg init --encryption=none "$BACKUP_PATH/bitwarden-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/bitwarden-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune --keep-weekly=4 --keep-monthly=3 $BACKUP_PATH/bitwarden-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/bitwarden-borg

echo "Borg backup complete"
#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/ha-borg"

export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes

export BORG_BASE_DIR=/borg-data

borg init --encryption=none "$BACKUP_PATH/ha-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/ha-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune --keep-weekly=4 --keep-monthly=3 $BACKUP_PATH/ha-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/ha-borg

echo "Borg backup complete"
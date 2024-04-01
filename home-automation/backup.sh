#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/ha-borg"

borg init --encryption=none "$BACKUP_PATH/ha-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/ha-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune $BORG_PRUNE_OPTIONS $BACKUP_PATH/ha-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/ha-borg

echo "Borg backup complete"
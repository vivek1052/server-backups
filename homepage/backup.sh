#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/homepage-borg"

borg init --encryption=none "$BACKUP_PATH/homepage-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/homepage-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune $BORG_PRUNE_OPTIONS $BACKUP_PATH/homepage-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/homepage-borg

echo "Borg backup complete"
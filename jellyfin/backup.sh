#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/jellyfin-borg"

borg init --encryption=none "$BACKUP_PATH/jellyfin-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/jellyfin-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune $BORG_PRUNE_OPTIONS $BACKUP_PATH/jellyfin-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/jellyfin-borg

echo "Borg backup complete"
#!/bin/sh

echo "Starting backup at $(date)"

mkdir -p "$BACKUP_PATH/npm-borg"

borg init --encryption=none "$BACKUP_PATH/npm-borg"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/npm-borg::{now} $UPLOAD_LOCATION

echo "Pruning old backups"

borg prune $BORG_PRUNE_OPTIONS $BACKUP_PATH/npm-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/npm-borg

echo "Borg backup complete"
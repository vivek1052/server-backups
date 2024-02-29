#!/bin/sh

echo "Starting backup at $(TZ=$TZ date)"

mkdir -p "$BACKUP_PATH/immich-borg"

mkdir -p "$UPLOAD_LOCATION/database-backup"

borg init --encryption=none "$BACKUP_PATH/immich-borg"

export PGPASSWORD=$POSTGRES_PASSWORD

echo "Starting database dump"

pg_dumpall -h $POSTGRES_HOST -p $POSTGRES_PORT -c -U $POSTGRES_USER | gzip > $UPLOAD_LOCATION/database-backup/immich-database.sql.gz

echo "Database dump complete"

echo "Starting borg backup"

borg create --stats $BACKUP_PATH/immich-borg::{now} $UPLOAD_LOCATION --exclude $UPLOAD_LOCATION/thumbs/ --exclude $UPLOAD_LOCATION/encoded-video/

echo "Pruning old backups"

borg prune --keep-weekly=4 --keep-monthly=3 $BACKUP_PATH/immich-borg

echo "Compacting backup"

borg compact $BACKUP_PATH/immich-borg

echo "Borg backup complete"
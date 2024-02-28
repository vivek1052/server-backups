#!/bin/sh

echo "Starting backup at $(TZ=$TZ date)"

mkdir -p /backup/immich-borg

mkdir -p /upload/database-backup

borg init --encryption=none /backup/immich-borg

pg_dumpall -h $POSTGRES_HOST -c -U $POSTGRES_USER | gzip > /upload/database-backup/immich-database.sql.gz


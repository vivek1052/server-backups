FROM alpine:3.16

# Cron Details
ENV CRON_TIME "*/1 * * * *"

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

# Borg
ENV BORG_DATA_PATH /borg-data

RUN apk add --no-cache borgbackup busybox-initscripts openrc wget gzip tzdata

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/bitwarden/backup.sh -O /backup-script && chmod +x /backup-script

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/bitwarden/entrypoint.sh -O /entrypoint && chmod +x /entrypoint

CMD ["/entrypoint"]

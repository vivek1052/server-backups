FROM alpine:3.16

#DB Details
ENV POSTGRES_HOST postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres

# Cron Details
ENV CRON_TIME "*/1 * * * *"

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

# Borg
ENV BORG_DATA_PATH /borg-data


RUN apk add --no-cache postgresql14-client borgbackup busybox-initscripts openrc wget gzip


RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/immich/backup.sh -O /backup-script && chmod +x /backup-script

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/immich/entrypoint.sh -O /entrypoint && chmod +x /entrypoint

CMD ["/entrypoint"]

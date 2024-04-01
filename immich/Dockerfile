FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

#DB Details
ENV POSTGRES_HOST postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres


# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

# Cron Details
ENV DOCKER_MODS=linuxserver/mods:universal-cron
ENV CRON_TIME="00 01 * * *"

# Borg
VOLUME [ "/borg-data" ]
ENV BORG_PRUNE_OPTIONS="--keep-weekly=4 --keep-monthly=3"
ENV BORG_BACKUP_SCRIPT="https://raw.githubusercontent.com/vivek1052/server-backups/main/dummy-backup.sh"

RUN mkdir -p /custom-cont-init.d

RUN apk add --no-cache postgresql14-client borgbackup gzip

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/init.sh -O /custom-cont-init.d/init && chmod +x /custom-cont-init.d/init


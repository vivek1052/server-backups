FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

#Cron detail
ENV CRON_TIME="00 01 * * *"

# Borg
VOLUME [ "/borg-data" ]
ENV BORG_PRUNE_OPTIONS="--keep-weekly=4 --keep-monthly=3"
ENV BORG_BACKUP_SCRIPT="https://raw.githubusercontent.com/vivek1052/server-backups/main/dummy-backup.sh"

RUN mkdir -p /custom-cont-init.d

RUN apk add --no-cache borgbackup

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/init.sh -O /custom-cont-init.d/init && chmod +x /custom-cont-init.d/init


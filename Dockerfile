FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

#Cron detail
ENV CRON_TIME="00 01 * * *"

# Borg
VOLUME [ "/borg-data" ]
ENV BORG_PRUNE_OPTIONS="--keep-weekly=4 --keep-monthly=3"

RUN mkdir -p /custom-cont-init.d

RUN apk add --no-cache borgbackup

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/{service-name}/backup.sh -O /backup-script && chmod +x /backup-script

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/custom-script.sh -O /custom-cont-init.d/custom-script && chmod +x /custom-cont-init.d/custom-script


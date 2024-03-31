FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

# Cron Details
ARG CRON_TIME "*/1 * * * *"

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

# Borg
VOLUME /borg-data
RUN chown abc:abc -R /borg-data


RUN apk add --no-cache borgbackup openrc wget tzdata

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/home-automation/backup.sh -O /backup-script && chmod +x /backup-script

RUN echo "$CRON_TIME /backup-script > /etc/crontabs/abc

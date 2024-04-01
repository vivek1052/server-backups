FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

# Path Details
ENV UPLOAD_LOCATION="/upload"
ENV BACKUP_PATH="/backup"

# Borg
RUN mkdir -p /borg-data/.cache /borg-data/.config 
RUN chown 1000 -R /borg-data
VOLUME /borg-data


RUN apk add --no-cache borgbackup openrc wget tzdata

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/home-automation/backup.sh -O /backup-script && chmod +x /backup-script

RUN echo "55 2 * * * /backup-script" > /etc/crontabs/abc

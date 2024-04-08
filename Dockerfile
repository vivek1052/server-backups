FROM  ghcr.io/linuxserver/baseimage-alpine:3.16

#Install Dependencies
RUN apk add --no-cache postgresql14-client borgbackup gzip

# Path Details
RUN mkdir -p /source /repository /custom-cont-init.d

#Cron detail
ENV CRON_TIME="00 01 * * *"
ENV PRE_COMMANDS=""
ENV POST_COMMANDS=""

# Borg
VOLUME [ "/borg-data" ]
ENV BORG_PRUNE_OPTIONS="--keep-weekly=4 --keep-monthly=3"
ENV BORG_CREATE_OPTIONS=""

#Copy entrypoint script and backup script
COPY ./init.sh /custom-cont-init.d/init
COPY ./backup.sh /backup-script

#Set permissions
RUN chmod +x /custom-cont-init.d/init /backup-script





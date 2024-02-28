FROM alpine:3.7

RUN apk add --no-cache postgresql-client borgbackup busybox-initscripts openrc wget

VOLUME [ "/upload", "/backup" ]

ENV POSTGRES_HOST postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV CRON_TIME "*/1 * * * *"


RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/immich/backup.sh -O /backup-script && chmod +x /backup-script

RUN wget https://raw.githubusercontent.com/vivek1052/server-backups/main/immich/entrypoint.sh -O /entrypoint && chmod +x /entrypoint

CMD ["/entrypoint"]
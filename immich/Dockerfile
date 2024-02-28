FROM alpine:3.7

RUN apk add --no-cache postgresql-client borgbackup busybox-initscripts openrc

VOLUME [ "/upload", "/backup" ]

ENV POSTGRES_HOST postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres


RUN printf "#!/bin/bash \
    \n# This is a bash comment inside the script \
    \nls -l\n" > /etc/periodic/daily/script

RUN chmod -R a+x /etc/periodic/daily

CMD [ "run-parts --test /etc/periodic/daily" ]
FROM postgres:alpine
VOLUME /backup

ADD ./periodic/daily/* /etc/periodic/daily/
COPY ./restore.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/restore.sh


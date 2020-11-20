FROM nextcloud:19.0.5-fpm-alpine

RUN apk add --no-cache supervisor imagemagick \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]

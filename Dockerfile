FROM nextcloud:20.0.8-fpm-alpine

RUN apk add --no-cache supervisor \ 
    imagemagick \
    gnu-libiconv \
    php7-iconv \
  && mkdir /var/log/supervisord /var/run/supervisord

ENV LD_PRELOAD=/usr/lib/preloadable_libiconv.so

COPY supervisord.conf /

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]

FROM wordpress:cli

USER root

RUN apk add --no-cache jpegoptim optipng pngquant nodejs gifsicle \
  && npm install -g svgo

RUN { \
		echo 'memory_limit=512M'; \
	} > /usr/local/etc/php/conf.d/composer-memory-requirements.ini

USER www-data

ENV COMPOSER_MEMORY_LIMIT=-1

RUN wp package install typisttech/image-optimize-command:^0.1.2

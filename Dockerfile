FROM alpine:3.3

ADD repositories /etc/apk

RUN apk --update add bash \
	php7 \
	php7-curl \
	php7-opcache

RUN apk --update add bash \
	autoconf \
	make \
	build-base \
	php7-dev && \
	ln -s /usr/bin/php7 /usr/bin/php && \
	wget -O v0.1.1.tar.gz https://github.com/nikic/php-ast/archive/v0.1.1.tar.gz && \
	tar -zxvf v0.1.1.tar.gz && \
	cd php-ast-0.1.1 && \
	phpize7 && \
	./configure --prefix=/usr --with-php-config=/usr/bin/php-config7 && \
	make -j3 && \
	make install && \
	cd .. && \
	rm -Rf php-ast-0.1.1 && \
	apk del php7-dev \
	autoconf \
	make \
	build-base

ADD ast.ini /etc/php7/conf.d
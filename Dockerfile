FROM alpine:latest

ADD php.ini /etc

RUN apk --update add bash \
	wget \ 
	curl \
	git \
	grep \
	gmp \
	gmp-dev \
	libmcrypt \
	libmcrypt-dev \
	freetype \
	freetype-dev \
	libxpm \
	libxpm-dev \
	libwebp \
	libwebp-dev \
	libjpeg-turbo \
	libjpeg-turbo-dev \
	libjpeg \
	bzip2 \
	libbz2 \
	bzip2-dev \
	openssl \
	openssl-dev \
	krb5 \ 
	krb5-dev \
	libxml2 \
	libxml2-dev \
	build-base \
	tar \
	make \
	autoconf \
	re2c \
	bison \
	curl-dev && \
	wget -O php-7.0.0.tar.gz https://php.net/get/php-7.0.0.tar.gz/from/this/mirror && \
	tar -zxvf php-7.0.0.tar.gz && \
	cd php-7.0.0 && \
	./configure \
    --prefix=/usr \
    --with-config-file-path=/etc \
    --enable-mbstring \
    --enable-zip \
    --enable-bcmath \
    --enable-pcntl \
    --enable-ftp \
    --enable-exif \
    --enable-calendar \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --with-curl \
    --with-mcrypt \
    --with-iconv \
    --with-gmp \
    --with-gd \
    --with-jpeg-dir=/usr \
    --with-webp-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-freetype-dir=/usr \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-openssl \
    --with-zlib=/usr \
    --with-bz2=/usr \
    --with-kerberos=shared,/usr/lib && \
	make -j3 && \
	make install && \
	rm -Rf php-7.0.0 && \
	wget -O v0.1.1.tar.gz https://github.com/nikic/php-ast/archive/v0.1.1.tar.gz && \
	tar -zxvf v0.1.1.tar.gz && \
	cd php-ast-0.1.1 && \
	phpize && \
	./configure && \
	make -j3 && \
	make install && \
	cd $HOME && \
	rm -Rf php-ast-0.1.1 && \
	apk del re2c \ 
	bison \
	curl-dev \
	gmp-dev \
	libmcrypt-dev \
	freetype-dev \
	libxpm-dev \
	libwebp-dev \
	libjpeg-turbo-dev \
	bzip2-dev \
	openssl-dev \
	krb5-dev \
	libxml2-dev \
	build-base \
	tar \
	make \
	autoconf

FROM debian:bullseye

# vendor
RUN apt-get update && \
    apt-get install -y \
    git \
    php php-mysql php-xml php-mbstring php-curl \
    composer

RUN composer config -g repos.packagist composer https://mirrors.aliyun.com/composer/

COPY scm.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/scm.sh

WORKDIR /var/www/app
RUN chown -R www-data:www-data /var/www/

USER www-data
ENTRYPOINT ["scm.sh"]

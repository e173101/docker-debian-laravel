FROM debian:bullseye

# vendor
RUN apt-get update && \
    apt-get install -y \
    git \
    php php-mysql php-xml php-mbstring php-curl \
    composer

COPY scm.sh /usr/local/bin/
WORKDIR /var/www/app
RUN chown www-data:www-data .

USER www-data
ENTRYPOINT ["scm.sh"]

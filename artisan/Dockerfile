FROM debian:bullseye

# vendor
RUN apt-get update && \
    apt-get install -y \
    php php-mysql php-xml php-mbstring php-curl \
    composer

WORKDIR /var/www/app
USER www-data
ENTRYPOINT ["php", "artisan"]

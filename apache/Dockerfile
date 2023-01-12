FROM debian:bullseye

# vendor
RUN apt-get install -y \
    apache2 \
    php php-mysql php-xml php-mbstring php-curl

WORKDIR /var/www/app

RUN a2enmod rewrite
USER www-data
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

USER root
CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]

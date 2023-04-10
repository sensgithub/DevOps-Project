FROM php:8-apache

# Required dependencies
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copy files to web server dir
COPY . /var/www/html/

# Expose HTTP port
EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

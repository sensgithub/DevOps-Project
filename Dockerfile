FROM php:8-apache

LABEL maintainer="svetlan.nikolov@yahoo.com"
LABEL org.label-schema.name="ehospital"
LABEL org.label-schema.description="eHospital Management System"
LABEL org.label-schema.version="1.0"

# Install required PHP extensions
RUN apt-get update -y && apt-get install -y libmariadb-dev
RUN docker-php-ext-install mysqli pdo pdo_mysql
# Copy application files to the container
COPY . /var/www/html/

# Copy Apache configuration file
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80 for Apache
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

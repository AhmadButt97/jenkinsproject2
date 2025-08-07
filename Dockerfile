# Use Ubuntu as the base image
FROM ubuntu:latest

# Metadata
LABEL maintainer="yourname@example.com"
LABEL version="1.0"

# Update packages and install Apache, unzip, wget
RUN apt-get update && \
    apt-get install -y apache2 unzip wget && \
    apt-get clean

# Copy website files (adjust if needed)
COPY . /var/www/html/

# Expose Apache's port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]

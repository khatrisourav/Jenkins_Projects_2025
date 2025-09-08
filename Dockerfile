# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy web files to Apache web root
COPY index.html /var/www/html/
COPY script.js /var/www/html/
COPY style.css /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


# Specify the base image.
FROM ubuntu
# Description 
LABEL description="I am building this image for Apache containers"
LABEL maintainer="Lala Aicha"

# Update packages.
RUN apt -y update

# Install Apache (called apache2 on Ubuntu).
RUN apt -y install apache2

# Copy index file from local into container to a specific location.
COPY index.html /var/www/html/

# This container will listen to port 80.
EXPOSE 80

# Start Apache.
ENTRYPOINT ["/usr/sbin/apache2ctl"]

# Ensure Apache runs in the foreground to keep container attached.
CMD ["-D", "FOREGROUND"]



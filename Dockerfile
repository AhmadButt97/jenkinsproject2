# 1. Use the official CentOS base image
FROM centos

# 2. Add metadata about the image
LABEL maintainer="Ahmadbutt97@gmail.com"

# 3. Install Apache (httpd), unzip, wget
RUN yum clean all && \
    yum -y update && \
    yum -y install httpd unzip wget && \
    yum clean all

# 4. Set working directory
WORKDIR /var/www/html

# 5. Download and unzip the website template
RUN wget -O template.zip https://templatemo.com/tm-zip-files/templatemo_574_mexant.zip && \
    unzip template.zip -d templatemo_574_mexant && \
    cp -rvf templatemo_574_mexant/* . && \
    rm -rf template.zip templatemo_574_mexant

# 6. Expose port 80
EXPOSE 80

# 7. Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


# 8. Expose port 80 to allow HTTP traffic
EXPOSE 80

# 9. Start the Apache web server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

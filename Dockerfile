# 1. Use the official CentOS base image
FROM centos:latest

# 2. Add metadata about the image (e.g., maintainer's contact info)
LABEL maintainer="Ahmadbutt97@gmail.com"

# 3. Install Apache (httpd), zip/unzip utilities, and wget
RUN yum update -y && \
    yum install -y httpd unzip wget && \
    yum clean all

# 4. Set the working directory where the files will be handled
WORKDIR /var/www/html

# 5. Download the template zip file using wget
RUN wget -O template.zip https://templatemo.com/tm-zip-files/templatemo_574_mexant.zip

# 6. Unzip the downloaded template into a subfolder
RUN unzip template.zip -d templatemo_574_mexant

# 7. Copy all contents from the unzipped folder to Apache’s root directory
RUN cp -rvf templatemo_574_mexant/* .

# 8. Expose port 80 to allow HTTP traffic
EXPOSE 80

# 9. Start the Apache web server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

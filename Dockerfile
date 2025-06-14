FROM centos:8

# Install Apache (httpd)
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum install -y httpd && yum clean all

# Create a simple Hello World webpage
RUN echo "<html><body><h1>Hello World</h1></body></html>" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

from ubuntu
RUN apt-get update -y
RUN apt-get install apache2 -y
COPY index.html /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

from ubuntu
RUN sudo apt-get update -y
RUN sudo apt-get install httpd -y
COPY index.html /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80

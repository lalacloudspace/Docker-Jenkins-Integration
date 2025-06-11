FROM amazonlinux:2

LABEL description="I am building this image for a web app"

LABEL maintainer="Lala Aicha"

RUN yum -y update

RUN yum install -y httpd 

COPY index.html /var/www/html/

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/httpd" ]

CMD ["-D", "FOREGROUND"]



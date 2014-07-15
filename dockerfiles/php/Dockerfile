FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

RUN yum install -y php-fpm
RUN sed -i "s#127.0.0.1:9000#9000#g" /etc/php-fpm.d/www.conf

COPY php.ini /etc/
COPY php-fpm.conf /etc/
COPY www.conf /etc/php-fpm.d/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm","-c","/etc/"]

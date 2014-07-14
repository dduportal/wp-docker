FROM centos:centos6
MAINTAINER damien.duportal@gmail.com

COPY nginx.repo /etc/yum.repos.d/
RUN yum install -y nginx \
	&& rm -rf /etc/nginx/*
ADD nginx /etc/nginx

EXPOSE 80 443

CMD ["/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]

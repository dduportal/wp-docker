FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

VOLUME ["/DATA/db"]

RUN yum install -y http://epel.mirrors.ovh.net/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm \
	&& yum install -y hostname pwgen mariadb-server 

COPY entrypoint.sh /
COPY my.cnf /etc/

EXPOSE 3306

CMD ["/bin/bash","/entrypoint.sh"]

FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

# Install EPEL
RUN yum install -y http://epel.mirrors.ovh.net/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm \
	&& yum install -y wget \
	&& mkdir -p /DATA/db /DATA/app

VOLUME ["DATA/db", "DATA/app"]

ADD app /DATA/app
RUN chmod -R 777 /DATA

CMD ["/bin/bash"]

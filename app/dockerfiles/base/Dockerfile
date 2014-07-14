FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

# Install EPEL
RUN yum install -y http://epel.mirrors.ovh.net/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
RUN yum install -y hostname pwgen

RUN mkdir -p /DATA/db /DATA/app
VOLUME ["DATA/mysql", "DATA/app"]

CMD ["/bin/bash"]

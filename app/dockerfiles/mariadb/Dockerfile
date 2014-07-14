FROM app_data:latest
# Image name come from fig
MAINTAINER damien.duportal@gmail.com

VOLUME ["/DATA/db"]

RUN yum install -y mariadb-server 

COPY entrypoint.sh /
COPY my.cnf /etc/

EXPOSE 3306

CMD ["/bin/bash","/entrypoint.sh"]

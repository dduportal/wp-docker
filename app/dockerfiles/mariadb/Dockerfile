FROM app_data:latest
# Image name come from fig
MAINTAINER damien.duportal@gmail.com

VOLUME ["/DATA/db"]

RUN yum install -y hostname mariadb-server 
RUN rm -rf /var/lib/mysql
RUN ln -s /DATA/db /var/lib/mysql 

COPY entrypoint.sh /
COPY my.cnf /etc/

EXPOSE 3306

CMD ["/bin/bash","/entrypoint.sh"]

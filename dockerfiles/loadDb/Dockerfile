FROM tutum/mariadb:latest
MAINTAINER damien.duportal@gmail.com

ADD sqls /sqls
COPY load_scripts.sh /load_scripts.sh

CMD ["/bin/sh","/load_scripts.sh"] 
FROM nginx:1.7.1
MAINTAINER damien.duportal@gmail.com

ENV DOCKER_GEN_VERSION 0.3.3
ENV DOCKER_HOST tcp://10.0.2.15:2375

RUN apt-get update && apt-get install -y wget procps curl
RUN wget https://github.com/jwilder/docker-gen/releases/download/${DOCKER_GEN_VERSION}/docker-gen-linux-amd64-${DOCKER_GEN_VERSION}.tar.gz \
	&& tar xvzf docker-gen-linux-amd64-${DOCKER_GEN_VERSION}.tar.gz \
	&& mv docker-gen /usr/local/bin/ \
	&& chmod a+x /usr/local/bin/docker-gen \
	&& rm -rf *gz
RUN sed -i '/daemon/d' /etc/nginx.conf
#RUN mkdir -p /app /srv/http
#RUN echo "Hello World" > /sapp/index.html

COPY entrypoint.sh /usr/local/bin/
COPY nginx.tmpl /etc/

CMD ["/bin/bash","/usr/local/bin/entrypoint.sh"]

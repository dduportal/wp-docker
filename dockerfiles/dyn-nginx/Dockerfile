FROM nginx:1.7.1
MAINTAINER damien.duportal@gmail.com

ENV DOCKER_GEN_VERSION 0.3.3
ENV DOCKER_HOST tcp://10.0.2.15:2375

RUN apt-get update && apt-get install -y wget procps curl
RUN wget https://github.com/jwilder/docker-gen/releases/download/${DOCKER_GEN_VERSION}/docker-gen-linux-amd64-${DOCKER_GEN_VERSION}.tar.gz \
	&& tar xvzf docker-gen-linux-amd64-${DOCKER_GEN_VERSION}.tar.gz \
	&& mv docker-gen /usr/local/bin/ \
	&& chmod a+x /usr/local/bin/docker-gen \
	&& rm -rf *gz \
	&& sed -i '/daemon/d' /etc/nginx.conf

COPY entrypoint.sh /usr/local/bin/
COPY nginx.tmpl /etc/

# Install Wordpress : static resources only, we remove all php and .htaccess files
WORKDIR /web
RUN curl -L -s -o wordpress.tgz https://fr.wordpress.org/wordpress-4.0-fr_FR.tar.gz \
	&& tar --strip-component=1 -xzf wordpress.tgz \
	&& rm -f wordpress.tgz \
	&& find /web -type f -name "*.php" | xargs rm -f

CMD ["/bin/bash","/usr/local/bin/entrypoint.sh"]

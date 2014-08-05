FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

# Install FIG and docker, using compressed cmd (AUFS / 42 layers...)
RUN curl --insecure -L https://github.com/orchardup/fig/releases/download/0.5.2/linux > /usr/local/bin/fig \
	&& chmod +x /usr/local/bin/fig

# Configure Env
ENV DOCKER_HOST tcp://10.0.2.15:2375

# Copy content
VOLUME ["/vagrant"]
WORKDIR /vagrant

# This container is a chrooted fig
ENTRYPOINT ["/usr/local/bin/fig"]
CMD ["--version"]

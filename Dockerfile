FROM centos:centos7
MAINTAINER damien.duportal@gmail.com

# Install FIG and docker, using compressed cmd (AUFS / 42 layers...)
RUN curl --insecure -L https://github.com/orchardup/fig/releases/download/0.5.0/linux > /usr/local/bin/fig \
	&& curl --insecure -L -o /usr/local/bin/docker https://get.docker.io/builds/Linux/x86_64/docker-latest \
	&& chmod +x /usr/local/bin/fig /usr/local/bin/docker

# Configure Env
ENV DOCKER_HOST tcp://10.0.2.15:2375

# Copy content
ADD app /app
WORKDIR /app

# This container is a chrooted fig
ENTRYPOINT ["/usr/local/bin/fig"]
CMD ["--version"]

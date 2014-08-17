FROM busybox:latest
MAINTAINER damien.duportal@gmail.com

# Delivery of your app
RUN mkdir -p /web
RUN echo "Hello World" > /web/index.html
RUN echo "<?php phpinfo(); ?>" > /web/info.php
RUN touch /web/global.log

# Bases volumes declaration
VOLUME ["/web"]

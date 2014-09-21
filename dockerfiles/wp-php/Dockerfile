FROM dduportal/phpfpm:debian7-1.0
MAINTAINER damien.duportal@gmail.com

WORKDIR /web
# Ensure that we have the root-certificats for curling HTTPS websites.
RUN apt-get update && apt-get install -y ca-certificates curl
RUN curl -L -s -o wordpress.tgz https://fr.wordpress.org/wordpress-4.0-fr_FR.tar.gz \
	&& tar --strip-component=1 -xzf wordpress.tgz \
	&& rm -f wordpress.tgz
COPY wp-config.php /web/

RUN echo '<?php phpinfo(); ?>' > /web/info.php

# Wordpress salting
RUN curl https://api.wordpress.org/secret-key/1.1/salt/ >> /web/wp-config.php


# Tmp workaround for specifying php log level
RUN sed -i 's/^log_level.*=.*$/log_level = debug/g' /etc/php5/fpm/php-fpm.conf


# php-fpm is securing php processes by not loading the user environment
# so we have to "chain" our exporter env. vars one by one in the config
# You can also use the php.ini with EGPCS but not recommended on production servers
RUN echo >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[DB_PASSWORD] = $APP_DB_1_ENV_MARIADB_PASS' >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[DB_NAME] = $DB_NAME' >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[DB_USER] = $DB_USER' >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[DB_HOST] = $APP_DB_1_PORT_3306_TCP_ADDR' >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[DB_CHARSET] = $DB_CHARSET' >> /etc/php5/fpm/pool.d/www.conf
RUN echo 'env[WP_DEBUG] = $WP_DEBUG' >> /etc/php5/fpm/pool.d/www.conf


# Les variables d'envrionnement à fournir ou définir ici en fonction
ENV DB_CHARSET utf8
ENV WP_DEBUG false

COPY entrypoint.sh /usr/bin/
CMD ["/bin/sh", "/usr/bin/entrypoint.sh"]
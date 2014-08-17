#!/bin/bash

# First we start nginx. Note that this is daemonized
/usr/local/nginx/sbin/nginx

/usr/local/bin/docker-gen -only-exposed -watch -notify "/usr/local/nginx/sbin/nginx -s reload" /etc/nginx.tmpl /etc/nginx.conf >>/dev/stdout

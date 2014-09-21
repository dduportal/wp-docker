#!/bin/sh

#docker build -t fig /vagrant/dockerfiles/fig/

. /vagrant/custom-profile

dfig-cli up -d

#!/bin/sh

#docker build -t fig /vagrant/dockerfiles/fig/

. /vagrant/custom-profile

dfig-cli build
dfig-cli up -d
dfig-cli scale php=3

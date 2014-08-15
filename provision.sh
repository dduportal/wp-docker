#!/bin/sh

docker build -t fig /vagrant/dockerfiles/fig/

docker run -v /vagrant:/vagrant fig build
docker run -v /vagrant:/vagrant fig up -d
docker run -v /vagrant:/vagrant fig scale php=3

#!/bin/sh

env | grep DB >> /etc/environment
php5-fpm -R

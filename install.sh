#!/bin/bash

apt-get -y update
apt-get -y install debian-archive-keyring
apt-get -y install curl gnupg apt-transport-https procps

curl -L https://packagecloud.io/varnishcache/varnish41/gpgkey | apt-key add -

tee /etc/apt/sources.list.d/varnishcache_varnish41.list <<EOF
deb https://packagecloud.io/varnishcache/varnish41/debian/ stretch main
deb-src https://packagecloud.io/varnishcache/varnish41/debian/ stretch main
EOF
touch /etc/apt/sources.list.d/varnishcache_varnish41.list

apt-get -y update
apt-get -y install varnish
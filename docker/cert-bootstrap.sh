#!/bin/sh
set -e
. ./host.env

docker build -t udonite/nginx-cert-bootstrap ./nginx-cert-bootstrap
docker run --rm -p 80:80 -d --name nginx-cert-bootstrap \
 --mount type=bind,source=$PWD/public_html,target=/var/www/public_html \
 --env-file=host.env \
 udonite/nginx-cert-bootstrap

trap 'docker stop nginx-cert-bootstrap' EXIT INT HUP TERM

docker run --rm -it \
 --mount type=bind,source=$PWD/public_html,target=/var/www/public_html \
 --mount type=bind,source=$PWD/letsencrypt/etc_letsencrypt,target=/etc/letsencrypt \
 --mount type=bind,source=$PWD/letsencrypt/var_lib_letsencrypt,target=/var/lib/letsencrypt \
 certbot/certbot certonly certonly --webroot -w /var/www/public_html -d ${NGINX_HOST}

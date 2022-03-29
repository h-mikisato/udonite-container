#!/bin/sh
set -e
. ./host.env

podman build -t udonite/nginx-cert-bootstrap ./nginx-cert-bootstrap
podman run --rm -p 80:80 -d --name nginx-cert-bootstrap \
 --mount type=bind,source=$PWD/public_html,target=/var/www/public_html,ro=true,Z \
 --env-file=host.env \
 udonite/nginx-cert-bootstrap

trap 'podman stop nginx-cert-bootstrap' EXIT INT HUP TERM

podman run --rm -it \
 --mount type=bind,source=$PWD/public_html,target=/var/www/public_html,Z \
 --mount type=bind,source=$PWD/letsencrypt/etc_letsencrypt,target=/etc/letsencrypt,Z \
 --mount type=bind,source=$PWD/letsencrypt/var_lib_letsencrypt,target=/var/lib/letsencrypt,Z \
 certbot/certbot certonly --webroot -w /var/www/public_html -d ${NGINX_HOST}

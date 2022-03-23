#!/bin/sh
set -e

sed -i -e "s/__HOST_NAME__/${NGINX_HOST}/g" ./config/default.yaml
exec npm start

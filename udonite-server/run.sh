#!/bin/sh
set -e

sed -i -e "s/__HOST_NAME__/${NGINX_HOST}/g" ./config/default.yaml
echo "# for node-config" > ./config/production.yaml
export NODE_ENV=production
exec npm start

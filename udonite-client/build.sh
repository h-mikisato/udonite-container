#!/bin/sh
set -e

sed -i -e "s/__HOST_NAME__/${NGINX_HOST}/g" ./src/assets/config.yaml
npm run prod
if [ -d /var/www/public_html/udonite ]; then
  rm -r /var/www/public_html/udonite
fi
cd ./dist
mv udonite /var/www/public_html

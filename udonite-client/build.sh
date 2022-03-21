#!/bin/sh
set -e

npm run prod
if [ -d /var/www/public_html/udonite ]; then
  rm -r /var/www/public_html/udonite
fi
cd ./dist
mv udonite /var/www/public_html

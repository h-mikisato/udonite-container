#!/bin/sh
docker build -t udonite/udonite ./udonite-client/
docker run --rm --mount type=bind,source=$PWD/public_html,target=/var/www/public_html udonite/udonite

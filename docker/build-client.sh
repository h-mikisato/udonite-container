#!/bin/sh
set -e
. ./id.env

docker build \
  --build-arg USERNAME=$USERNAME \
  --build-arg USERID=$USERID \
  --build-arg GROUPNAME=$GROUPNAME \
  --build-arg GROUPID=$GROUPID \
  -t udonite/udonite ./udonite-client/
docker run --rm --mount type=bind,source=$PWD/public_html,target=/var/www/public_html udonite/udonite

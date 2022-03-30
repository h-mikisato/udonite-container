#!/bin/sh
set -e
. ./.env

podman build \
  --build-arg USERNAME=$USERNAME \
  --build-arg USERID=$USERID \
  --build-arg GROUPNAME=$GROUPNAME \
  --build-arg GROUPID=$GROUPID \
  -t udonite/udonite-server ./udonite-server/
podman build -t udonite/nginx-prod ./nginx-prod/

if [ -f podman/host.yml ]; then
  rm podman/host.yml
fi

. ./host.env
cat podman/host.yml.template | sed -e s/__HOST_NAME__/${NGINX_HOST}/g > podman/host.yml
chown $USERNAME. podman/host.yml

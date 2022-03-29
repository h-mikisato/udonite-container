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

#!/bin/sh
set -e
. ./.env

podman build \
  --build-arg USERNAME=$USERNAME \
  --build-arg USERID=$USERID \
  --build-arg GROUPNAME=$GROUPNAME \
  --build-arg GROUPID=$GROUPID \
  -t udonite/udonite ./udonite-client/
podman run --rm --userns=keep-id --mount type=bind,source=$PWD/public_html,target=/var/www/public_html,Z \
  --env-file host.env udonite/udonite

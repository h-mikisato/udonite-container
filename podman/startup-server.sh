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

podman play kube ./udonite-pod.yml --configmap podman/host.yml

podman generate systemd -n udonite -f
mv -Z *.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable pod-udonite.service
systemctl enable container-udonite-nginx.service
systemctl enable container-udonite-server.service

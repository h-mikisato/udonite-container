#!/bin/sh
set -e

podman generate systemd -n udonite -f
mv -Z *.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable pod-udonite.service
systemctl enable container-udonite-nginx.service
systemctl enable container-udonite-server.service

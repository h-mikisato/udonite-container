#!/bin/sh
set -e

USERNAME=${SUDO_USER:-`id -un`}
cat ./cron/udonite-podman-maintain.template | sed -e "s|__UDONITE_CONTAINER_DIR__|$PWD|g" | sed -e "s/__UDONITE_CONTAINER_USER__/$USERNAME/g "> /etc/cron.d/udonite-maintain

#!/bin/sh
set -e

cat ./cron/udonite-docker-maintain.template | sed -e "s|__UDONITE_CONTAINER_DIR__|$PWD|g" > /etc/cron.d/udonite-maintain

#!/bin/sh
set -e

echo "USERNAME=`id -un`"$'\n'"USERID=`id -u`"$'\n'"GROUPNAME=`id -gn`"$'\n'"GROUPID=`id -g`" > .env

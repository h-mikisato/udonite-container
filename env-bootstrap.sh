#!/bin/sh
set -e

echo "USERNAME=`id -un`" > .env
echo "USERID=`id -u`" >> .env
echo "GROUPNAME=`id -gn`" >> .env
echo "GROUPID=`id -g`" >> .env

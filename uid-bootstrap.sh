#!/bin/sh
set -e

echo "USERNAME=`id -un`\nUSERID=`id -u`\nGROUPNAME=`id -gn`\nGROUPID=`id -g`" > id.env
